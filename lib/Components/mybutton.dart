import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final  Function()? onTap;
  final String text;
  const Mybutton({super.key,required this.onTap,required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 35),
        decoration: BoxDecoration(color: Colors.blue.shade500,
        borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text,
          style: const TextStyle(color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
