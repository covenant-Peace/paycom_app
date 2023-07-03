// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paycom_app/signup.dart';
import 'package:paycom_app/successful.dart';

import 'auth.dart';
import 'constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isSeen = false;
  bool isSpinning = false;
  TextEditingController textPassword = TextEditingController();
  TextEditingController textEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 40, left: 25, right: 25),
        child: Column(
          children: [
            const Center(
                child: Text(
              'payCOM',
              style: kText1,
            )),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Join us now',
              style: kText2,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              // margin: EdgeInsets.only(left: 25, right: 25),
              // height: 40,
              alignment: Alignment.center,
              constraints: const BoxConstraints(
                minHeight: 40,
                maxHeight: 50,
              ),
              // padding: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                border: const Border(
                  top: BorderSide(
                      color: Color(0xFF64ccc5),
                      width: 1,
                      style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Color(0xFF64ccc5),
                      width: 1,
                      style: BorderStyle.solid),
                  left: BorderSide(
                      color: Color(0xFF64ccc5),
                      width: 1,
                      style: BorderStyle.solid),
                  right: BorderSide(
                      color: Color(0xFF64ccc5),
                      width: 1,
                      style: BorderStyle.solid),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: SvgPicture.asset('assets/email.svg'),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email Address',
                    hintStyle: kText3,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: textEmail,
                  style: kText3,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              // margin: EdgeInsets.only(left: 25, right: 25),
              // height: 40,
              alignment: Alignment.center,
              constraints: const BoxConstraints(
                minHeight: 40,
                maxHeight: 50,
              ),
              // padding: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                border: const Border(
                  top: BorderSide(
                      color: Color(0xFF64ccc5),
                      width: 1,
                      style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Color(0xFF64ccc5),
                      width: 1,
                      style: BorderStyle.solid),
                  left: BorderSide(
                      color: Color(0xFF64ccc5),
                      width: 1,
                      style: BorderStyle.solid),
                  right: BorderSide(
                      color: Color(0xFF64ccc5),
                      width: 1,
                      style: BorderStyle.solid),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: SvgPicture.asset('assets/password.svg'),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      isSeen = !isSeen;
                    });
                  },
                  icon: Icon(
                    isSeen
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined,
                    color: const Color(0xff176b87),
                  ),
                ),
                title: TextField(
                  obscureText: !isSeen ? true : false,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    hintStyle: kText3,
                    border: InputBorder.none,
                  ),
                  style: kText3,
                  keyboardType: TextInputType.name,
                  controller: textPassword,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: kText8,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                if (textPassword.text.isNotEmpty && textEmail.text.isNotEmpty) {
                  setState(() {
                    isSpinning = true;
                  });
                  bool isSigned = await AuthService().login(
                    textPassword.text.trim(),
                    textEmail.text.trim(),
                    context,
                  );
                  if (isSigned == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Successful Login'),
                        duration: Duration(seconds: 6),
                      ),
                    );
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Successful()));
                    setState(() {
                      isSpinning = false;
                    });
                  }
                  setState(() {
                    isSpinning = false;
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please fill all fields'),
                      duration: Duration(seconds: 6),
                    ),
                  );
                }
              },
              child: Container(
                // margin: EdgeInsets.only(left: 25, right: 25),
                // height: 40,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 5),
                constraints: const BoxConstraints(
                  minHeight: 40,
                  maxHeight: 50,
                ),
                // padding: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xff001c30),
                ),
                child: isSpinning == false
                    ? Text(
                        'Sign in',
                        style: kText6,
                      )
                    : CircularProgressIndicator(
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white70, //<-- SEE HERE
                        ),
                      ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account? ',
                  style: kText3,
                ),
                GestureDetector(
                  child: const Text(
                    'Register now',
                    style: kText7,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
