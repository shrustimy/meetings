import 'package:flutter/material.dart';
import 'package:meetings/utilities/color.dart';

class MeetOption extends StatelessWidget {
  final String text;
  final bool Mute;
  final Function(bool) onChange;
  const MeetOption({Key? key,
    required this.text,
    required this.Mute,
    required this.onChange,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text, style: const TextStyle(fontSize: 16 ),)),
          Switch.adaptive(value: Mute, onChanged: onChange)
        ],
      ),
    );
  }
}
