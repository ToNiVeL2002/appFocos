import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:encendedor/models/models.dart';
import 'package:http/http.dart' as http;

class ValoresService extends ChangeNotifier {
  final String _baseUrl = "esp32-fea08-default-rtdb.firebaseio.com";
  final List<LedResponse> valores = [];
  final List<LedResponse> valoresNew = [];

  // late LedResponse selectedLed;

  bool isLoading = true;
  bool isSaving = true;

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

  Future<List<LedResponse>> recargarValores() async {
    final url = Uri.https(_baseUrl, 'valores.json');
    final resp = await http.get( url );

    valoresNew.clear();

    final Map<String, dynamic> valoresMap = json.decode(resp.body);

    valoresMap.forEach((key, value) {
      final tempValor = LedResponse.fromJson( value );
      tempValor.id = key;
      valoresNew.add(tempValor);
    });

    for (var i = 0; i < valores.length; i++) {
      valores[i].ldr = valoresNew[i].ldr;
    }
    notifyListeners();

    return valores;

  }

  Future saveNuevoValor( LedResponse ledResponse ) async {
    isSaving = true;
    notifyListeners();

    if ( ledResponse.id != null ) {
      // Actualizar
      await updateValor(ledResponse);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateValor( LedResponse ledResponse ) async {
    
    final url = Uri.https(_baseUrl, 'valores/${ ledResponse.id }.json');

    final body = jsonEncode(LedResponse(ldr: ledResponse.ldr, state: ledResponse.state, id: ledResponse.id).toJson());

    final resp = await http.put( url, body: body );
    final decodeData = resp.body;

    print(decodeData);


    // Actualizar
    final index = valores.indexWhere( (element) => element.id == ledResponse.id ) ;
    valores[index] = ledResponse;

    // ACTUALIZAR EL LISTADO
    return ledResponse.id!;
  }



}

