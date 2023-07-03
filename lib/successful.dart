import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants.dart';

class Successful extends StatefulWidget {
  const Successful({super.key});

  @override
  State<Successful> createState() => _SuccessfulState();
}

class _SuccessfulState extends State<Successful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20,),
        child: Column(
          children: [
            const Center(child: Text('Welcome Olurotimi', style: kText11,)),
            const SizedBox(height: 60,),
            SvgPicture.asset('assets/confirm.svg'),
            const SizedBox(height: 40,),
            const Text('Email Confirmed Successfully', style: kText7,),
            const SizedBox(height: 20,),
            const Text('You will be redirected shortly', style: kText3,)
          ],
        ),
      ),
    );
  }
}
