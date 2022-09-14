import 'package:clean_architecture/features/show_news/domain/entities/news_info.dart';
import 'package:clean_architecture/features/show_news/presentation/pages/news_view_page.dart';
import 'package:flutter/material.dart';

import 'package:clean_architecture/core/constants/palette.dart';

class NewsCard extends StatelessWidget {
  final NewsInfo newsInfo;
  const NewsCard({super.key, required this.newsInfo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NewsPageView(
            newsInfo: newsInfo,
          );
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        height: 300,
        width: MediaQuery.of(context).size.width - (2 * 16),
        child: Stack(
          children: [
            Container(
              height: 260,
              color: Palette.lightGray,
              child: newsInfo.imageURL != null
                  ? Image.network(
                      newsInfo.imageURL!,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      'https://www.rd.com/wp-content/uploads/2021/04/GettyImages-476744133-scaled.jpg',
                      fit: BoxFit.cover,
                    ),
            ),
            Positioned(
              bottom: 0,
              left: 16,
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width - (2 * 32),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      color: Colors.black12,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    newsInfo.title != null
                        ? newsInfo.title!
                        : 'Title is missing',
                    maxLines: 2,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Palette.deepBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
