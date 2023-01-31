import 'package:flutter/material.dart';
import 'package:picscope/core/api_client.dart';
import 'package:picscope/model/photo.dart';
import 'package:picscope/shared/basic.dart';
import 'package:picscope/view/base/background.dart';
import 'package:picscope/view/home/components/results_list.dart';
import 'package:picscope/view/home/components/search_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _searchController = TextEditingController();
  List<Photo>? _photos;

  /// Search for photos with the text entered in the search bar
  void _searchPhotos(BuildContext context) async {
    // If the search bar is empty, we do not make the request
    if (_searchController.text.isEmpty) {
      return;
    }
    // We make the request
    final response = await apiClient.searchPhotos(
      query: _searchController.text,
    );
    // We check the response status code
    if (response.statusCode == 200) {
      List<Photo> photos = [];
      List results = response.data["results"];
      // We create a list of Photo objects from the results
      for (var result in results) {
        photos.add(Photo.fromJson(result));
      }
      setState(() {
        _photos = photos;
      });
    } else {
      // If the response status code is not 200, we display an error message
      if (mounted) {
        apiClient.displayMessage(context, "Une erreur est survenue", true);
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Column(
        children: [
          basics.vSpaceMedium,
          searchBar(context, _searchController, _searchPhotos),
          basics.vSpaceMedium,
          resultsPhoto(_photos)
        ],
      ),
    );
  }
}
