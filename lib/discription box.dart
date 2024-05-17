import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Discription extends StatelessWidget {
  const Discription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;

    return Container(
      height: Height * 0.62,
      width: Width * 0.42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      child: Column(
        children: [
          SizedBox(height: Height * 0.02),
          SingleChildScrollView(
            child: Container(
              width: Width * 0.4,
              height: Height * 0.5,
              // color: Colors.greenAccent,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  dividerThickness: 1,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  columns: [
                    DataColumn(label: Text('S/N')),
                    DataColumn(label: Text('Item')),
                    DataColumn(label: Text('Amount')),
                  ],
                  rows: List.generate(
                    5,
                        (index) => DataRow(cells: [
                      DataCell(TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          // Handle changes
                        },
                      )),
                      DataCell(TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          // Handle changes
                        },
                      )),
                      DataCell(TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          // Handle changes
                        },
                      )),
                    ]),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: Height * 0.01),
         
        ],
      ),
    );
  }
}
