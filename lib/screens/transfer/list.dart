import 'package:alura_01/models/transfer.dart';
import 'package:alura_01/screens/transfer/form.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Transferências';

class TrasnferList extends StatefulWidget {
  final List<Transfer> _transfer = List();

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TrasnferList> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_appBarTitle),
        ),
        body: ListView.builder(
          itemCount: widget._transfer.length,
          itemBuilder: (context, index) {
            return TransferItem(widget._transfer[index]);
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.orange,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TransferForm();
            })).then((reicevedTransfer) => _updateList(reicevedTransfer));
          },
        ));
  }

  void _updateList(Transfer reicevedTransfer) {
    if (reicevedTransfer != null) {
      setState(() {
        widget._transfer.add(reicevedTransfer);
      });
    }
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
