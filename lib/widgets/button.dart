import 'package:flutter/material.dart';


class MyCustomButton extends StatelessWidget {
  double sizeBox;
  String labelText;
  Color ?color;
  Color ?backgroundColor;
  final GestureTapCallback onPress;
  Widget icon;

  MyCustomButton({super.key,
    this.sizeBox = 0,
    required this.labelText,
    this.color = Colors.white,
    this.backgroundColor = Colors.blue,
    required this.onPress,
    required this.icon,
});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
              ),
            ),
            onPressed: onPress, child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: sizeBox,),
            Text(
              labelText,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w500, color: color),
            ),
            SizedBox(width: sizeBox,),
          ],
        ),
        ));
  }
}
