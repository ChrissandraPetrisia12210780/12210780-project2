import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pendataanwarga/models/berita_model.dart';

class BeritaPanelProvider with ChangeNotifier {
  List<BeritaModel> data = [];

  Future refresh() async {
    final alamat =
        "http://api.mediastack.com/v1/news?access_key=85a8e54424ec49eba1601930325973d6";
    final hasil = await http.get(Uri.parse(alamat));
    if (hasil.statusCode != 200) return [];

    final obj = jsonDecode(hasil.body);

    data.clear();
    for (var n in obj['data']) {
      data.add(BeritaModel.fromMap(n));
    }
    notifyListeners();
  }
}
