import 'package:flutter/material.dart';
import 'package:calulator/constants.dart';

class BottonButton extends StatelessWidget {
  BottonButton({required this.onTap, required this.buttonTitle});
  final Function()? onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColour,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
