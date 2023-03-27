import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>> getCryptoNews(String apiKey) async {
  String url =
    'https://newsapi.org/v2/everything?q=cryptocurrency&pageSize=100&apiKey=$apiKey';

  var response = await http.get(Uri.parse(url));
  // print('response is $',response.statusCode);
  if (response.statusCode == 200) {
    return json.decode(response.body)['articles'];
  } else {
    throw Exception('Failed to load news');
  }
}

//;