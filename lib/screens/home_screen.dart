import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
        
          children: [
            Text('Prender y apagar'),

            IconButton(
              onPressed: () {
                print('funca jefe');
              }, 
              icon: Icon(
                Icons.sunny,
                size: 200,
              )
            )

          ],
        ),
      )

    );
  }
}
