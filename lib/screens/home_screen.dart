import 'package:encendedor/services/services.dart';
import 'package:encendedor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
  const _Body({
    super.key,
    required this.valoresServices,
  });

  final ValoresService valoresServices;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
    
        appBarCustom(),
    
        SizedBox(height: 10,),

        PisosCard(imagen: 'assets/meca.png', nombre: 'Primer Piso',),
        PisosCard(imagen: 'assets/comercial.png', nombre: 'Segundo Piso'),
        PisosCard(imagen: 'assets/sistemas.png', nombre: 'Tercer Piso'),
        PisosCard(imagen: 'assets/telecom.png', nombre: 'Cuarto Piso'),

      ],
    );
  }
}

class appBarCustom extends StatelessWidget {
  const appBarCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 170,
        padding: EdgeInsets.symmetric(horizontal: 20),
        
        decoration: const BoxDecoration(
          color: Color(0xffEBC813)
        ),
    
        child: Column(
          children: [
            Image.asset(
              'assets/EMI.png',
              fit: BoxFit.fill,
              width: 150,
              height: 80,
            ),
    
            const SizedBox(height: 15,),
    
            const Row(
              children: [
                Text(
                  'Bienvenido',
                  style: TextStyle(
                    fontSize: 32
                  ),
                )
              ],
            )
    
          ],
        ),
      ),
    );
  }
}
