import 'package:clean_architecture/features/show_news/domain/entities/news_info.dart';
import 'package:clean_architecture/features/show_news/presentation/news_cubit/news_cubit.dart';
import 'package:flutter/material.dart';

import 'package:clean_architecture/core/constants/palette.dart';
import 'package:clean_architecture/features/show_news/presentation/pages/components/new_card.dart';

class NewsPageView extends StatelessWidget {
  final NewsInfo newsInfo;
  const NewsPageView({super.key, required this.newsInfo});

  String _getDateInDDMMYYFormat(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Palette.lightGray,
            size: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          //physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                newsInfo.title != null ? newsInfo.title! : 'No title',
                style: const TextStyle(
                  color: Palette.deepBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                  height: 300,
                  color: Palette.lightGray,
                  child: newsInfo.imageURL != null
                      ? Image.network(
                          newsInfo.imageURL!,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          'https://www.rd.com/wp-content/uploads/2020/04/GettyImages-694542042-e1586274805503.jpg',
                          fit: BoxFit.cover,
                        )),
              const SizedBox(height: 16),
              Text(
                _getDateInDDMMYYFormat(newsInfo.datetime),
                style: const TextStyle(
                  color: Palette.lightGray,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                newsInfo.author != null ? newsInfo.author! : 'No Author',
                style: const TextStyle(
                  color: Palette.lightGray,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                newsInfo.content != null
                    ? newsInfo.content!
                    : 'No content to show',
                style: const TextStyle(
                  color: Palette.deepBlue,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
