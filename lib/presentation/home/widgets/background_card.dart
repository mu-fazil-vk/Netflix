import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/presentation/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  final mainImage;
  const BackgroundCard({
    required this.mainImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 700,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('$imageAppendUrl$mainImage'),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  icon: CupertinoIcons.add,
                  title: "My List",
                ),
                _playButton(),
                const CustomButtonWidget(
                  icon: CupertinoIcons.info_circle,
                  title: "Info",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(kBlackColor),
            backgroundColor: MaterialStateProperty.all(kWhiteColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ))),
        onPressed: () {},
        icon: const Icon(
          CupertinoIcons.play_fill,
          size: 25,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Play",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
