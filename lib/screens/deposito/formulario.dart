import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _titleAppBar = 'Receber Depósito';
const _rotuloCampoValor = 'Valor';
const _mascaraCampoValor ='000.0';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioDeposito extends StatelessWidget{
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                mascara: _mascaraCampoValor,
                icone: Icons.monetization_on),
            RaisedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criaDeposito(context),
            ),
          ],
        ),
      ),
    );
    //throw UnimplementedError();
  }

  _criaDeposito(context){
    final double valor = double.tryParse(_controladorCampoValor.text);
    final depositoValido  = _validaDeposito(valor);

    if(depositoValido){
      _atualizaEstado(context, valor);
      Navigator.pop(context);
    }

  }

  _validaDeposito(valor){
    final _campoPreenchido = valor != null;

    return _campoPreenchido;
  }

  _atualizaEstado(context, valor){
    Provider.of<Saldo>(context, listen:false).adiciona(valor);
  }
}