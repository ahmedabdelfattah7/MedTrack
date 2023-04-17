import 'package:flutter/material.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10,),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.teal[200],
              height: 2,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'OR',
              style: TextStyle(
                color: Color(0xff8d8e98),
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.teal[200],
              height: 2,
            ),
          ),
        ],),
    );
  }
}
class HaveAccountQuestion extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;
  final String? btnLabel;

const  HaveAccountQuestion(
      {super.key, required this.label, required this.onPressed, required this.btnLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$label',
          style:  Theme.of(context).textTheme.bodyMedium,
        ),
        TextButton(
          onPressed: onPressed,

          child: Text('$btnLabel',

          ),
        ),
      ],
    );
  }
}