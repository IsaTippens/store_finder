import 'package:flutter/material.dart';
import 'store_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key, @required this.value}) : super(key: key);
  final String value;
  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  _SearchPageState() {
    searchBar = SearchBar(
      value: "widget.value",
    );
  }
  List<String> stores = [
    "american_swiss",
    "archives",
    "at_home",
    "cna",
    "typo"
  ];

  SearchBar searchBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: searchBar,
      ),
      body: ListView(
        children: <Widget>[
          StoreCard(
            storeName: 'american_swiss',
          ),
          StoreCard(
            storeName: 'archive',
          ),
          StoreCard(
            storeName: 'at_home',
          ),
          StoreCard(
            storeName: 'cna',
          ),
          StoreCard(
            storeName: 'typo',
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final String value;
  SearchBar({Key key, @required this.value}) : super(key: key) {
    controller = TextEditingController(text: value);
    textField = TextField(
      autofocus: true,
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        focusColor: Colors.white,
        hintText: "Search for stores from A - Z",
      ),
    );
  }
  TextEditingController controller;
  TextField textField;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Hero(
        tag: "search",
        child: textField,
      ),
    );
  }
}
