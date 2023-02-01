import 'package:flutter/material.dart';
import 'package:picscope/model/photo.dart';
import 'package:picscope/responsive.dart';
import 'package:picscope/shared/basic.dart';
import 'package:picscope/shared/styles.dart';
import 'package:picscope/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ImageList extends StatelessWidget {
  final List<Photo>? photos;
  final void Function(BuildContext, bool) loadNextPage;
  final bool isThereMorePages;
  ImageList({
    super.key,
    required this.photos,
    required this.loadNextPage,
    required this.isThereMorePages,
  });

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final int itemsCount = photos?.length ?? 0;
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Expanded(
        child: ListView.builder(
      controller: _pageController,
      itemCount: itemsCount + (isThereMorePages ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == itemsCount) {
          return addElements(context, themeNotifier);
        } else {
          return listElements(context, index, themeNotifier);
        }
      },
    ));
  }

  Column listElements(
      BuildContext context, int index, ThemeNotifier themeNotifier) {
    return Column(
      children: [
        elemBoxConstraint(context, headerPost(context, index)),
        imagePost(context, themeNotifier, index),
        elemBoxConstraint(context, footerPost(index)),
        elemBoxConstraint(context, likesPost(context, index)),
        elemBoxConstraint(context, descriptionPost(context, index)),
        elemBoxConstraint(context, const Divider(thickness: 1)),
      ],
    );
  }

  Row footerPost(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: () {
            Share.share(
                "Take a look at this beautiful photo on Picscope! Come and explore the amazing world of photography with us. Follow this link to see the photo: ${photos![index].url} #Picscope #Photography #Discover");
          },
        ),
      ],
    );
  }

  Container imagePost(
      BuildContext context, ThemeNotifier themeNotifier, int index) {
    return Container(
      constraints: BoxConstraints(
        minHeight: responsive.screenHeightPercentage(context, percentage: 0.6),
        maxHeight: responsive.screenHeightPercentage(context, percentage: 0.6),
      ),
      decoration: BoxDecoration(
        color: themeNotifier.isDarkTheme ? Colors.black : Colors.white,
      ),
      child: Image.network(photos![index].url),
    );
  }

  SizedBox elemBoxConstraint(BuildContext context, Widget child) {
    return SizedBox(
      width: responsive.isDesktop(context)
          ? responsive.screenWidthPercentage(context, percentage: 0.6)
          : responsive.screenWidth(context),
      child: child,
    );
  }

  ListTile headerPost(BuildContext context, int index) {
    return ListTile(
        title:
            Text(photos![index].userName, style: styles.textSubtitle(context)),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(photos![index].userAvatar ?? ''),
          backgroundColor: Colors.grey,
        ));
  }

  Container addElements(BuildContext context, ThemeNotifier themeNotifier) {
    return Container(
        width: responsive.screenWidth(context),
        height: responsive.screenHeightPercentage(context, percentage: 0.2),
        decoration: BoxDecoration(
          color: themeNotifier.isDarkTheme ? Colors.black : Colors.white,
        ),
        child: Center(
          child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => loadNextPage(context, true),
          ),
        ));
  }

  Widget descriptionPost(BuildContext context, int index) {
    if (photos![index].description == null) {
      return const SizedBox();
    } else {
      return ListTile(
        title: Text(
          photos![index].description!,
          style: styles.textBody(context),
        ),
      );
    }
  }

  Widget likesPost(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '${photos![index].likes ?? '0'} likes',
          style: styles.textBody(context),
        ),
        basics.hSpaceSmall
      ],
    );
  }
}
