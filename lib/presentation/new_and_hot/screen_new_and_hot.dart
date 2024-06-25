import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/new_and_hot/new_and_hot_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

import '../../domain/downloads/models/downloads.dart';
import '../../domain/new_and_hot/model/coming_soon_resp/coming_soon_resp.dart';
import 'widgets/coming_soon_widget.dart';
import 'widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NewAndHotBloc>(context).add(const LoadDataInComingSoon());
      BlocProvider.of<NewAndHotBloc>(context)
          .add(const LoadDataInPopularMovies());
    });
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const AppBarWidget(title: "New & Hot"),
              bottom: TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  labelColor: kBlackColor,
                  dividerHeight: 0,
                  indicatorWeight: 1.0,
                  labelPadding: const EdgeInsets.all(0),
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  unselectedLabelColor: kWhiteColor,
                  indicator: BoxDecoration(
                      color: kWhiteColor, borderRadius: kRadius30),
                  tabs: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Tab(
                        text: "🍿 Coming Soon",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Tab(
                        text: "👀 Everyone's Watching",
                      ),
                    )
                  ]),
            )),
        body: const TabBarView(children: [
          //for no data duplication, etc in widget reuse
          ComingSoonList(
            key: Key("coming_soon"),
          ),
          EveryOnesWatchingList(
            key: Key('everyones_watching'),
          ),
        ]),
      ),
    );
  }
}

//coming soon
class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => BlocProvider.of<NewAndHotBloc>(context)
          .add(const LoadDataInComingSoon()),
      child: BlocBuilder<NewAndHotBloc, NewAndHotState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: kWhiteColor,
              ),
            );
          } else if (state.isError) {
            return const Center(
              child: Text("Error while loading coming soon list"),
            );
          } else if (state.comingSoonMovieList.isEmpty) {
            return const Center(
              child: Text("Coming soon list is empty"),
            );
          } else {
            return ListView.separated(
                padding: const EdgeInsets.only(top: 10),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final ComingSoonResult movie =
                      state.comingSoonMovieList[index];
                  String day = '';
                  String month = '';
                  String dayName = '';

                  try {
                    final _date = DateTime.parse(movie.releaseDate!);
                    final formatedDate =
                        DateFormat.MMMMEEEEd('en-US').format(_date);
                    day = formatedDate.split(' ').last;
                    month = formatedDate
                        .split(' ')
                        .elementAt(1)
                        .substring(0, 3)
                        .toUpperCase();
                    dayName = formatedDate.split(',').first;
                  } catch (e) {
                    day = '';
                    month = '';
                    dayName = '';
                  }

                  if (movie.id == null) {
                    return const SizedBox();
                  }
                  return ComingSoonWidget(
                      id: movie.id ?? 0,
                      day: day,
                      month: month,
                      dayName: dayName,
                      movieName: movie.title ?? "No title",
                      movieImage: '$imageAppendUrl${movie.backdropPath}',
                      description: movie.overview ?? "No description");
                },
                separatorBuilder: (context, index) => kHeight,
                itemCount: state.comingSoonMovieList.length);
          }
        },
      ),
    );
  }
}

//everyones watching
class EveryOnesWatchingList extends StatelessWidget {
  const EveryOnesWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewAndHotBloc, NewAndHotState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CupertinoActivityIndicator(
              color: kWhiteColor,
            ),
          );
        } else if (state.isError) {
          return const Center(
            child: Text("Error while loading movie list"),
          );
        } else if (state.comingSoonMovieList.isEmpty) {
          return const Center(
            child: Text("Movie list is empty"),
          );
        } else {
          return ListView.separated(
              padding: const EdgeInsets.only(top: 10),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final Downloads movie = state.popularMoviesList[index];

                if (movie.backdropPath == null) {
                  return const SizedBox();
                }
                return EveryonesWatchingWidget(
                    movieName: movie.title ?? "No title",
                    description: movie.overview ?? "No description",
                    movieImage: '$imageAppendUrl${movie.backdropPath}');
              },
              separatorBuilder: (context, index) => kHeight,
              itemCount: state.comingSoonMovieList.length);
        }
      },
    );
  }
}
