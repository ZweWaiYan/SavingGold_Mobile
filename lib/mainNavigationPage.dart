import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:gold_td/page/homePage.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  final NotchBottomBarController _controller = NotchBottomBarController(
    index: 0,
  );

  int _currentIndex = 0;

  // All your pages here
  final List<Widget> _pages = const [
    HomePage(),
    Center(child: Text("ပိုင်ဆိုင်မှူ")),
    Center(child: Text("စာရင်း")),
    Center(child: Text("လက်ဆောင်")),
    Center(child: Text("ပရိုဖိုင်")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_currentIndex],
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        kIconSize: 24.0,
        kBottomRadius: 28.0,
        notchColor: Color(0xFF9c0003),
        itemLabelStyle: TextStyle(color: Colors.black, fontSize: 10.0),
        showBlurBottomBar: true,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: const Icon(Icons.home, color: Colors.black),
            activeItem: const Icon(Icons.home, color: Colors.white),
            itemLabel: 'မူလ',
          ),
          BottomBarItem(
            inActiveItem: const Icon(
              Icons.account_balance_wallet,
              color: Colors.black,
            ),
            activeItem: const Icon(
              Icons.account_balance_wallet,
              color: Colors.white,
            ),
            itemLabel: 'ပိုင်ဆိုင်မှူ',
          ),
          BottomBarItem(
            inActiveItem: const Icon(
              Icons.list_alt_outlined,
              color: Colors.black,
            ),
            activeItem: const Icon(
              Icons.list_alt_outlined,
              color: Colors.white,
            ),
            itemLabel: 'စာရင်း',
          ),
          BottomBarItem(
            inActiveItem: const Icon(Icons.card_giftcard, color: Colors.black),
            activeItem: const Icon(Icons.card_giftcard, color: Colors.white),
            itemLabel: 'လက်ဆောင်',
          ),
          BottomBarItem(
            inActiveItem: const Icon(Icons.person, color: Colors.black),
            activeItem: const Icon(Icons.person, color: Colors.white),
            itemLabel: 'ပရိုဖိုင်',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
