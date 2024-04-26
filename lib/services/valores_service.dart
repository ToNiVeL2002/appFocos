import 'dart:convert';

import 'package:encendedor/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ValoresService extends ChangeNotifier {
  final String _baseUrl = "esp32-fea08-default-rtdb.firebaseio.com";
  final List<LedResponse> valores = [];
  bool isLoading = true;

  ValoresService() {
    loadValres();

  }

  Future<List<LedResponse>> loadValres() async {

    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'valores.json');
    final resp = await http.get( url );

    final Map<String, dynamic> valoresMap = json.decode(resp.body);

    print(valoresMap);

    
    valoresMap.forEach((key, value) {
      final tempValor = LedResponse.fromJson( value );
      tempValor.id = key;
      valores.add(tempValor);
    });

    isLoading = false;
    notifyListeners();

    return valores;
  }

}

