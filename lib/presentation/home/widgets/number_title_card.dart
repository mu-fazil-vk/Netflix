import 'package:flutter/cupertino.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  final List<String> posterList;
  const NumberTitleCard({
    super.key,
    required this.posterList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: "Top 10 Tv Shows in India Today"),
        kHeight,
        LimitedBox(
          maxHeight: 230,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => NumberCard(
                    index: index,
                    imageUrl: posterList[index],
                  ),
              separatorBuilder: (context, index) => kWidth,
              itemCount: posterList.length),
        ),
      ],
    );
  }
}
