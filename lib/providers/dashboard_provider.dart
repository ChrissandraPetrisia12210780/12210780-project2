import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pendataanwarga/models/berita_model.dart';
import 'package:http/http.dart' as http;

class DashboardProvider with ChangeNotifier {
  int indexTombol = 0;

  void saatdiklik(int index) {
    indexTombol = index;
    notifyListeners();
  }
}

class CariBeritaPanelProvider with ChangeNotifier {
  bool modecari = false;

  void ubahmode() {
    modecari = !modecari;
    notifyListeners();
  }
}
