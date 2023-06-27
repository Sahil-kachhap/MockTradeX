import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

String emotion="";
String emotionValue="50";
Future<void> getSentiment() async {

  // Await the HTTP GET response, then decode the
  // JSON data it contains.
  const BaseUrl = "https://api.alternative.me/fng/?limit=1";

  final url = Uri.parse(BaseUrl);
  Response response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonResponse = convert.jsonDecode(response.body);
    emotion=jsonResponse['data'][0]['value_classification'];
    emotionValue=jsonResponse['data'][0]['value'];
    print(emotion+emotionValue);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
