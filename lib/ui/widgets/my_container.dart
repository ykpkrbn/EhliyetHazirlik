import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  Color? color;
  Widget? child;
   MyContainer({Key? key, this.color, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: color
      ),
      child: Center(child: child)
    );
  }
}
