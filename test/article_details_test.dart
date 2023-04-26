import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:ny_articles/app/models/article_model.dart';
import 'package:ny_articles/app/widgets/articles/article_detail.dart';

// initiate Article Items
Widget missingArticleItemWidget = GetMaterialApp(
  home: Material(
    child: ArticleDetail(
        article: Article(
      id: 1,
      title: 'Title',
      byline: 'Author',
    )),
  ), // only required fields
);

Widget fullArticleItemWidget = GetMaterialApp(
  home: Material(
    child: ArticleDetail(
      article: Article(
          id: 2,
          title: 'Title',
          byline: 'Author',
          section: 'Section',
          resultAbstract: 'Abstract',
          thumb: 'Thumbnail',
          image: 'ImagePath'), // All fields
    ),
  ),
);

void main() {
  group('Article Details Tests', () {
    testWidgets('Missing Fields Test', (WidgetTester tester) async {
      // Use this to avoid HttpClient error (mock network images)
      mockNetworkImagesFor(() => tester.pumpWidget(missingArticleItemWidget).then((value) {
            // Widget Tests
            expect(find.byType(Text), findsNWidgets(5));
            expect(find.byType(Image), findsNothing);
            // Text tests
            expect(find.text('Title'), findsOneWidget);
            expect(find.text('Author'), findsOneWidget);
            expect(find.text('Abstract'), findsNothing);
          }));
    });

    testWidgets('Complete Fields Test', (WidgetTester tester) async {
      // Use this to avoid HttpClient error (mock network images)
      mockNetworkImagesFor(() => tester.pumpWidget(fullArticleItemWidget).then((value) {
            // Widget Tests
            expect(find.byType(Text), findsNWidgets(5));
            // Text tests
            expect(find.text('Title'), findsOneWidget);
          }));
    });
  });
}
