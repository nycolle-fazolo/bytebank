import 'package:flutter/material.dart';

class Saldo extends ChangeNotifier {
  final double valor;

  Saldo(this.valor);

  @override
  String toString(){
    //cria uma mascara que sempre apresenta ao utilizar o metodo toString
    return 'R\$ $valor';
  }
}