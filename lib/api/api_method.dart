import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;

import '../utility/global_function.dart';

Future<https.Response> callGetApi({required String endURl}) async {
  final header = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };

  final url = Uri.parse(endURl);
  var response = await https.get(url, headers: header);
  kLog(content: "GET METHOD", title: "METHOD TYPE");
  kLog(content: "$url", title: "URL");
  kLog(content: "$header", title: "HEADER");
  kLog(content: "${response.statusCode}", title: "STATUS CODE");
  kLog(content: jsonDecode(response.body), title: "RESPONSE");
  return response;
}
