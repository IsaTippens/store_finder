import 'store_data.dart';

import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  const StorePage({@required this.store});
  final Store store;

  createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          primary: true,
          backgroundColor: Colors.black,
          title: Text(widget.store.name)),
    );
  }
}
