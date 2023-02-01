import 'package:flutter/material.dart';
import 'package:picscope/core/api_client.dart';
import 'package:picscope/model/photo.dart';
import 'package:picscope/shared/basic.dart';
import 'package:picscope/theme_notifier.dart';
import 'package:picscope/view/base/background.dart';
import 'package:picscope/view/home/components/search_bar.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _searchController = TextEditingController();
  List<Photo>? _photos;
  int currentPage = 1;
  int totalPages = 0;
  int perPage = 20;

  /// Search for photos with the text entered in the search bar
  void _searchPhotos(BuildContext context, bool isNextPage) async {
    // If the search bar is empty, we do not make the request
    if (_searchController.text.isEmpty) {
      return;
    }
    // If we are loading the next page, we increment the current page,
    // otherwise, we reset the current page to 1
    setState(() {
      currentPage = isNextPage ? currentPage + 1 : 1;
      perPage = isNextPage ? 21 : 20;
    });
    // Make the API request to search for photos
    final response = await apiClient.searchPhotos(
      query: _searchController.text,
      page: currentPage,
      perPage: perPage,
    );
    // Check if the response is successful (HTTP status code 200)
    if (response.statusCode == 200) {
      List<Photo> photos = [];
      List results = response.data["results"];
      // Create a list of `Photo` objects from the results
      for (var result in results) {
        photos.add(Photo.fromJson(result));
      }
      setState(() {
        // If loading the next page, add the new photos to the existing list,
        // otherwise, replace the entire list with the new photos
        _photos = isNextPage ? [..._photos!, ...photos] : photos;
        totalPages = response.data["total_pages"];
      });
    } else {
      // If the response is not successful, display an error message
      if (mounted) {
        apiClient.displayMessage(context, "An error occurred", true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return BackGround(
      child: Column(
        children: [
          basics.vSpaceMedium,
          searchBar(context, _searchController, _searchPhotos),
          basics.vSpaceMedium,
          themeNotifier.getDisplayMode(
              photos: _photos,
              loadNextPage: _searchPhotos,
              isThereMorePages: currentPage < totalPages),
        ],
      ),
    );
  }
}
