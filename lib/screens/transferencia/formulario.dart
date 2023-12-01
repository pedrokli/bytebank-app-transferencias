import 'package:flutter/material.dart';
import '../../components/editor.dart';
import '../../models/transferencia.dart';

const _tituloAppbar = 'Criando Transferência';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia>{
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(_tituloAppbar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(controlador: _controladorCampoNumeroConta, rotulo: _rotuloCampoNumeroConta, dica: _dicaCampoNumeroConta, icone: null),
              Editor(controlador: _controladorCampoValor, rotulo: _rotuloCampoValor, dica: _dicaCampoValor, icone: Icons.monetization_on),
              ElevatedButton(
                  onPressed: () => _criaTransferencia(context),
                  child: const Text(_textoBotaoConfirmar))
            ],
          ),
        )
    );
  }

  void _criaTransferencia(BuildContext context) {
    debugPrint('clicou no confirmar');
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if(numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
