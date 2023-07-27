//import from flutter
import 'dart:convert';
import 'package:flutter/services.dart';

class Asset {
  Future<List<dynamic>> fetchData() async {
    List<dynamic> listOfAyahsModel = [];

    String result = await rootBundle.loadString('assets/hafs_smart_v8.json');
    if (result.isNotEmpty) {
      List<dynamic> ayahs = jsonDecode(result);
      for (int i = 1; i <= 604; i++) {
        List<dynamic> allPage =
            ayahs.where((element) => element['page'] == i).toList();
        listOfAyahsModel.add(allPage);
      }
      return listOfAyahsModel;
    }
    return Future.error('error');
  }
}
