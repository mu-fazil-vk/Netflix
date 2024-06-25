import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          title: 'Top Searches',
        ),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CupertinoActivityIndicator(
                    color: kWhiteColor,
                  ),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text('Error while getting data!'),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text('List is empty!'),
                );
              }
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final movie = state.idleList[index];
                    return TopSearchItemTile(
                      title: movie.title ?? 'No title provided',
                      imageUrl: '$imageAppendUrl${movie.backdropPath}',
                    );
                  },
                  separatorBuilder: (context, index) => kHeight20,
                  itemCount: state.idleList.length);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTile(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 65,
          width: screenWidth * 0.35,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        kWidth,
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
              color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.bold),
        )),
        kWidth,
        const Icon(
          CupertinoIcons.play_circle,
          color: kWhiteColor,
          size: 50,
        )
      ],
    );
  }
}
