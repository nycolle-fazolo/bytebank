import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/screens/dashboard/saldo.dart';
import 'package:bytebank/screens/deposito/formulario.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('ByteBank'),
      ),
      body: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),
           RaisedButton(
                child: Text('Receber depósito'),
                onPressed: () {
                  //saldo.adiciona(10);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FormularioDeposito();
                  }));
                }),
          RaisedButton(
              child: Text('Realizar transferência'),
              onPressed: () {
                //saldo.adiciona(10);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ListaTransferencias();
                }));
              }),
        ],
      ),
    );
    //throw UnimplementedError();
  }
}
