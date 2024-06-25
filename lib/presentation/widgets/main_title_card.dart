import 'package:flutter/cupertino.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';


class MainTitleCard extends StatelessWidget {
  final String title;
  final List<String> posterList;
  const MainTitleCard({
    super.key,
    required this.title,
    required this.posterList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kHeight,
        LimitedBox(
          maxHeight: 230,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => MainCard(imageUrl: posterList[index],),
              separatorBuilder: (context, index) => kWidth,
              itemCount: posterList.length),
        ),
      ],
    );
  }
}
