import 'dart:convert';

import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:readnews_app/read_news/read_news_json.dart';

class AddNewsController extends StateNotifier<AddNewsState> {
  AddNewsController()
      : super(
          AddNewsState(
            ReadNewsEntity(id: 1, userId: 1, title: 'same', body: 'body'),
          ),
        );

  void onTitleUpdate(String value) {
    state = AddNewsState(ReadNewsEntity(
      userId: state.readNewsEntity?.userId ?? 1,
      title: value,
      body: state.readNewsEntity?.body ?? '',
      id: 1,
    ));
  }

  void onUserIdUpdate(String value) {
    state = AddNewsState(ReadNewsEntity(
      userId: int.parse(value),
      title: state.readNewsEntity?.title ?? '',
      body: state.readNewsEntity?.body ?? '',
      id: 1,
    ));
  }

  void onBodyUpdate(String value) {
    state = AddNewsState(ReadNewsEntity(
      userId: state.readNewsEntity?.userId ?? 1,
      title: state.readNewsEntity?.title ?? '',
      body: value,
      id: 1,
    ));
  }

  ReadNewsEntity? onAddBtnClicked() {
    return state.readNewsEntity;
  }
}

class AddNewsState {
  ReadNewsEntity? readNewsEntity;

  AddNewsState(this.readNewsEntity);

  AddNewsState copyWith({
    ReadNewsEntity? readNewsEntity,
  }) {
    return AddNewsState(
      readNewsEntity ?? this.readNewsEntity,
    );
  }
}
