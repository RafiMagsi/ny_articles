import 'package:flutter/material.dart';
import 'package:ny_articles/app/configs/colors.dart';
import 'package:ny_articles/app/configs/strings.dart';
import 'package:ny_articles/app/models/article_model.dart';
import 'package:ny_articles/app/utils/date_util.dart';

class ArticleDetail extends StatelessWidget {
  const ArticleDetail({required this.article, Key? key}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.detailTitle),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              article.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          article.imageUrl.isNotEmpty ? Image(image: NetworkImage(article.imageUrl)) : Container(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(article.resultAbstract ?? ''),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  article.byline ?? '',
                  style: const TextStyle(fontStyle: FontStyle.italic, color: AppColors.headingText),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.today,
                      color: AppColors.subText,
                      size: 20,
                    ),
                    Text(
                      DateUtil.formatDate(article.publishedDate),
                      style: const TextStyle(color: AppColors.subText),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
