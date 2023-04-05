import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _mensagem = "Escolha uma Opção!";

  void _play(String choice) {
    List opcoes = ["pedra", "papel", "tesoura"];

    int i = Random().nextInt(opcoes.length);

    String randomChoice = opcoes[i];

    print("Clicado: " + choice + ", random: " + randomChoice);

    if ((choice == "pedra" && randomChoice == "tesoura") ||
        (choice == "papel" && randomChoice == "pedra") ||
        (choice == "tesoura" && randomChoice == "papel")) {
      setState(() {
        _mensagem = "Você VENCEU!";
      });
    } else if ((choice == "pedra" && randomChoice == "papel") ||
        (choice == "papel" && randomChoice == "tesoura") ||
        (choice == "tesoura" && randomChoice == "pedra")) {
      setState(() {
        _mensagem = "Você PERDEU!";
      });
    } else {
      setState(() {
        _mensagem = "EMPATE!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedra, Papel ou Tesoura'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              "images/base1.png",
              height: 150,
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                _mensagem,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _play("pedra"),
                  child: Image.asset(
                    "images/pedra.png",
                    height: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => _play("papel"),
                  child: Image.asset(
                    "images/papel.png",
                    height: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => _play("tesoura"),
                  child: Image.asset(
                    "images/tesoura.png",
                    height: 80,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
