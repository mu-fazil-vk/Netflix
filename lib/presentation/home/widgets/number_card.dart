import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.imageUrl});

  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
            ),
            Container(
              width: 140,
              //height: 250,
              decoration: BoxDecoration(
                  borderRadius: kRadius10,
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover)),
            ),
          ],
        ),
        Positioned(
          left: 13,
          bottom: -30,
          child: BorderedText(
            strokeWidth: 3,
            strokeColor: kWhiteColor,
            child: Text('${index + 1}',
                style: GoogleFonts.karla(
                  textStyle: const TextStyle(
                      fontSize: 120,
                      fontWeight: FontWeight.bold,
                      color: kBlackColor,
                      decoration: TextDecoration.none,
                      decorationColor: kWhiteColor),
                )),
          ),
        ),
      ],
    );
  }
}
