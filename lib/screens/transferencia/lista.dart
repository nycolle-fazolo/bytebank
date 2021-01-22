import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Lista Transferencias';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaTransferenciasState();
    //throw UnimplementedError();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    //widget._transferencias.add(Transferencia(200.5, 9898));
    //widget._transferencias.add(Transferencia(250.8, 9898));

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          //debugPrint('Item $indice - $transferencia');
          return ItemTransferencia(transferencia);
        },
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
          })).then((transferenciaRecebida) => _atualiza(transferenciaRecebida));
        },
      ),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida) {
    debugPrint('Recebido - $transferenciaRecebida');

    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
    //setState(() {});
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _itransferencia;

  ItemTransferencia(this._itransferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_itransferencia.valor.toString()),
      subtitle: Text(_itransferencia.numeroConta.toString()),
    ));
  }
}
