import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:picscope/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:picscope/view/home/home.dart';

void main() {
  testWidgets('MyApp Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => ThemeNotifier(),
        child: Consumer<ThemeNotifier>(
          builder: (context, theme, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Picscope',
              theme: theme.getTheme(),
              home: const HomeView(),
            );
          },
        ),
      ),
    );

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('Picscope'), findsOneWidget);
    expect(find.byType(HomeView), findsOneWidget);
  });
}
