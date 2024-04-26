import 'package:encendedor/models/models.dart';
import 'package:encendedor/provider/valor_nuevo_provider.dart';
import 'package:encendedor/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cards extends StatelessWidget {

  final LedResponse ledResponse;
  final ValoresService valoresService;

  const Cards({
    super.key, 
    required this.valoresService, 
    required this.ledResponse
  });

  


  @override
  Widget build(BuildContext context) {
    

    // return ChangeNotifierProvider(
    //   create: ( _ ) => ValorNuevoProvider(),
    //   child: _CardsBody(
    //     ledResponse: ledResponse, 
    //     valoresService: valoresService
    //   ),
    // );
    return _CardsBody(
      ledResponse: ledResponse, 
      valoresService: valoresService
    );
  }
}

class _CardsBody extends StatelessWidget {
  const _CardsBody({
    super.key,
    required this.ledResponse,
    required this.valoresService,
  });

  final LedResponse ledResponse;
  final ValoresService valoresService;

  @override
  Widget build(BuildContext context) {

    // final valorNuevoProvider = Provider.of<ValorNuevoProvider>(context);
    // final valor = valorNuevoProvider.ledResponse;

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
              onPressed: () async {
                int value=0;
                if (ledResponse.state == 1) {
                  value = 0;
                } else if (ledResponse.state == 0) {
                  value = 1;
                }
    
                valoresService.saveNuevoValor(
                  LedResponse(
                    ldr: 50, 
                    state: value,
                    id: ledResponse.id
                  )
                );
                
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