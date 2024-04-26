import 'package:encendedor/models/models.dart';
import 'package:encendedor/screens/screens.dart';
import 'package:encendedor/services/services.dart';
import 'package:encendedor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final valoresServices = Provider.of<ValoresService>(context);

    if ( valoresServices.isLoading ) return LoadingScreen();

    return Scaffold(

      body: ListView.builder(
        itemCount: valoresServices.valores.length,
        itemBuilder: (context, index) {
          
          return Cards(ledResponse: valoresServices.valores[index]);
        },
      )
    );
  }
}
