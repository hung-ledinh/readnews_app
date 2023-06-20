import 'dart:convert';

import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:http/http.dart' as http;
import 'package:readnews_app/read_news/read_news_json.dart';

class ReadNewsController extends StateNotifier<ReadNewsState> {
  ReadNewsController()
      : super(ReadNewsState(
            ReadNewsEntity(userId: 1, id: 1, title: 'Title', body: 'Data'),
            null));

  final String newsURL = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<ReadNewsEntity>?> fetchGetData() async {
    final response = await http.get(Uri.parse(newsURL));

    if (response.statusCode == 200) {
      // then parse the JSON.
      final List result = json.decode(response.body);
      state = state.copyWith(
          readNewsEntity:
              ReadNewsEntity(userId: 1, id: 1, title: 'Title', body: 'Data'),
          lstReadNewsEntity:
              result.map((e) => ReadNewsEntity.fromJson(e)).toList());
      // readNewsEntity: ReadNewsEntity.fromJson(jsonDecode(response.body)));
      print('item: ${state.lstReadNewsEntity?.toList().length}');
      return result.map((e) => ReadNewsEntity.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future deleteNews(int id) async {
    final res = await http.delete(Uri.parse('$newsURL/$id'));

    if (res.statusCode == 200) {
      state.lstReadNewsEntity?.removeWhere((item) => item.id == id);
    } else {
      throw "Sorry! Unable to delete this post.";
    }
  }
}

class ReadNewsState {
  final ReadNewsEntity readNewsEntity;
  final List<ReadNewsEntity>? lstReadNewsEntity;

  ReadNewsState(this.readNewsEntity, this.lstReadNewsEntity);

  ReadNewsState copyWith({
    ReadNewsEntity? readNewsEntity,
    List<ReadNewsEntity>? lstReadNewsEntity,
  }) {
    return ReadNewsState(
      readNewsEntity ?? this.readNewsEntity,
      lstReadNewsEntity ?? this.lstReadNewsEntity,
    );
  }
}
