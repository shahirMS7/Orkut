import 'package:flutter/material.dart';
import 'package:orkut/homepage.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signinKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(width: width * 0.05),
            Container(
              height: height * 0.4,
              width: width * 0.4,
              child: Image.asset(
                'assets/images/orkut.png',
              ),
            ),
            SizedBox(
              width: width * 0.1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.015),
                  height: height * .65,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.03),
                      // color: Colors.blueAccent,
                      border: Border.all(width: 2)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.05,
                      ),
                      const Text(
                        'Sign In',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      SizedBox(
                        height: height * 0.45,
                        width: width * 0.25,
                        // color: Colors.redAccent,
                        child: Form(
                          key: signinKey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Username',
                                      style: TextStyle(
                                          fontSize: height * 0.022,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height * 0.005),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "* required field";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                  style: const TextStyle(color: Colors.black),
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide:
                                        const BorderSide(width: 2),
                                        borderRadius: BorderRadius.circular(
                                            width * 0.005),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            width * 0.005),
                                        borderSide: const BorderSide(
                                            width: 2, color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            width * 0.005),
                                        borderSide: const BorderSide(
                                            width: 2, color: Colors.black),
                                      ),
                                      hintText: 'Enter your Username',
                                      hintStyle: const TextStyle(
                                          color: Colors.grey)),
                                 
                                ),
                                SizedBox(
                                  height: height * 0.04,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Password',
                                      style: TextStyle(
                                          fontSize: height * 0.022,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height * 0.005),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "* required field";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: true,
                                  style: const TextStyle(color: Colors.black),
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    // suffixIcon: IconButton(
                                    //   icon: Icon(
                                    //     passwordController.obscureText
                                    //         ? Icons.visibility_off
                                    //         : Icons.visibility,
                                    //     color: Colors.grey,
                                    //   ),
                                    //   onPressed: () {
                                    //     signinController.changeObscure();
                                    //   },
                                    // ),
                                      border: OutlineInputBorder(
                                        borderSide:
                                        const BorderSide(width: 2),
                                        borderRadius: BorderRadius.circular(
                                            width * 0.005),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            width * 0.005),
                                        borderSide: const BorderSide(
                                            width: 2, color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            width * 0.005),
                                        borderSide: const BorderSide(
                                            width: 2, color: Colors.black),
                                      ),
                                      hintText: 'Enter your password',
                                      hintStyle: const TextStyle(
                                          color: Colors.grey)),
                                ),
                                SizedBox(height: height * 0.05),
                                SizedBox(
                                  height: height * 0.08,
                                  width: width * 0.3,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (signinKey.currentState!.validate()) {
                                        String username =
                                        emailController.text.trim();
                                        String password =
                                        passwordController.text.trim();
                                        if (username == 'admin' &&
                                            password == '1234') {
                                          // Navigate to next page
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage(), // Replace NextPage() with your actual next page widget
                                            ),
                                          );
                                        } else {
                                          // Show error message
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Username or password is incorrect'),
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      Colors.black, // Background color
                                      foregroundColor:
                                      Colors.white, // Text color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            width * 0.05),
                                      ),
                                    ),
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: height * 0.025),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
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
}