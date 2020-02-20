import 'package:campo_minado/components/resuldato_widget.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  _reiniciar() {
    print('Reiniciando...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResultadoWidget(
        venceu: false,
        onReiniciar: _reiniciar,
      ),
      body: Container(
        child: Text('Tabuleiro'),
      ),
    );
  }
}
