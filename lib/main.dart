import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:readnews_app/add_edit_news/add_new_controller.dart';
import 'package:readnews_app/read_news/read_news_controller.dart';
import 'package:readnews_app/read_news/read_news_page.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_service.dart';

final dio = Dio();
final client = RestClient(dio);

void main() {
  dio.interceptors.add(PrettyDioLogger());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<ReadNewsController, ReadNewsState>(
            create: (BuildContext context) => (ReadNewsController())),
        StateNotifierProvider<AddNewsController, AddNewsState>(
          create: (_) => AddNewsController(),
        )
      ],
      child: MaterialApp(
        title: 'Read News',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ReadNewsPage(title: 'Read News'),
      ),
    );
  }
}
