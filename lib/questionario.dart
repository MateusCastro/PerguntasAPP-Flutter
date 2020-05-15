import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.responder,
  });

  bool get temPerguntaSelecionada => perguntaSelecionada < perguntas.length;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]["respostas"]
        : null;
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]["pergunta"]),
        ...respostas.map(
            (resp) => Resposta(resp["texto"], () => responder(resp["valor"])))
      ],
    );
  }
}
