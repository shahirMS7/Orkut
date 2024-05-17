import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orkut/invoice.dart';
import 'package:orkut/sales%20bill.dart';
import 'package:orkut/service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    List<Map<String, dynamic>> items = [
      {
        'title': 'Service Bill',
        'image': 'assets/icons/sale1.png',
        'page':  ServiceBill()

      },
      {
        'title': 'Sales Bill',
        'image': 'assets/icons/invoice.png',
        'page':  BillPage()
      },
      {
        'title': 'Estimate',
        'image': 'assets/icons/estimate.png',
        'page':  Invoice()
      },
      {
        'title': 'Completed List',
        'image': 'assets/icons/purchase.png',
      },
      {
        'title': 'Bills',
        'image': 'assets/icons/bills.png',
        // 'page': ServiceBill(),
      },
    ];
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Dashboard',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // FirebaseAuth.instance.signOut().then((value) =>
                        //     Navigator.of(context).pushAndRemoveUntil(
                        //         MaterialPageRoute(
                        //           builder: (context) => const SignIn(),
                        //         ),
                        //         (route) => false));
                      },
                      child: const Text(
                        'SignOut',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 2,
                thickness: 1,
                color: Colors.black,
              ),
              const SizedBox(
                height: 80,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Container(
                    height: height * 0.8,
                    width: width * 0.85,
                    child: GridView.builder(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 30,
                        childAspectRatio: 6 / 3.3,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => items[index]['page'],
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(),
                              image: DecorationImage(
                                image: AssetImage(
                                  items[index]['image'],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                items[index]['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.015,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
