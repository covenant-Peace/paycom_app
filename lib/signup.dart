// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:paycom_app/auth.dart';
import 'package:paycom_app/constants.dart';
import 'package:paycom_app/login.dart';
import 'package:paycom_app/screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isSeen = false;
  bool isChosen1 = true;
  bool isChosen2 = false;
  bool isSpinning = false;

  String textNumber = '';
  String carrierCode = '';
  String defaultCountry = '';

  TextEditingController textName = TextEditingController();
  TextEditingController textEmail = TextEditingController();

  // TextEditingController textNumber = TextEditingController();
  TextEditingController textPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
        child: ListView(
          children: [
            Center(
                child: Text(
              'payCOM',
              style: kText1,
            )),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                'Join us now',
                style: kText2,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            MyContainer(
              svgName: 'assets/name.svg',
              controller: textName,
              hint: 'Full Name',
              keyboard: TextInputType.name,
            ),
            SizedBox(
              height: 25,
            ),
            MyContainer(
              svgName: 'assets/email.svg',
              controller: textEmail,
              hint: 'Email Address',
              keyboard: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                minHeight: 40,
                maxHeight: 50,
              ),
              decoration: BoxDecoration(
                border: Border(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // textBaseline: TextBaseline.alphabetic,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 10,
                    ),
                    child: SvgPicture.asset('assets/phone.svg'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: IntlPhoneField(
                        decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: kText3,
                            border: InputBorder.none),
                        style: kText3,
                        initialCountryCode: '+234',
                        // controller: textNumber,
                        // textAlignVertical: TextAlignVertical.bottom,
                        onChanged: (phone) {
                          print(phone.completeNumber);
                          setState(() {
                            textNumber = phone.completeNumber;
                          });
                        },
                        onCountryChanged: (country) {
                          print(country.regionCode);
                          print(country.fullCountryCode);
                          print(country.dialCode);
                          setState(() {
                            carrierCode = country.dialCode;
                            defaultCountry = country.code;
                          });
                          print(country.code);
                        },
                        dropdownIconPosition: IconPosition.trailing,
                        // onSubmitted: (number) {
                        //   textNumber.text = number;
                        // },
                      ),
                    ),
                  )
                ],
                // ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              // margin: EdgeInsets.only(left: 25, right: 25),
              // height: 40,
              alignment: Alignment.center,
              constraints: BoxConstraints(
                minHeight: 40,
                maxHeight: 50,
              ),
              // padding: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                border: Border(
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
                    color: Color(0xff176b87),
                  ),
                ),
                title: TextField(
                  obscureText: !isSeen ? true : false,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: kText3,
                    border: InputBorder.none,
                  ),
                  style: kText3,
                  keyboardType: TextInputType.visiblePassword,
                  controller: textPassword,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '*Password should contain maximum 6 characters',
                style: kText4,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select Account Type',
                style: kText5,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isChosen2 = false;
                            isChosen1 = true;
                          });
                        },
                        child: Container(
                          // margin: EdgeInsets.only(left: 25, right: 25),
                          // height: 40,
                          alignment: Alignment.center,
                          constraints: BoxConstraints(
                            minHeight: 40,
                            maxHeight: 50,
                          ),
                          // padding: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: isChosen1 ? Color(0xffdafffb) : Colors.white,
                            border: Border(
                              top: BorderSide(
                                  color: isChosen1
                                      ? Color(0xff176b87)
                                      : Color(0xFF64ccc5),
                                  width: 1,
                                  style: BorderStyle.solid),
                              bottom: BorderSide(
                                  color: isChosen1
                                      ? Color(0xff176b87)
                                      : Color(0xFF64ccc5),
                                  width: 1,
                                  style: BorderStyle.solid),
                              left: BorderSide(
                                  color: isChosen1
                                      ? Color(0xff176b87)
                                      : Color(0xFF64ccc5),
                                  width: 1,
                                  style: BorderStyle.solid),
                              right: BorderSide(
                                  color: isChosen1
                                      ? Color(0xff176b87)
                                      : Color(0xFF64ccc5),
                                  width: 1,
                                  style: BorderStyle.solid),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/name.svg'),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'User',
                                style: kText3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isChosen1 == true)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SvgPicture.asset('assets/check.svg'),
                          ),
                        ),
                    ],
                    // fit: StackFit.expand,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isChosen1 = false;
                            isChosen2 = true;
                          });
                        },
                        child: Container(
                          // margin: EdgeInsets.only(left: 25, right: 25),
                          // height: 40,
                          alignment: Alignment.center,
                          constraints: BoxConstraints(
                            minHeight: 40,
                            maxHeight: 50,
                          ),
                          // padding: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  color: isChosen2
                                      ? Color(0xff176b87)
                                      : Color(0xFF64ccc5),
                                  width: 1,
                                  style: BorderStyle.solid),
                              bottom: BorderSide(
                                  color: isChosen2
                                      ? Color(0xff176b87)
                                      : Color(0xFF64ccc5),
                                  width: 1,
                                  style: BorderStyle.solid),
                              left: BorderSide(
                                  color: isChosen2
                                      ? Color(0xff176b87)
                                      : Color(0xFF64ccc5),
                                  width: 1,
                                  style: BorderStyle.solid),
                              right: BorderSide(
                                  color: isChosen2
                                      ? Color(0xff176b87)
                                      : Color(0xFF64ccc5),
                                  width: 1,
                                  style: BorderStyle.solid),
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: isChosen2 ? Color(0xffdafffb) : Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/merchant.svg'),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Merchant',
                                style: kText3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isChosen2 == true)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SvgPicture.asset('assets/check.svg'),
                          ),
                        ),
                    ],
                    // fit: StackFit.expand,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'By creating an account, you agree to our terms & conditions.',
              style: kText4,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                if (textPassword.text.isNotEmpty &&
                    textEmail.text.isNotEmpty &&
                    textNumber != '' &&
                    textName.text.isNotEmpty) {
                  setState(() {
                    isSpinning = true;
                  });
                  bool isSigned = await AuthService().createUser(
                    textName.text.trim(),
                    textEmail.text.trim(),
                    textNumber,
                    textPassword.text.trim(),
                    context,
                    defaultCountry,
                    carrierCode,
                  );
                  if (isSigned == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('An activation link has been sent your mail'),
                        duration: Duration(seconds: 6),
                      ),
                    );
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
                margin: EdgeInsets.only(bottom: 5),
                constraints: BoxConstraints(
                  minHeight: 40,
                  maxHeight: 50,
                ),
                // padding: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xff001c30),
                ),
                child: isSpinning == false
                    ? Text(
                        'Create Account',
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
                Text(
                  'Already have an account? ',
                  style: kText3,
                ),
                GestureDetector(
                  child: Text(
                    'Sign in now',
                    style: kText7,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
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
