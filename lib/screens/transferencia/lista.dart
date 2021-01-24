import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Lista Transferencias';

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: Consumer<Transferencias>(
        builder: (context, transferencias, child) {
          return ListView.builder(
            itemCount: transferencias.transferencias.length,
            itemBuilder: (context, indice) {
              final transferencia = transferencias.transferencias[indice];
              //debugPrint('Item $indice - $transferencia');
              return ItemTransferencia(transferencia);
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          /*final Future<Transferencia> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));*/
          /*future.then((transferenciaRecebida) {
            Future.delayed(Duration(seconds: 1), () {
              _atualiza(transferenciaRecebida);
            });
          });*/

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
        },
      ),
    );
  }

}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.toStringValor()),
      subtitle: Text(_transferencia.toStringConta()),
    ));
  }
}
