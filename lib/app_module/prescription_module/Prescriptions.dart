import 'package:flutter/material.dart';

class Prescriptions extends StatelessWidget {
  const Prescriptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('Prescriptions',
              style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
