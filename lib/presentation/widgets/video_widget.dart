import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  final String movieImage;
  const VideoWidget({
    super.key,
    required this.movieImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            height: 200,
            child: Image.network(
              movieImage,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null
                      ? child
                      : const Center(
                          child: CupertinoActivityIndicator(
                            color: kWhiteColor,
                          ),
                        ),
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Icon(
                  CupertinoIcons.wifi_slash,
                  color: kGreyColor,
                ),
              ),
            )),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: kBlackColor.withOpacity(0.5),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.volume_off,
                  color: kWhiteColor,
                  size: 20,
                )),
          ),
        ),
      ],
    );
  }
}
