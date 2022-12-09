import 'package:flutter/material.dart';

import '../utilities/color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({Key? key, required this.text,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: ElevatedButton(onPressed:onPressed,
          child: Text(text,
          style: const TextStyle(fontSize: 17),),
          style: ElevatedButton.styleFrom(
          primary: buttonColor,
              minimumSize: const Size(
             double.infinity, // width takes all space
             50 // height
           ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(color: buttonColor),
            )
      ),
      ),
    );
  }
}
