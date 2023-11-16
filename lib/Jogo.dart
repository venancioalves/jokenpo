import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("../assets/padrao.png");
  var _mensagem = "Escolha uma opção abaixo:";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do app" + escolhaApp);
    print("Escolha do usuario" + escolhaUsuario);

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("../assets/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("../assets/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("../assets/tesoura.png");
        });
        break;
    }

    //validacao do ganhador

    if (
        //usuario ganhador
        (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
            (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
            (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Você ganhou!";
      });
    } else if (
        //usuario ganhador
        (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
            (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
            (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        this._mensagem = "O App ganhou hehehe!";
      });
    } else {
      setState(() {
        this._mensagem = "Empatamos kkkkk";
      });
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //--------------------------------- APPBAR -----------
      appBar: AppBar(
        centerTitle: true,
        title: Text("JokenPo"),
        backgroundColor: Color.fromARGB(255, 24, 186, 54),
      ),

      //--------------------------------- BODY --------------
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     print("Pressionou o botão!");
          //   },
          //   child: Image.asset(
          //     '../assets/padrao.png',
          //     height: 100,
          //   ),
          // ),

          Image(
            image: this._imagemApp,
            height: 150,
          ),

          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                  '../assets/pedra.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                  '../assets/papel.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  '../assets/tesoura.png',
                  height: 100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
