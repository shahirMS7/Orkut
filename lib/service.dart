import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:one_clock/one_clock.dart';
import 'package:orkut/discription%20box.dart';
import 'package:orkut/invoice.dart';

class ServiceBill extends StatefulWidget {
  const ServiceBill({Key? key});

  @override
  State<ServiceBill> createState() => _ServiceBillState();
}

class _ServiceBillState extends State<ServiceBill> {
  late TextEditingController _dateController = TextEditingController();
  late DateTime _selectedDate = DateTime.now(); // Initialize _selectedDate
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: Height,
        width: Width,
        child: Column(
          children: [
            SizedBox(
              height: Height * 0.02,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: Height * 0.05,
                      width: Width * 0.05,
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        
                      ),
                      child: Center(
                        child: IconButton(
                          icon: ImageIcon(
                            const AssetImage('assets/icons/left.png'),
                            size: Height * 0.06,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.85,
                    )
                  ],
                ),
                SizedBox(
                  width: Width * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                    color:Colors.white.withOpacity(0.8),
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  height: Height * 0.94,
                  width: Width * 0.92,
                  child: Column(
                    children: [
                      SizedBox(
                        height: Height * 0.01,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Width * 0.01,
                          ),
                          Text(
                            'Service Bill',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          // Flexible( // Use Flexible instead of Expanded
                          //   child: Container(
                          //     width: Width * 0.08,
                          //     height: Height * 0.05,
                          //     child: Row(
                          //       mainAxisSize: MainAxisSize.min,
                          //       children: [
                          //         DigitalClock(
                          //           showSeconds: true,
                          //           textScaleFactor: 1,
                          //           isLive: true,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            width: Width * 0.01,
                          ),
                        ],
                      ),

                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Width * 0.01,
                          ),
                          Text(
                            'Customer Details',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Height * 0.008,
                      ),
                      Container(
                        width: Width * 0.9,
                        height: Height * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(),
                        ),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Width * 0.01,
                              ),
                              Text('Name'),
                              SizedBox(
                                width: Width * 0.01,
                              ),
                              Expanded( // Wrap the TextField with Expanded
                                child: SizedBox(
                                  height: Height * 0.1,
                                  child: TextField(
                                    controller: _nameController,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Width * 0.015,
                              ),
                              Text('Phone Number'),
                              SizedBox(
                                width: Width * 0.01,
                              ),
                              Expanded( // Wrap the TextField with Expanded
                                child: SizedBox(
                                  height: Height * 0.1,
                                  child: TextField(
                                    cursorColor: Colors.black,
                                    cursorErrorColor: Colors.black,
                                    decoration: InputDecoration(
                                      prefixText: '+91 ',
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    maxLength: 10,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Width * 0.015,
                              ),
                              Text('Date'),
                              SizedBox(
                                width: Width * 0.01,
                              ),
                              Expanded( // Wrap the TextField with Expanded
                                child: SizedBox(
                                  height: Height * 0.1,
                                  child: TextField(
                                    cursorColor: Colors.black,
                                    controller: _dateController,
                                    readOnly: true,
                                    onTap: () {
                                      _selectDate(context);
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Select Date',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Width * 0.015,
                              ),
                              Text('Product Type'),
                              SizedBox(
                                width: Width * 0.01,
                              ),
                              Expanded( // Wrap the TextField with Expanded
                                child: SizedBox(
                                  height: Height * 0.1,
                                  child: TextField(),
                                ),
                              ),
                              SizedBox(
                                width: Width * 0.01,
                              )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: Height * 0.01,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Width * 0.01,
                          ),
                          Text(
                            'Enter Credential',
                            style: TextStyle(fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          SizedBox(width: Width*0.355,),
                          Text(
                            'Invoice',
                            style: TextStyle(fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Height * 0.008,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Width * 0.01,
                          ),
                          Discription(),
                          SizedBox(width: Width*0.02,),
                          Container(
                            width: Width * 0.455,

                            height: Height * 0.62,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(),
                              color: Colors.yellow,),
                            // child: Invoice(),
                          )
                        ],
                      ),
                      SizedBox(height: Height*0.01,)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to show date picker dialog
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text =
            '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
      });
    }
  }
}
