import 'package:flutter/material.dart';

class Invoice extends StatelessWidget {
  const Invoice({super.key});

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: 842,
        width: 700,
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/ORKUT DESIGN.jpg',
                  width: Width * 0.20,
                ),
                SizedBox(width: Width * 0.15),
                Container(
                  // color: Colors.yellowAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('INVOICE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Width * 0.02)),
                      Row(
                        // Changed Row to Text for single line
                        children: [
                          SizedBox(
                            width: Width * 0.02,
                          ),
                          Text('DATE: ',
                              style: TextStyle(
                                  fontSize: 13)), // Added space after colon
                        ],
                      ),
                      Row(
                        // Changed Row to Text for single line
                        children: [
                          Text('#INVOICE: ',
                              style: TextStyle(
                                  fontSize: 13)), // Added space after colon
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: Height * 0.03,
            ),
            Row(
              children: [
                SizedBox(
                  width: Width * 0.01,
                ),
                Container(
                  height: Height * 0.04,
                  width: Width * 0.12,
                  // color: Color(0xff374473),
                  color: Colors.black,
                  child: Row(
                    children: [
                      SizedBox(
                        width: Width * 0.01,
                      ),
                      Text(
                        'BILL TO',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Width * 0.18,
                ),
                Text(
                  'PRODUCT :',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: Width * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Text('Name :'),
                    SizedBox(
                      height: Height * 0.002,
                    ),
                    Text('Phone :'),
                    SizedBox(
                      height: Height * 0.002,
                    ),
                    Text('Address :'),
                    SizedBox(
                      height: Height * 0.002,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: Height*0.05,),
            Row(
              children: [
                SizedBox(
                  width: Width * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          right:
                          BorderSide(width: 1, color: Colors.black),
                          top:
                          BorderSide(width: 1, color: Colors.black),
                          bottom:
                          BorderSide(width: 1, color: Colors.black),
                          left: BorderSide(
                              width: 1, color: Colors.black))),
                  width: Width*0.4,

                   // Adjust background color as needed
                  child: DataTable(

                      // border: TableBorder(verticalInside: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid)),
                    columnSpacing: 5,
                      dataRowMinHeight: 10 ,
                      dataRowMaxHeight: 40,
                      headingRowHeight: Height * 0.04,
                    columns:  [
                      DataColumn(
                        label: Text('S/I', style: TextStyle(color: Colors.white)),
                      ),

                      DataColumn(
                        label: Text('Description', style: TextStyle(color: Colors.white)),
                        // Set a wider width for the description column
                        // Adjust as needed
                      ),
                      DataColumn(
                        label: Text('Amount', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                    rows:  [
                      DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('Item 1')),
                        DataCell(Text(
                            '\$10.00')),
                        // Use appropriate formatting for currency// Assuming "Are" represents a question mark
                      ]),

                      DataRow(cells: [
                        DataCell(Text('2')),
                        DataCell(Text('Item 1')),
                        DataCell(Text(
                            '\$10.00')),
                        // Use appropriate formatting for currency// Assuming "Are" represents a question mark
                      ]),
                      DataRow(cells: [
                        DataCell(Text('3')),
                        DataCell(Text('Item 1')),
                        DataCell(Text(
                            '\$10.00')),
                        // Use appropriate formatting for currency// Assuming "Are" represents a question mark
                      ]),
                      DataRow(cells: [
                        DataCell(Text('4')),
                        DataCell(Text('Item 1')),
                        DataCell(Text(
                            '\$10.00')),
                        // Use appropriate formatting for currency// Assuming "Are" represents a question mark
                      ]),
                      DataRow(cells: [
                        DataCell(Text('5')),
                        DataCell(Text('Item 1')),
                        DataCell(Text(
                            '\$10.00')),
                        // Use appropriate formatting for currency// Assuming "Are" represents a question mark
                      ]),
                    ],
                      headingRowColor: MaterialStateColor.resolveWith((states) =>
                          // Color(0xff374473)
                        Colors.black
                        ,)
                  ),
                ),
              ],
            ),
            SizedBox(height: Height*0.01,),
            Row(
              children: [
                SizedBox(
                  width: Width * 0.01,
                ),
                Container(
                  width: Width*0.2,
                  height: Height*0.18,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child:Column(
                    children: [
                      Container(
                        width: Width*0.2,
                        color:Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text('Comments',style: TextStyle(color: Colors.black),),
                        ),
                      ),
                      Container()
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
