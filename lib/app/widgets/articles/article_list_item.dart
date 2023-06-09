import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ny_articles/app/configs/colors.dart';
import 'package:ny_articles/app/configs/sizes.dart';
import 'package:ny_articles/app/configs/strings.dart';
import 'package:ny_articles/app/models/article_model.dart';
import 'package:ny_articles/app/utils/date_util.dart';
import 'package:ny_articles/app/widgets/articles/article_detail.dart';

// Article list item
class ArticleItem extends StatelessWidget {
  const ArticleItem({required this.article, Key? key}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        // OnTap will route to Article Details view
        Get.to(
          () => ArticleDetail(
            article: article,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(AppSizes.small_3, 0, AppSizes.small_1, 0),
        child: SizedBox(
          height: screenHeight * 0.13,
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(article.mediaThumb ?? AppStrings.thumb),
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.only(right: AppSizes.small_1, left: AppSizes.small_1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      article.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          article.byline,
                          style: const TextStyle(fontStyle: FontStyle.italic, color: AppColors.subText),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                article.section ?? '',
                                style: const TextStyle(color: AppColors.subText),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                                child: Row(
                              children: [
                                const Icon(
                                  Icons.today,
                                  size: 20,
                                  color: AppColors.headingText,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  DateUtil.formatDate(article.publishedDate),
                                  style: const TextStyle(
                                    color: AppColors.subText,
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )),
              const Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.headingText,
                  size: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
