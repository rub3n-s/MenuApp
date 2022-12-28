import 'package:http/http.dart' as http;
import '../models/menu.dart';

class RemoteService {
  Future<Menu?> getMenu() async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:8080/menu');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return menuFromJson(json);
    }
    return null;
  }
}
