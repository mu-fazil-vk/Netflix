import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int newIndex, _) => BottomNavigationBar(
              currentIndex: newIndex,
              onTap: (index) => indexChangeNotifier.value = index,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedIconTheme:
                  const CupertinoIconThemeData(color: Colors.white),
              unselectedIconTheme:
                  const CupertinoIconThemeData(color: Colors.grey),
              selectedLabelStyle: const TextStyle(color: Colors.white),
              unselectedLabelStyle: const TextStyle(color: Colors.grey),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.video_label), label: 'New & Hot'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_emotions), label: 'Fast Laughs'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.arrow_down_circle),
                    label: 'Downloads'),
              ],
            ));
  }
}
