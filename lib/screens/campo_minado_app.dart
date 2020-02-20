import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/components/resuldato_widget.dart';
import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatefulWidget {
  @override
  _CampoMinadoAppState createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool _venceu;
  Tabuleiro _tabuleiro = Tabuleiro(linhas: 12, colunas: 12, qtdBombas: 3);

  void _reiniciar() {
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
        venceu: _venceu,
        onReiniciar: _reiniciar,
      ),
      body: Container(
          child: TabuleiroWidget(
        tabuleiro: _tabuleiro,
        onAbrir: _abrir,
        onAlternarMarcacao: _alternarMarcacao,
      )),
    );
  }
}
