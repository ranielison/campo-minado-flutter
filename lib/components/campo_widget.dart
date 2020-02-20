import 'package:campo_minado/models/campo.dart';
import 'package:flutter/material.dart';

class CampoWidget extends StatelessWidget {
  final Campo campo;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlternarMarcacao;

  CampoWidget(
      {@required this.campo,
      @required this.onAbrir,
      @required this.onAlternarMarcacao});

  Widget _getImage() {
    var qtdMinas = campo.qdtMinasNaVizinhanca;

    if (campo.aberto && campo.minado && campo.explodido) {
      return Image.asset('assets/bomba_0.jpeg');
    } else if (campo.aberto && campo.minado) {
      return Image.asset('assets/bomba_1.jpeg');
    } else if (campo.aberto) {
      return Image.asset('assets/aberto_$qtdMinas.jpeg');
    } else if (campo.marcado) {
      return Image.asset('assets/bandeira.jpeg');
    } else {
      return Image.asset('assets/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbrir(campo),
      onLongPress: () => onAlternarMarcacao(campo),
      child: _getImage(),
    );
  }
}
