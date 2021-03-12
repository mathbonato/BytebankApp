import 'package:alura_01/components/editor.dart';
import 'package:alura_01/models/transfer.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Criar Transferência';

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _controllerFieldAccountNumber =
      TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _controllerFieldAccountNumber,
              label: 'Número da conta',
              tip: '0000',
            ),
            Editor(
              controller: _controllerFieldValue,
              label: 'Valor',
              tip: '0.00',
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text('Confirmar'),
              color: Colors.orange,
              onPressed: () => _createTransfer(context),
            )
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_controllerFieldAccountNumber.text);
    final double value = double.tryParse(_controllerFieldValue.text);

    if (accountNumber != null && value != null) {
      final newTransfer = Transfer(value, accountNumber);
      Navigator.pop(context, newTransfer);
    }
  }
}
