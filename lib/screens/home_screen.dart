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
      // backgroundColor: Colors.green,
      body: Stack(
        children: [
          _Body(valoresServices: valoresServices),

          Positioned(
            top: 190,
            child: Container(
              width: 50,
              height: 30,
              decoration: BoxDecoration(
                // color: Colors.green,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
              ),
            ) 
          )
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
    return Column(
      children: [
    
        SafeArea(
          child: Container(
            width: double.infinity,
            height: 180,
            
            decoration: BoxDecoration(
              // color: Colors.red
            ),
    
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'CONTROL',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),
                ),
    
                Image.asset(
                  'assets/EMI.png',
                  fit: BoxFit.fill,
                  width: 150,
                  height: 80,
                )
              ],
            )
          ),
        ),
    
        const SizedBox(height: 10,),
    
        Expanded(
          child: ListView.builder(
            itemCount: valoresServices.valores.length,
            itemBuilder: (context, index) {
    
              return Cards(
                ledResponse: valoresServices.valores[index], 
                valoresService: valoresServices,
              );
            },
          ),
        )
      ],
    );
  }
}
