import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readnews_app/add_edit_news/add_news_page.dart';
import 'package:readnews_app/read_news/read_news_controller.dart';

class ReadNewsPage extends StatefulWidget {
  const ReadNewsPage({super.key, required this.title});

  final String title;

  @override
  State<ReadNewsPage> createState() => _ReadNewsPageState();
}

class _ReadNewsPageState extends State<ReadNewsPage> {
  void _addNews() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddNewsPage(),
      ),
    );
    setState(() {});
  }

  @override
  void initState() {
    context.read<ReadNewsController>().fetchGetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReadNewsState>(
      builder: (context, state, child) {
        final lstNews = state.lstReadNewsEntity;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: ListView.builder(
            itemCount: lstNews?.length ?? 5,
            itemBuilder: (context, index) {
              final news = lstNews?[index];
              return ListTile(
                title: Text(
                  news?.title ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  news?.body ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () async {
                        final result =
                            await Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => AddNewsPage(
                            isEditPage: true,
                            title: news?.title ?? '',
                            body: news?.body ?? '',
                            userId: news?.userId ?? 1,
                            index: news?.id ?? 1,
                          ),
                        ));
                        // todoList.add(result);
                        setState(() {});
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          context
                              .read<ReadNewsController>()
                              .deleteNews(news!.id);
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _addNews,
            tooltip: 'Add News',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
