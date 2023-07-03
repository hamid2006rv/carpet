import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Service {
  final String url = '87.107.147.247:5000';

  Future<dynamic> get_price(String img_path) async {
    final uri = Uri.http(url, 'predict');
    var request = http.MultipartRequest("POST", uri);
    var part = await http.MultipartFile.fromPath('file', img_path,
        contentType: MediaType('image', 'jpeg'));
    request.files.add(part);
    var response = await request.send();
    if (response.statusCode == 200) {
      var result = await http.Response.fromStream(response);
      var jsResult = json.decode(result.body);
      return jsResult;
    } else
      return -1;
  }
  Future<dynamic> get_price_with_feature(Map<String, int> query) async {
    final uri = Uri.http(url, 'feature');
    var request = http.MultipartRequest("POST", uri);
    var body = json.encode(query);
    var response = await http.post(uri,
        headers: {"Content-Type": "application/json"},
        body: body
    );

    if (response.statusCode == 200) {
      var jsResult = json.decode(response.body);
      return jsResult;
    } else
      return -1;
  }
  Future<bool> check_connection() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == false) return false;

    final uri = Uri.http(url, 'feature');
    final response = await http.get(uri);
    if (response.body.isEmpty)
      return false;
    else
      return true;
  }
}
