import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/components/resuldato_widget.dart';
import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/explosao_exception.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatefulWidget {
  @override
  _CampoMinadoAppState createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool _venceu;
  Tabuleiro _tabuleiro;

  void _reiniciar() {
    setState(() {
      _venceu = null;
      _tabuleiro.reiniciar();
    });
  }

  void _abrir(Campo campo) {
    if (_venceu != null) return;
    setState(() {
      try {
        campo.abrir();
        if (_tabuleiro.resolvido) {
          _venceu = true;
        }
      } on ExplosaoException {
        _venceu = false;
        _tabuleiro.revelarBombas();
      }
    });
  }

  void _alternarMarcacao(Campo campo) {
    if (_venceu != null) return;
    setState(() {
      campo.alterarMarcacao();
      if (_tabuleiro.resolvido) {
        _venceu = true;
      }
    });
  }

  Tabuleiro _getTabuleiro(double largura, double altura) {
    if (_tabuleiro == null) {
      int qtdColunas = 15;
      double tamanhoCampo = largura / qtdColunas;

      int qtdLinhas = (altura / tamanhoCampo).floor();
      print('linhas: ' + qtdLinhas.toString());
      print('colunas: ' + qtdColunas.toString());
      print('tamannho: ' + tamanhoCampo.toString());

      _tabuleiro = Tabuleiro(
        linhas: qtdLinhas,
        colunas: qtdColunas,
        qtdBombas: 15,
      );
    }
    return _tabuleiro;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResultadoWidget(
        venceu: _venceu,
        onReiniciar: _reiniciar,
      ),
      body: Container(
        color: Colors.grey,
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            return TabuleiroWidget(
              tabuleiro: _getTabuleiro(
                constraints.maxWidth,
                constraints.maxHeight,
              ),
              onAbrir: _abrir,
              onAlternarMarcacao: _alternarMarcacao,
            );
          },
        ),
      ),
    );
  }
}
