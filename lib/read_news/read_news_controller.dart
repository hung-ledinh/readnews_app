import 'dart:convert';

import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:readnews_app/read_news/read_news_json.dart';

import '../main.dart';

class ReadNewsController extends StateNotifier<ReadNewsState> {
  ReadNewsController()
      : super(ReadNewsState(
            ReadNewsEntity(userId: 1, id: 1, title: 'Title', body: 'Data'),
            null));

  void fetchGetData() async {
    final response = await client.getNewPosts();
    if (response.isNotEmpty) {
      // then parse the JSON.
      state = state.copyWith(
          readNewsEntity:
              ReadNewsEntity(userId: 1, id: 1, title: 'Title', body: 'Data'),
          lstReadNewsEntity: response);
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future addNewAPI(int userId, String title, String body) async {
    final response = await client.createNewPost(
        ReadNewsEntity(userId: userId, title: title, body: body));
    if (response != null) {
      state.lstReadNewsEntity?.add(response);
    } else {
      throw Exception('Failed to create news.');
    }
  }

  Future updateNews(int id, int userId, String title, String body) async {
    final response = await client.updateNewPost(
      id.toString(),
      ReadNewsEntity(
        userId: userId,
        title: title,
        body: body,
      ),
    );

    if (response != null) {
      state.lstReadNewsEntity?[id - 1] = response;
    } else {
      throw Exception('Failed to update news.');
    }
  }

  Future deleteNews(int id) async {
    final res = await client.deleteNewPost(id);

    if (res != null) {
      state.lstReadNewsEntity?.removeWhere((item) => item.id == id);
      // state.lstReadNewsEntity?.removeAt(id - 1);
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
