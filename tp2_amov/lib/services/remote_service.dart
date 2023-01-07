import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/menu.dart';

class RemoteService {
  Future<Menu?> getMenu() async {
    http.Response response = await http.get(
        Uri.parse('http://10.0.2.2:8080/menu'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return menuFromJson(utf8.decode(response.bodyBytes));
    }
    return null;
  }

  setMenu(Original menu) async {
    var response = await http.post(Uri.parse('http://10.0.2.2:8080/menu'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(menu.toJson()));
    debugPrint(response.body);
  }
}
