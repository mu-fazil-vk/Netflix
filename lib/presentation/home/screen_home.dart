import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/number_title_card.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

import '../../core/strings.dart';

ValueNotifier scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensuring that the HomeBloc is available in the widget tree
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData()),
    );
    
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, value, child) =>
            NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CupertinoActivityIndicator(
                        color: kWhiteColor,
                      ),
                    );
                  } else if (state.isError) {
                    return const Center(
                      child: Text("Error while getting data"),
                    );
                  }

                  final releasedPastYear = state.pastYearMovies
                      .map((m) => '$imageAppendUrl${m.posterPath}')
                      .toList();
                  final trendingNow = state.trendingNow
                      .map((m) => '$imageAppendUrl${m.posterPath}')
                      .toList();
                  final top10 = state.top10
                      .map((m) => '$imageAppendUrl${m.posterPath}')
                      .toList();
                  final tenseDrama = state.tenseDramas
                      .map((m) => '$imageAppendUrl${m.posterPath}')
                      .toList();
                  final southMovies = state.southIndian
                      .map((m) => '$imageAppendUrl${m.posterPath}')
                      .toList();
                  releasedPastYear.shuffle();
                  trendingNow.shuffle();
                  tenseDrama.shuffle();
                  southMovies.shuffle();

                  return ListView(
                    children: [
                      // Ensure all lists have at least one item before accessing the first element
                      if (state.trendingNow.isNotEmpty)
                        BackgroundCard(
                            mainImage: state.trendingNow[0].posterPath),
                      kHeight,
                      MainTitleCard(
                        title: "Released in the Past Year",
                        posterList: releasedPastYear.length >= 10
                            ? releasedPastYear.sublist(0, 10)
                            : releasedPastYear,
                      ),
                      kHeight,
                      MainTitleCard(
                        title: "Trending Now",
                        posterList: trendingNow.length >= 10
                            ? trendingNow.sublist(0, 10)
                            : trendingNow,
                      ),
                      kHeight,
                      NumberTitleCard(
                        posterList: top10.length >= 10
                            ? top10.sublist(0, 10)
                            : top10,
                      ),
                      kHeight,
                      MainTitleCard(
                        title: "Tense Dramas",
                        posterList: tenseDrama.length >= 10
                            ? tenseDrama.sublist(0, 10)
                            : tenseDrama,
                      ),
                      kHeight,
                      MainTitleCard(
                        title: "South Indian Cinema",
                        posterList: southMovies.length >= 10
                            ? southMovies.sublist(0, 10)
                            : southMovies,
                      ),
                    ],
                  );
                },
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: double.infinity,
                height: scrollNotifier.value ? 100 : 0,
                color: kBlackColor.withOpacity(0.1),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/netflix.png',
                              width: 50,
                              height: 40,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.cast,
                              color: Colors.white,
                              size: 35,
                            ),
                            kWidth,
                            Container(
                              width: 30,
                              height: 30,
                              color: Colors.blue,
                            ),
                            kWidth,
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "TV Shows",
                            style: kHomeTitleText,
                          ),
                          Text(
                            "Movies",
                            style: kHomeTitleText,
                          ),
                          Text(
                            "Categories",
                            style: kHomeTitleText,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
