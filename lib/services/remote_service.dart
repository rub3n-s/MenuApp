import 'dart:convert';

import 'package:flutter/material.dart';
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

  void updateMenu(var data) async {
    var body = jsonEncode(data);
    var response = await http.post(Uri.parse('http://10.0.2.2:8080/menu'),
        body: body, headers: {'Content-Type': 'aaplication/json'});

    if (response.statusCode == 200) {
      print('Updated successfully');
    } else {
      print('Request failed');
    }
  }
}
