import 'package:flutter_test/flutter_test.dart';
import 'package:picscope/model/photo.dart';
import 'package:picscope/view/home/components/image_grid.dart';
import 'package:picscope/view/home/components/image_list.dart';
import 'package:picscope/theme_notifier.dart';

void main() {
  group('ThemeNotifier', () {
    test('toggleTheme', () {
      final themeNotifier = ThemeNotifier();
      final initialTheme = themeNotifier.getTheme();
      themeNotifier.toggleTheme();
      final newTheme = themeNotifier.getTheme();
      expect(initialTheme, isNot(newTheme));
    });

    test('toggleView', () {
      final themeNotifier = ThemeNotifier();
      final initialView = themeNotifier.isListView;
      themeNotifier.toggleView();
      final newView = themeNotifier.isListView;
      expect(initialView, isNot(newView));
    });

    test('getDisplayMode', () {
      final themeNotifier = ThemeNotifier();
      final photos = [
        Photo(
          id: '1',
          url: 'url1',
          fullHDUrl: 'fullHDUrl1',
          thumbnailUrl: 'thumbnailUrl1',
          userName: 'userName1',
        ),
        Photo(
          id: '2',
          url: 'url2',
          fullHDUrl: 'fullHDUrl2',
          thumbnailUrl: 'thumbnailUrl2',
          userName: 'userName2',
        ),
        Photo(
          id: '3',
          url: 'url3',
          fullHDUrl: 'fullHDUrl3',
          thumbnailUrl: 'thumbnailUrl3',
          userName: 'userName3',
        ),
      ];
      final initialDisplay = themeNotifier.getDisplayMode(
        photos: photos,
        // ignore: avoid_types_as_parameter_names
        loadNextPage: (context, bool) {},
        isThereMorePages: false,
      );
      expect(initialDisplay, isInstanceOf<ImageList>());
      themeNotifier.toggleView();
      final newDisplay = themeNotifier.getDisplayMode(
        photos: photos,
        // ignore: avoid_types_as_parameter_names
        loadNextPage: (context, bool) {},
        isThereMorePages: false,
      );
      expect(newDisplay, isInstanceOf<ImageGrid>());
    });
  });
}
