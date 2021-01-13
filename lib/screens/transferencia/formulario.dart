
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Nova Transferencia'; //atributo privado
const _rotuloCampoValor = 'Valor';
const _mascaraCampoValor ='000.0';
const _rotuloCampoNumeroConta = 'Número da Conta';
const _mascaraCampoNumeroConta = '0000';
const _textoBotaoConfirmar = 'Confirmar';


class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormulatioTransferenciaState();
    //throw UnimplementedError();
  }
}

class FormulatioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController(); //atributo privado
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controlador: _controladorCampoNumeroConta,
                mascara: _mascaraCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                mascara: _mascaraCampoValor,
                icone: Icons.monetization_on),
            RaisedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    //debugPrint(_controladorCampoNumeroConta.text);
    //debugPrint(_controladorCampoValor.text);

    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (valor != null && numeroConta != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);

      debugPrint('Criando - $transferenciaCriada');
      /*Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('$transferenciaCriada'),
        ),
      );*/
    }
  }
}
