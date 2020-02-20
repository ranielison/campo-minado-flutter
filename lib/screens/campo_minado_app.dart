import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/components/resuldato_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  _reiniciar() {
    print('Reiniciando...');
  }

  void _abrir(Campo campo) {
    print('Abrir');
  }

  void _alternarMarcacao(Campo campo) {
    print('Alternando marcacao');
  }

  @override
  Widget build(BuildContext context) {
    Campo campo = Campo(linha: 0, coluna: 0);
    campo.abrir();
    return Scaffold(
      appBar: ResultadoWidget(
        venceu: false,
        onReiniciar: _reiniciar,
      ),
      body: Container(
        child: CampoWidget(
          campo: campo,
          onAbrir: _abrir,
          onAlternarMarcacao: _alternarMarcacao,
        ),
      ),
    );
  }
}
