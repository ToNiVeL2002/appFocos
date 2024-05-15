import 'package:flutter/material.dart';

class UIPisoProvider extends ChangeNotifier {
  String _numeroPiso = "";
  String _imagen = "";

  get numeroPiso => _numeroPiso;

  set numeroPisoo( String value ) {
    _numeroPiso = value;
    notifyListeners();
  }

  get imagen => _imagen;

  set imagenn( String value ) {
    _imagen = value;
    notifyListeners();
  }

}

