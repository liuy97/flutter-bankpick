import 'package:flutter/material.dart';

import '../../statistics/widgets/entry_widget.dart';

class SearchResultWidget extends StatelessWidget {
  final List<dynamic> items;

  const SearchResultWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return InkWell(
          key: ValueKey(item.id),
          onTap: () => showItem(context, item),
          child: Container(
            alignment: FractionalOffset.center,
            margin: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
            child: EntryWidget(entry: item),
          ),
        );
      },
    );
  }

  void showItem(BuildContext context, dynamic item) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: GestureDetector(
              key: Key((item.id).toString()),
              onTap: () => Navigator.pop(context),
              child: SizedBox.expand(
                child: Hero(
                  tag: item.id,
                  child: Center(child: Text(item.brand)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
