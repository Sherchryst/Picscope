import 'package:flutter/material.dart';
import 'package:picscope/model/photo.dart';
import 'package:picscope/responsive.dart';

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
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SizedBox(
          width: responsive.screenWidthPercentage(context, percentage: 0.9),
          height: responsive.screenHeightPercentage(context, percentage: 0.7),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Center(child: CircularProgressIndicator()),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                width:
                    responsive.screenWidthPercentage(context, percentage: 0.9),
                height:
                    responsive.screenHeightPercentage(context, percentage: 0.7),
                child: InteractiveViewer(
                    maxScale: 12,
                    child: Image.network(photos[index].fullHDUrl)),
              ),
            ],
          ),
        ),
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
