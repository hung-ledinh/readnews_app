import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readnews_app/read_news/read_news_controller.dart';

import 'add_new_controller.dart';

class AddNewsPage extends StatelessWidget {
  const AddNewsPage({
    Key? key,
    this.isEditPage = false,
    this.title = '',
    this.userId = 1,
    this.index = 1,
    this.body = '',
  }) : super(key: key);

  final bool isEditPage;
  final String title;
  final int userId;
  final String body;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(isEditPage ? 'Edit News' : 'Add News'),
      ),
      body: _buildBody(context),
      bottomNavigationBar: _buildButtonAdd(context),
    );
  }

  Widget _buildButtonAdd(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
        onPressed: () {
          final newsEntity =
              context.read<AddNewsController>().onAddBtnClicked();
          Navigator.of(context).pop(newsEntity);
          if (newsEntity != null) {
            isEditPage
                ? context.read<ReadNewsController>().updateNews(
                    index,
                    newsEntity?.userId ?? 1,
                    newsEntity.title ?? 'News',
                    newsEntity.body ?? 'News')
                : context.read<ReadNewsController>().addNewAPI(
                    newsEntity?.userId ?? 1,
                    newsEntity.title ?? 'News',
                    newsEntity.body ?? 'News');
          }
        },
        child: Text(
          isEditPage ? 'Save' : 'Add News',
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Consumer<AddNewsState>(
      builder: (ctx, state, __) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextFormField(
                initialValue: isEditPage
                    ? userId.toString()
                    : state.readNewsEntity?.userId.toString(),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Input UserId",
                    fillColor: Colors.white70,
                    labelText: 'User ID'),
                onChanged: (text) {
                  context.read<AddNewsController>().onUserIdUpdate(text);
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: isEditPage ? title : state.readNewsEntity?.title,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Input Title",
                    fillColor: Colors.white70,
                    labelText: 'Title'),
                onChanged: (text) {
                  context.read<AddNewsController>().onTitleUpdate(text);
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: isEditPage ? body : state.readNewsEntity?.body,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Input Body",
                    fillColor: Colors.white70,
                    labelText: 'Body'),
                onChanged: (text) {
                  context.read<AddNewsController>().onBodyUpdate(text);
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
