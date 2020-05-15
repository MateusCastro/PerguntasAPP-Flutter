import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() {
  runApp(Perguntas());
}

class Perguntas extends StatefulWidget {
  @override
  _PerguntasState createState() => _PerguntasState();
}

class _PerguntasState extends State<Perguntas> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      "pergunta": "Qual sua cor favorita?",
      "respostas": [
        {"texto": "Azul", "valor": 10},
        {"texto": "Vermelho", "valor": 5},
        {"texto": "Amarelo", "valor": 3},
        {"texto": "Preto", "valor": 1},
      ]
    },
    {
      "pergunta": "Qual o seu animal favorito?",
      "respostas": [
        {"texto": "Cachorro", "valor": 10},
        {"texto": "Gato", "valor": 5},
        {"texto": "Vaca", "valor": 3},
        {"texto": "Cavalo", "valor": 1},
      ]
    },
    {
      "pergunta": "Qual o seu instrutor favorito?",
      "respostas": [
        {"texto": "Maria", "valor": 10},
        {"texto": "Ricardo", "valor": 5},
        {"texto": "Mateus", "valor": 3},
        {"texto": "Fernanda", "valor": 1},
      ]
    },
  ];

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada => _perguntaSelecionada < _perguntas.length;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Perguntas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text("Perguntas")),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder,
                )
              : Resultado(_pontuacaoTotal, _reiniciarQuestionario)),
    );
  }
}
