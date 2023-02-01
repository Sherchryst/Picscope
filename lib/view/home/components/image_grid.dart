import 'package:flutter/material.dart';
import 'package:picscope/model/photo.dart';
import 'package:picscope/responsive.dart';
import 'package:picscope/view/screen/full_screen.dart';

class ImageGrid extends StatelessWidget {
  final List<Photo>? photos;
  final void Function(BuildContext, bool) loadNextPage;
  final bool isThereMorePages;

  const ImageGrid({
    super.key,
    required this.photos,
    required this.loadNextPage,
    required this.isThereMorePages,
  });

  @override
  Widget build(BuildContext context) {
    final int itemsCount = photos?.length ?? 0;
    return Expanded(
      child: GridView.count(
        crossAxisCount: responsive.isDesktop(context) ? 6 : 3,
        childAspectRatio: 1,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        children: [
          ...gridElements(context, itemsCount, photos),
          if (isThereMorePages) addElements(loadNextPage, context)
        ],
      ),
    );
  }

  List<Widget> gridElements(
      BuildContext context, int itemsCount, List<Photo>? photos) {
    return List.generate(itemsCount, (index) {
      return GestureDetector(
        onTap: () => interactiveDisplay(context, photos, index),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(photos![index].thumbnailUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    });
  }

  Future<dynamic> interactiveDisplay(
      BuildContext context, List<Photo> photos, int index) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenPage(imageUrl: photos[index].url),
      ),
    );
  }

  IconButton addElements(
      void Function(BuildContext, bool) loadNextPage, BuildContext context) {
    return IconButton(
      onPressed: () => loadNextPage(context, true),
      icon: const Icon(Icons.arrow_downward),
    );
  }
}
