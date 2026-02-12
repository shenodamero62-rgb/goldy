import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.color, this.onPressed});
  final String text;
  final void Function()?onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width/2,
        
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(color),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(14)))         ),
          onPressed:onPressed , child: Text(text,style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),
          textAlign: TextAlign.center,)),
      ),
    );
  }
}