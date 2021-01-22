import 'package:flutter/material.dart';

class Saldo extends ChangeNotifier {
  double valor;

  Saldo(this.valor);

  void adiciona(double valor){
    this.valor += valor;

    notifyListeners();
  }

  void subtrai(double valor){
    this.valor -= valor;

    notifyListeners();
  }

  @override
  String toString(){
    //cria uma mascara que sempre apresenta ao utilizar o metodo toString
    return 'R\$ $valor';
  }
}