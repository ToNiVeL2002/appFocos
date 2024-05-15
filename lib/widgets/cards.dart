import 'package:encendedor/models/models.dart';
import 'package:encendedor/services/services.dart';
import 'package:flutter/material.dart';

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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        // height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xff3330E4),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 15,
              offset: Offset(0, 5)
            )
          ]
        ),
        child: Stack(
          children: [

            Positioned(
              child: _IconoBoton(ledResponse: ledResponse, valoresService: valoresService),
            ),

            Positioned(
              child: GestureDetector(
                onTap: () => valoresService.recargarValores(),
                child: Container(
                  width: 100,
                  height: 80,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(30)),
                    color: Colors.yellow
                  ),
                
                  child: Center(
                    child: Text(
                      'LDR: ${ledResponse.ldr}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ) 
            ),

          ],
        )
      ),
    );
  }
}

class _IconoBoton extends StatelessWidget {
  const _IconoBoton({
    super.key,
    required this.ledResponse,
    required this.valoresService,
  });

  final LedResponse ledResponse;
  final ValoresService valoresService;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: IconButton(
        onPressed: () async {
          int value=0;
          if (ledResponse.state == 1) {
            value = 0;
          } else if (ledResponse.state == 0) {
            value = 1;
          }
          
          valoresService.saveNuevoValor(
            LedResponse(
              ldr: ledResponse.ldr,
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
      ),
    );
  }
}
