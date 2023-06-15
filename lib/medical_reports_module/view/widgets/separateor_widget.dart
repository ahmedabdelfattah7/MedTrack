import 'package:flutter/material.dart';

class AppSeparator extends StatelessWidget {
  const AppSeparator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.teal[200],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
