import 'dart:convert';
import 'package:first_app/Data/model/album.dart';
import 'package:http/http.dart' as http;

Future<List<Album>> fetchAlbum() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
  );

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Album.fromJson(json)).toList();
  } else {
    throw Exception('Faild To Load album');
  }
}
