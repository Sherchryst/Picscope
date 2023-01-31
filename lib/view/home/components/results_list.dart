import 'package:flutter/material.dart';
import 'package:picscope/model/photo.dart';
import 'package:picscope/responsive.dart';

Expanded resultsPhoto(
  BuildContext context,
  List<Photo>? photos,
  void Function(BuildContext, bool) loadNextPage,
  bool isThereMorePages,
) {
  final int itemsCount = photos?.length ?? 0;
  return Expanded(
    child: GridView.count(
      crossAxisCount: responsive.isDesktop(context) ? 6 : 3,
      childAspectRatio: 1,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      children: [
        ...gridElements(itemsCount, photos),
        if (isThereMorePages) addElements(loadNextPage, context)
      ],
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

List<Widget> gridElements(int itemsCount, List<Photo>? photos) {
  return List.generate(itemsCount, (index) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(photos![index].thumbnailUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  });
}
