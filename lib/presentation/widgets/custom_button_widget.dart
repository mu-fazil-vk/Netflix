import 'package:flutter/cupertino.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.iconSize = 30,
      this.textSize = 18,
      this.textColor = kWhiteColor});

  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: iconSize,
        ),
        kHeight5,
        Text(
          title,
          style: TextStyle(fontSize: textSize, color: textColor),
        )
      ],
    );
  }
}
