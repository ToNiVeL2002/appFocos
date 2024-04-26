import 'package:encendedor/models/models.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {

  final LedResponse ledResponse;

  const Cards({
    super.key, 
    required this.ledResponse
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        // height: 250,
        color: Colors.indigo,
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
        
          children: [
            Text('Prender y apagar'),

            Text('Soy ${ledResponse.id} y estoy ${ledResponse.state}'),
        
            IconButton(
              onPressed: () {
                print('funca jefe');
              }, 
              icon: Icon(
                Icons.sunny,
                size: 200,
                color: ledResponse.state == 1
                ? Colors.white
                : Colors.black,
              )
            )
        
          ],
        ),
      ),
    );
  }
}