import 'package:carparking/common_widget/loader.dart';
import 'package:carparking/services/firebase_login.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final key1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            padding: EdgeInsets.only(
                left: 35, top: MediaQuery.of(context).size.height * 0.19),
            child: const Text(
              "Welcome\nBack",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: key1,
              child: Container(
                padding: EdgeInsets.only(
                    right: 35,
                    left: 35,
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(children: [
                  TextFormField(
                    controller: emailC,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: passwordC,
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('AdminLogin');
                      },
                      child: const Text(
                        'Admin/Security Login',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff4c505b),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color(0xff4c505b),
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xff4c505b),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            // Navigator.pushNamed(context, 'home');
                            if (key1.currentState!.validate()) {
                              Auth.signIn(
                                  email: emailC.text,
                                  password: passwordC.text,
                                  context: context);
                            }
                          },
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'register');
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Color(0xff4c505b),
                            ),
                          ),
                        ),
                        // TextButton(
                        //   onPressed: () {},
                        //   child: const Text(
                        //     'Forgot Password',
                        //     style: TextStyle(
                        //       decoration: TextDecoration.underline,
                        //       fontSize: 18,
                        //       color: Color(0xff4c505b),
                        //     ),
                        //   ),
                        // ),
                      ]),
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
