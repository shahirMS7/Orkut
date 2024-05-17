import 'package:flutter/material.dart';

class BillingForm extends StatefulWidget {
  @override
  _BillingFormState createState() => _BillingFormState();
}

class _BillingFormState extends State<BillingForm> {
  final List<Map<String, dynamic>> _billItems = [];

  void _addItem() {
    setState(() {
      _billItems.add({
        'description': '',
        'amount': 0.0,
      });
    });
  }

  void _removeItem(int index) {
    setState(() {
      _billItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Billing Form'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _billItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: TextField(
                    onChanged: (value) {
                      setState(() {
                        _billItems[index]['description'] = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Description',
                    ),
                  ),
                  trailing: SizedBox(
                    width: 100,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _billItems[index]['amount'] = double.parse(value);
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Amount',
                      ),
                    ),
                  ),
                  onTap: () => _removeItem(index),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: _addItem,
            child: Text('Add Item'),
          ),
          Text('Total Amount: ${_billItems.fold<double>(0, (total, item) => total + (item['amount'] as double)).toInt()}'), // Convert total amount to int

          ElevatedButton(
            onPressed: () {
              // Code to download the bill
            },
            child: Text('Download Bill'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BillingForm(),
  ));
}
