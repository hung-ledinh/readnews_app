import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:readnews_app/read_news/read_news_json.dart';

class AddNewsController extends StateNotifier<AddNewsState> {
  AddNewsController()
      : super(
          AddNewsState(
            ReadNewsEntity(id: 1, userId: 1, title: 'same', body: 'body'),
          ),
        );
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
