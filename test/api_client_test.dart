import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:ny_articles/app/configs/api_end_points.dart';
import 'package:ny_articles/app/models/article_model.dart';
import 'package:ny_articles/app/modules/home/controllers/home_controller.dart';

import 'api_client_test.mocks.dart';

final HomeController homeController = Get.put(HomeController());
final client = MockClient();

@GenerateMocks([http.Client])
void main() {
  var api = Uri.parse(homeController.getArticleUrl(section: APIEndPoints.allSection, period: "1"));
  group('API Client Test', () {
    test('Fetch articles with status 200', () async {
      String res =
          '{"results": [{"id": 1, "title": "Test Title 1", "byline": "Author", "section": "Test Section", "abstract": "Test Abstract","published_date": "2021-12-21","media": [{"type": "image", "media-metadata": [{"url": "https://www.thumbnail.com"}, {"url": "https://www.medium.com"}, {"url": "https://www.image.com"}]}]}]}';

      when(client.get(api)).thenAnswer((_) async => http.Response(res, 200));

      expect(await homeController.getArticles("1"), isA<ArticleModel>());
    });

    test('Fetch articles with status 200 with media-metadata empty or less than 3', () async {
      String res =
          '{"results": [{"id": 1, "title": "Test Title 1", "byline": "Author", "section": "Test Section", "abstract": "Test Abstract","published_date": "2021-12-21","media": [{"type": "image", "media-metadata": []}]}]}';

      when(client.get(api)).thenAnswer((_) async => http.Response(res, 200));

      ArticleModel articles = await homeController.getArticles("1");

      expect(articles, isA<ArticleModel>());
      expect(articles.results?.elementAt(0).mediaThumb.isNotEmpty, true);
      expect(articles.results?.elementAt(0).imageUrl.isNotEmpty, true);
    });

    test('Fetch articles with status 200 without media-metadata', () async {
      String res =
          '{"results": [{"id": 1, "title": "Test Title 1", "byline": "Author", "section": "Test Section", "abstract": "Test Abstract","published_date": "2021-12-21","media": [{"type": "image"}]}]}';

      when(client.get(api)).thenAnswer((_) async => http.Response(res, 200));

      ArticleModel articles = await homeController.getArticles("1");

      expect(articles, isA<ArticleModel>());
      expect(articles.results?.elementAt(0).mediaThumb.isNotEmpty, true);
      expect(articles.results?.elementAt(0).imageUrl.isNotEmpty, true);
    });

    test('Fetch articles with status 200 without media', () async {
      String res =
          '{"results": [{"id": 1, "title": "Test Title 1", "byline": "Author", "section": "Test Section", "abstract": "Test Abstract","published_date": "2021-12-21"}]}';

      when(client.get(api)).thenAnswer((_) async => http.Response(res, 200));

      ArticleModel articles = await homeController.getArticles("1");

      expect(articles, isA<ArticleModel>());
    });
  });
}
