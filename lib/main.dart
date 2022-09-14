import 'package:clean_architecture/core/constants/palette.dart';
import 'package:clean_architecture/core/services_locator.dart';
import 'package:clean_architecture/features/show_news/presentation/news_cubit/news_cubit.dart';
import 'package:clean_architecture/features/show_news/presentation/pages/news_view_page.dart';
import 'package:flutter/material.dart';

import 'package:clean_architecture/features/show_news/presentation/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return NewsCubit();
        }),
      ],
      child: MaterialApp(
        title: 'News App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: const ColorScheme.light().copyWith(
            secondary: Palette.deepBlue,
          ),
          fontFamily: 'Poppins',
        ),
        home: const HomePage(),
      ),
    );
  }
}
