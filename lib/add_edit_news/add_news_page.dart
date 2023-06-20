import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_new_controller.dart';

class AddNewsPage extends StatelessWidget {
  const AddNewsPage({Key? key, this.isEditPage = false}) : super(key: key);

  final bool isEditPage;

  get title => null;

  get userId => null;

  get body => null;

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
          // final todoEntity =
          // context.read<AddTaskController>().onAddBtnClicked();
          // Navigator.of(context).pop(todoEntity);
          // if (todoEntity != null) {
          //   isEditPage
          //       ? context
          //       .read<TodoListController>()
          //       .updateTodo(index, todoEntity)
          //       : context.read<TodoListController>().addTodo(todoEntity);
          // }
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
                    ? userId
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
                  // context.read<AddNewsController>().onTitleUpdate(text);
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
                  // context.read<AddTaskController>().onTitleUpdate(text);
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
                  // context.read<AddTaskController>().onTitleUpdate(text);
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
