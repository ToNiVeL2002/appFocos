import 'package:encendedor/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlasCard extends StatelessWidget {

  final String imagen;
  final String nombre;
  final String numeros;

  const AlasCard({super.key, 
  required this.imagen, 
  required this.nombre, 
  required this.numeros
});

  @override
  Widget build(BuildContext context) {
    
    final screen = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, 'piso');
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        width: screen.width*0.92,
        height: 130,
      
        decoration: BoxDecoration(
          color: const Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 15,
              offset: Offset(0, 7)
            )
          ]
        ),
      
        child: Column(
          children: [
            Image.asset(
              imagen,
              fit: BoxFit.fill,
              width: 80,
              height: 80,
            ),
      
            Text(
              nombre,
              style: TextStyle(
                fontSize: 20
              ),
            ),

            Text(
              numeros,
              style: TextStyle(
                fontSize: 15,
                color: Color(0xffB0A8A8)
              ),
            )
          ],
        ),
      
      ),
    );
  }
}
