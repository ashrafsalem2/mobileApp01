import 'dart:convert';
import 'package:first_app/Data/model/album2.dart';
import 'package:http/http.dart' as http;

Future<List<Album2>> fetchAlbum2() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1/photos'),
  );

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Album2.fromJson(json)).toList();
  } else {
    throw Exception('Faild to fitch');
  }
}
