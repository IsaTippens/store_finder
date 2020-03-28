import 'dart:async';
import 'dart:convert';

import 'utils.dart' as utils;

import 'package:flutter/services.dart';

class Store {
  const Store({this.name, this.imageName});

  final String name;
  final String imageName;

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(name: json["name"], imageName: json["imageName"]);
  }
}

List<Store> parseStores(String value, String filter) {
  final Map<String, dynamic> storesParsed = json.decode(value);

  List<Store> stores = List<Store>();
  for (int i = 0; i < storesParsed.length; i++) {
    if (storesParsed[storesParsed.keys.elementAt(i)]["name"]
                .substring(0, filter.length)
                .toUpperCase() ==
            filter.toUpperCase() ||
        filter.length == 0) {
      stores.add(Store.fromJson(storesParsed.values.elementAt(i)));
    }
  }

  return stores;
}

Future<List<Store>> fetchStores(String filter) async {
  return parseStores(await rootBundle.loadString(utils.getMallPath()), filter);
}
