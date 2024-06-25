import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/domain/core/di/injectable.dart';
import 'package:netflix/presentation/main_page/screen_main_page.dart';

import 'application/new_and_hot/new_and_hot_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => getIt<
              DownloadsBloc>(), //we can pass DownloadsBloc without passing arguments bcz of injection
        ),
        BlocProvider(
          create: (ctx) => getIt<
              SearchBloc>(), //we can pass DownloadsBloc without passing arguments bcz of injection
        ),
        BlocProvider(
          create: (ctx) => getIt<
              FastLaughBloc>(), //we can pass DownloadsBloc without passing arguments bcz of injection
        ),
        BlocProvider(
          create: (ctx) => getIt<
              NewAndHotBloc>(), //we can pass DownloadsBloc without passing arguments bcz of injection
        ),
        BlocProvider(
          create: (ctx) => getIt<
              HomeBloc>(), //we can pass DownloadsBloc without passing arguments bcz of injection
        ),
      ],
      child: MaterialApp(
        title: 'Netflix',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              foregroundColor: kWhiteColor),
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.white, background: backgroundColor),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.white),
          ),
          useMaterial3: true,
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}
