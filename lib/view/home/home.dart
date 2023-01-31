import 'package:flutter/material.dart';
import 'package:picscope/core/api_client.dart';
import 'package:picscope/model/photo.dart';
import 'package:picscope/responsive.dart';
import 'package:picscope/shared/basic.dart';
import 'package:picscope/shared/styles.dart';
import 'package:picscope/view/base/background.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _searchController = TextEditingController();
  late List<Photo> _photos;

  /// Search for photos with the text entered in the search bar
  Future<List<Photo>> _searchPhotos(BuildContext context) async {
    if (_searchController.text.isEmpty) {
      return [];
    }

    final response = await apiClient.searchPhotos(
      query: _searchController.text,
    );

    if (response.statusCode == 200) {
      List<Photo> photos = [];
      List results = response.data["results"];

      // Iterate through the results and convert each to a Photo object
      for (var result in results) {
        photos.add(Photo.fromJson(result));
      }

      return photos;
    } else {
      // Display error message if the request failed
      if (mounted) {
        apiClient.displayMessage(context, "Une erreur est survenue", true);
      }
      return [];
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: responsive.isDesktop(context)
                    ? responsive.screenWidthPercentage(context, percentage: 0.6)
                    : responsive.screenWidthPercentage(context,
                        percentage: 0.9),
                child: TextField(
                  controller: _searchController,
                  style: styles.textBody(context),
                  decoration: styles.textFieldDecoraction(context,
                      onPressed: () => _searchPhotos(context)),
                  onSubmitted: (value) => _searchPhotos(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
