import 'package:clean_architecture/features/show_news/presentation/news_cubit/news_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_architecture/core/constants/palette.dart';
import 'package:clean_architecture/features/show_news/presentation/pages/components/new_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    context.read<NewsCubit>().fetchNews(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: 0,
        title: const Text(
          'News',
          style: TextStyle(
            color: Palette.deepBlue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              onSubmitted: (searchText) {
                if (searchText.trim() == '') {
                  context.read<NewsCubit>().fetchNews(null);
                } else {
                  context.read<NewsCubit>().fetchNews(searchText);
                }
              },
              cursorColor: Palette.deepBlue,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Palette.lightGray,
                  size: 20,
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Palette.lightGray,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Palette.lightGray,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Palette.deepBlue,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                if (state is NewsInitial) {
                  return const Text(
                    'Top News',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Palette.deepBlue,
                    ),
                  );
                } else if (state is NewsInitialSearch) {
                  return const Text(
                    'Search News', //how do i get the "searchText" here
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Palette.deepBlue,
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            const SizedBox(height: 16),
            Expanded(child: BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                if (state is NewsInitial) {
                  return ListView.builder(
                    itemCount: state.news.length,
                    itemBuilder: (context, index) {
                      return NewsCard(
                        newsInfo: state.news[index],
                      );
                    },
                  );
                } else if (state is NewsInitialSearch) {
                  return ListView.builder(
                    itemCount: state.news.length,
                    itemBuilder: (context, index) {
                      return NewsCard(
                        newsInfo: state.news[index],
                      );
                    },
                  );
                } else if (state is NewsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: Palette.deepBlue),
                  );
                } else if (state is NewsError) {
                  return Center(
                    child: Column(
                      children: [
                        const Text('Your search was unsuccesfull'),
                        IconButton(
                          onPressed: () {
                            context.read<NewsCubit>().fetchNews(null);
                          },
                          icon: const Icon(
                            Icons.replay_outlined,
                            color: Palette.deepBlue,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: Text('Undefined state'));
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
