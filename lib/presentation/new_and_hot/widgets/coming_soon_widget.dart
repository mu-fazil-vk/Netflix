import 'package:flutter/cupertino.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constans.dart';
import '../../widgets/custom_button_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final int id;
  final String day;
  final String month;
  final String dayName;
  final String movieName;
  final String movieImage;
  final String description;

  const ComingSoonWidget(
      {super.key,
      required this.id,
      required this.day,
      required this.month,
      required this.dayName,
      required this.movieName,
      required this.movieImage,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                month,
                style: const TextStyle(fontSize: 20, color: kGreyColor),
              ),
              Text(
                day,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(movieImage: movieImage),
              kHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -4),
                    ),
                  ),
                  //const Spacer(),
                  const CustomButtonWidget(
                    icon: CupertinoIcons.bell,
                    title: "Remind me",
                    iconSize: 25,
                    textSize: 13,
                    textColor: kGreyColor,
                  ),
                  kWidth20,
                  const CustomButtonWidget(
                    icon: CupertinoIcons.info_circle,
                    title: "Info",
                    iconSize: 25,
                    textSize: 13,
                    textColor: kGreyColor,
                  ),
                  kWidth
                ],
              ),
              kHeight,
              Text("Coming on $dayName"),
              kHeight,
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              Text(
                description,
                maxLines: 4,
                style: const TextStyle(color: kGreyColor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
