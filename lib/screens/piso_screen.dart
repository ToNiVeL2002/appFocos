import 'package:encendedor/provider/provider.dart';
import 'package:encendedor/provider/ui_piso_provider.dart';
import 'package:encendedor/services/services.dart';
import 'package:encendedor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PisoScreen extends StatelessWidget {
  const PisoScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final valoresServices = Provider.of<ValoresService>(context);

    // if ( valoresServices.isLoading ) return LoadingScreen();

    return Scaffold(
      backgroundColor: Color(0xff16195D),

      body: Stack(
        children: [
          _Body(valoresServices: valoresServices),
        ],
      )
    );
  }
}

class _Body extends StatelessWidget {
  _Body({
    super.key,
    required 
    this.valoresServices,
  });

  final ValoresService valoresServices;
  String numeroPiso = '';

  @override
  Widget build(BuildContext context) {

    final uiPisoProvider = Provider.of<UIPisoProvider>(context);

    if (uiPisoProvider.numeroPiso == 'Primer Piso') {
      numeroPiso = '1';
    } else if (uiPisoProvider.numeroPiso == 'Segundo Piso') {
      numeroPiso = '2';
    } else if (uiPisoProvider.numeroPiso == 'Tercer Piso') {
      numeroPiso = '3';
    } else if (uiPisoProvider.numeroPiso == 'Cuarto Piso') {
      numeroPiso = '4';
    }


    return Column(
      
      children: [
    
        _appBarCustom(),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                uiPisoProvider.numeroPiso,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),

        AlasCard(imagen: uiPisoProvider.imagen, nombre: 'Ala izquierda', numeros: '${numeroPiso}01 - ${numeroPiso}10'),
        AlasCard(imagen: uiPisoProvider.imagen, nombre: 'Ala derecha', numeros: '${numeroPiso}11 - ${numeroPiso}20'),
        

      ],
    );
  }
}

class _appBarCustom extends StatelessWidget {
  const _appBarCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 170,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        
        decoration: const BoxDecoration(
          color: Color(0xffEBC813)
        ),
    
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context), 
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 30,
                  )
                ),
              ],
            ),

            Image.asset(
              'assets/EMI.png',
              fit: BoxFit.fill,
              width: 160,
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}
