import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/components/resuldato_widget.dart';
import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/tabuleiro.dart';
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
    return Scaffold(
      appBar: ResultadoWidget(
        venceu: false,
        onReiniciar: _reiniciar,
      ),
      body: Container(
          child: TabuleiroWidget(
        tabuleiro: Tabuleiro(
          linhas: 15,
          colunas: 15,
          qtdBombas: 0,
        ),
        onAbrir: _abrir,
        onAlternarMarcacao: _alternarMarcacao,
      )),
    );
  }
}
