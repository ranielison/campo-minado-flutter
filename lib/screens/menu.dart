import 'package:campo_minado/screens/campo_minado_app.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final qtdbombascontroller = TextEditingController();

  int qtdBombas = 1;

  _alteraBomba(deltaBomba) {
    if ((qtdBombas + deltaBomba) < 1) return;

    setState(() {
      qtdBombas += deltaBomba;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: SingleChildScrollView(
        child: Container(
          height: queryData.size.height,
          width: queryData.size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text('Campo Minado',
                    style: TextStyle(color: Colors.blue, fontSize: 22)),
              ),
              buttonMenu('Novo jogo', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CampoMinadoApp(qtdBombas: qtdBombas)));
              }),
              buttonMenu('Recordes', null),
              Text('Quantidade de bombas'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () => _alteraBomba(-1),
                  ),
                  Container(
                      width: 50,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      child: Text(
                        qtdBombas.toString(),
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      )),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () => _alteraBomba(1),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonMenu(title, acao) {
    return InkWell(
      child: Container(
        height: 32,
        width: 100,
        color: Colors.grey,
        margin: EdgeInsets.all(10),
        child: Center(
          child: Text(title),
        ),
      ),
      onTap: acao,
    );
  }
}
