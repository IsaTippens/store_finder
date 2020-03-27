import 'package:flutter/material.dart';
import 'store_page.dart';

class StoreCard extends ListTile {
  const StoreCard({this.storeName});
  final storeName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Image.asset("images/" + storeName + ".png"),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return StorePage(storeName: storeName);
            },
          ),
        );
      },
    );
  }
}
