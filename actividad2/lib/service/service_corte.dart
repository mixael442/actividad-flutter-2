import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import '../model/model.dart';

class Provider {
  Provider() {
    loadData2();
  }

  Future<List<Data>> loadData2() async {
    var value =
        Uri.parse('https://actividadflutterordenes.free.beeceptor.com/');
    var response = await http.get(value);
    List<dynamic> res = jsonDecode(response.body);
    List<Data> convert = res.map((e) => Data.fromJson(e)).toList();
    return convert;
  }
}
