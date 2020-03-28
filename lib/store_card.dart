import 'package:flutter/material.dart';
import 'store_page.dart';
import 'store_data.dart';

class StoreCard extends ListTile {
  const StoreCard({this.store});
  final Store store;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Image.asset("images/" + store.imageName + ".png"),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return StorePage(
                store: store,
              );
            },
          ),
        );
      },
    );
  }
}
