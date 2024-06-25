import 'package:flutter/cupertino.dart';
import 'package:netflix/presentation/widgets/custom_button_widget.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constans.dart';
import '../../widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String movieName;
  final String description;
  final String movieImage;

  const EveryonesWatchingWidget(
      {super.key,
      required this.movieName,
      required this.description,
      required this.movieImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight,
          FittedBox(
            child: Text(
              movieName,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: const TextStyle(
                  fontSize: 35, fontWeight: FontWeight.bold, letterSpacing: -4),
            ),
          ),
          kHeight,
          Text(
            description,
            maxLines: 4,
            style: const TextStyle(color: kGreyColor),
          ),
          kHeight50,
          VideoWidget(
            movieImage: movieImage,
          ),
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
                  ),
                ),
              ),
              const CustomButtonWidget(
                icon: CupertinoIcons.share,
                title: "Share",
                iconSize: 30,
                textSize: 15,
                textColor: kGreyColor,
              ),
              kWidth20,
              const CustomButtonWidget(
                icon: CupertinoIcons.add,
                title: "My List",
                iconSize: 30,
                textSize: 15,
                textColor: kGreyColor,
              ),
              kWidth20,
              const CustomButtonWidget(
                icon: CupertinoIcons.play_fill,
                title: "Play",
                iconSize: 30,
                textSize: 15,
                textColor: kGreyColor,
              ),
              kWidth
            ],
          ),
        ],
      ),
    );
  }
}
