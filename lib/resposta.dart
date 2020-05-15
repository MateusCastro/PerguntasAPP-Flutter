import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final Function resposta;

  Resposta(this.texto, this.resposta);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(texto),
        textColor: Colors.white,
        color: Colors.blue,
        onPressed: resposta,
      ),
    );
  }
}
