import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:store_finder/store_data.dart';
import 'store_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key, @required this.value}) : super(key: key);
  final String value;
  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchBar searchBar;
  Future<List<Store>> stores;

  @override
  void initState() {
    searchBar = SearchBar(
      value: widget.value,
      onChanged: (out) {
        setState(() {
          stores = fetchStores(out);
        });
      },
    );
    stores = fetchStores(widget.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: searchBar,
        ),
        body: FutureBuilder<List<Store>>(
          future: stores,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return StoreCard(store: snapshot.data[i]);
                  });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key key, @required this.value, @required this.onChanged})
      : super(key: key);
  final String value;
  final ValueChanged<String> onChanged;

  @override
  createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController controller;
  TextField textField;

  @override
  void initState() {
    controller = TextEditingController(text: widget.value);
    textField = TextField(
      autofocus: true,
      controller: controller,
      onChanged: widget.onChanged,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        focusColor: Colors.white,
        hintText: "Search for stores from A - Z",
      ),
    );
    super.initState();
  }

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
