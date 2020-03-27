import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  const StorePage({@required this.storeName});
  final String storeName;

  createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          primary: true,
          backgroundColor: Colors.black,
          title: Text(prettifyName(widget.storeName))),
    );
  }
}

String prettifyName(String name) {
  var n = name.replaceAll(r'_', ' ');
  /*
  name = name.replaceAllMapped(new RegExp('/(^\w{1})|(\s+\w{1})/g'), (match) {
    print(match.toString());
    return "match";
  });*/
  return n.toUpperCase();
}
