// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:paycom_app/constants.dart';
import 'package:paycom_app/successful.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CheckMail extends StatefulWidget {
  const CheckMail({super.key});

  @override
  State<CheckMail> createState() => _CheckMailState();
}

class _CheckMailState extends State<CheckMail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
                child: Text(
              'Check Your Inbox',
              style: kText10,
            )),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'A 6 digit code as been sent to john......@gmail.com. \nUse the code here',
              style: kText3,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            PinCodeTextField(
              appContext: context,
              keyboardType: TextInputType.number,
              length: 6,
              obscureText: false,
              obscuringCharacter: '*',
              blinkWhenObscuring: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                fieldHeight: 50,
                fieldWidth: 45,
                // activeColor: Color(0xff176b87),
                inactiveFillColor: Colors.white,
                inactiveColor: Colors.grey,
                borderWidth: 1,
                fieldOuterPadding: EdgeInsets.zero,
                activeFillColor: Colors.white,
                // selectedColor: Color(0xff176b87),
                borderRadius: BorderRadius.circular(8),

                // selectedFillColor: Colors.white,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: false,
              // controller: otp,
              onCompleted: (v) {
                // if (v == AuthService().userPin) {
                // Get.offAll(const BottomNavHome());
                // } else {
                // showToast('Invalid PIN');
                // }
              },
              onChanged: (String value) {},
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Successful(),
                  ),
                );
              },
              child: Text(
                'Resend Code',
                style: kText5,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Did not receive any code? Check your Spam folder or Resend the code again',
              style: kText3,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: const Text(
          'Verify',
          style: kText9,
        ),
        backgroundColor: const Color(0xff176b87),
        centerTitle: true,
      ),
    );
  }
}
