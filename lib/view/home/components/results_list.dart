import 'package:flutter/material.dart';
import 'package:picscope/model/photo.dart';

Expanded resultsPhoto(List<Photo>? photos) {
  return Expanded(
    child: GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      children: List.generate(photos?.length ?? 0, (index) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(photos![index].thumbnailUrl),
              fit: BoxFit.cover,
            ),
          ),
        );
      }),
    ),
  );
}
