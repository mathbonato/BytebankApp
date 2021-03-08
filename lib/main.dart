import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Transferências'),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
          ),
          body: transferForm()),
    );
  }
}

class transferForm extends StatelessWidget {
  final TextEditingController _controllerFieldAccountNumber =
      TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controllerFieldAccountNumber,
            style: TextStyle(
              fontSize: 24.0,
            ),
            decoration: InputDecoration(
              labelText: 'Número da conta',
              hintText: '0000',
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controllerFieldValue,
            style: TextStyle(
              fontSize: 24.0,
            ),
            decoration: InputDecoration(
              icon: Icon(Icons.monetization_on),
              labelText: 'Valor',
              hintText: '0.00',
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        RaisedButton(
          child: Text('Confirmar'),
          onPressed: () {
            final int accountNumber =
                int.tryParse(_controllerFieldAccountNumber.text);
            final double value = double.tryParse(_controllerFieldValue.text);

            if (accountNumber != null && value != null) {
              Transfer(value, accountNumber);
            }
          },
        )
      ],
    );
  }
}

class TrasnferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TransferItem(Transfer(100.00, 1234)),
      TransferItem(Transfer(200.00, 4434)),
      TransferItem(Transfer(150.00, 2222))
    ]);
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  const TransferItem(this._transfer);

  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transfer.value.toString()),
      subtitle: Text(_transfer.accountNumber.toString()),
    ));
  }
}

class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);
}
