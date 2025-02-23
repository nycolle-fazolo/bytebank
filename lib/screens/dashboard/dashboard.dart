import 'package:bytebank/screens/dashboard/saldo.dart';
import 'package:bytebank/screens/deposito/formulario.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:bytebank/screens/transferencia/ultimas.dart';
import 'package:flutter/material.dart';

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
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text('Receber depósito'),
                  onPressed: () {
                    //saldo.adiciona(10);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FormularioDeposito();
                    }));
                  }),
              RaisedButton(
                  child: Text('Nova transferência'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FormularioTransferencia();
                    }));
                  }),
            ],
          ),
          UltimasTransferencias(),
        ],
      ),
    );
    //throw UnimplementedError();
  }
}
