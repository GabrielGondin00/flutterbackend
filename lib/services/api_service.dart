import 'dart:convert';


import 'package:http/http.dart';

import '../models/tenis.dart';

class ApiService {
  final String apiUrl = "http://10.200.0.157:8080/api/v1/tenis";

  Future<List<Tenis>> getTenis() async {
    Response res = await get(apiUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Tenis> tenis =
          body.map((dynamic item) => Tenis.fromJson(item)).toList();
      return tenis;
    } else if (res.statusCode == 404) {
      return <Tenis>[];
    } else {
      throw "Failed to load Tenis list";
    }
  }

  Future<Tenis> getTenisById(String id) async {
    final response = await get('$apiUrl/$id');

    if (response.statusCode == 200) {
      print("GetCaseByID:" + id);
      return Tenis.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a shoes');
    }
  }

  Future<Tenis> createTenis(Tenis tenis) async {
    Map data = {
      'modelo': tenis.modelo,
      'marca': tenis.marca,
      'tamanho': tenis.tamanho,
      'preco': tenis.preco,
      
    };

    final Response response = await post(
      apiUrl,


      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Tenis.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post shoes');
    }
  }

  Future<Tenis> updateTenis(String id, Tenis tenis) async {
    Map data = {
      'modelo': tenis.modelo,
      'marca': tenis.marca,
      'tamanho': tenis.tamanho,
      'preco': tenis.preco,
      
    };

    final Response response = await put(
      '$apiUrl/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Tenis.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a shoes');
    }
  }

  Future<void> deleteTenis(String id) async {
    Response res = await delete('$apiUrl/$id');

    if (res.statusCode == 200) {
      print("shoes deleted");
    } else {
      throw "Failed to delete a shoes.";
    }
  }
}
