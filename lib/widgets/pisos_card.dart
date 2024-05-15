import 'package:flutter/material.dart';

class PisosCard extends StatelessWidget {

  final String imagen;
  final String nombre;

  const PisosCard({super.key, 
  required this.imagen, 
  required this.nombre
});

  @override
  Widget build(BuildContext context) {
    
    final screen = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width: screen.width*0.92,
      height: 130,

      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(30)
      ),

      child: Column(
        children: [
          Image.asset(
            imagen,
            fit: BoxFit.fill,
            width: 90,
            height: 90,
          ),

          Text(
            nombre,
            style: TextStyle(
              fontSize: 20
            ),
          )
        ],
      ),

    );
  }
}
