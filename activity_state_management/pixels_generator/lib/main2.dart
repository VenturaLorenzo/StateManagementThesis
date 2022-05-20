import 'dart:convert';

import 'package:http/http.dart';

void main() async {
  final Response response =
      await get(Uri.parse('https://dummyjson.com/products'));
  print(response.body);
  print(response.contentLength);
  print(response.request?.headers.toString());
  print(response.request?.url.toString());

  final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
}
