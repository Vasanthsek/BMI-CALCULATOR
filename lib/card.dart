import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final Color colour;
  final Widget childd;
  final Function onPress;
  const CustomWidget({Key? key, required this.colour, required this.childd, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: colour),
        child: childd,
      ),
    );
  }
}
