import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TrasnferList(),
      ),
    );
  }
}

class transferForm extends StatelessWidget {
  final TextEditingController _controllerFieldAccountNumber =
      TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Transferência'),
      ),
      body: Column(
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
              onPressed: () => _createtransfer(context))
        ],
      ),
    );
  }

  void _createtransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_controllerFieldAccountNumber.text);
    final double value = double.tryParse(_controllerFieldValue.text);

    if (accountNumber != null && value != null) {
      final newTransfer = Transfer(value, accountNumber);
      Navigator.pop(context, newTransfer);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String tip;
  final IconData icon;

  const Editor({this.controller, this.label, this.tip, this.icon});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: tip,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class TrasnferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transferências'),
        ),
        body: Column(children: <Widget>[
          TransferItem(Transfer(100.00, 1234)),
          TransferItem(Transfer(200.00, 4434)),
          TransferItem(Transfer(150.00, 2222))
        ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            final Future<Transfer> future =
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return transferForm();
            }));

            future.then((reicevedTransfer) {
              debugPrint('Cheguei aqui');
              debugPrint(reicevedTransfer.toString());
            });
          },
        ));
  }
}

class TransferItem extends StatelessWidget {
  final Transfer transfer;

  const TransferItem(this.transfer);

  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(transfer.value.toString()),
      subtitle: Text(transfer.accountNumber.toString()),
    ));
  }
}

class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);
}
