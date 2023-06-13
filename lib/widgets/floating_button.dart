import 'package:flutter/material.dart';
import '../constants/colors.dart';

class MyFloatingButton extends StatelessWidget {
  final VoidCallback clk;
  final Icon icon;
  final Color color;

  const MyFloatingButton({super.key, required this.clk, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: const BoxDecoration(
          color: myColors.DarkGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(-2, 1),
            )
          ]),
      child: FloatingActionButton(
        backgroundColor: color,
        elevation: 8,
        onPressed: clk,
        child: icon,
      ),
    );
  }
}
