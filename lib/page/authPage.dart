import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gold_td/components/signUpPage/LoginPopUpCard.dart';
import 'package:gold_td/enumData/data.dart';
import 'package:file_picker/file_picker.dart';

class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    DateTime? lastBackPressed;

    // Responsive card size
    double cardWidth = MediaQuery.of(context).size.width * 0.9;
    double cardHeight = MediaQuery.of(context).size.height * 0.25;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    void showExitDialog() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Exit App'),
          content: const Text('Are you sure you want to exit the app?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Cancel
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop(); // ✅ Close app
              },
              child: const Text('Exit'),
            ),
          ],
        ),
      );
    }

    Future<void> handleBackButton() async {
      final now = DateTime.now();
      if (lastBackPressed == null ||
          now.difference(lastBackPressed!) > const Duration(seconds: 2)) {
        lastBackPressed = now;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Press back again to exit'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        showExitDialog();
      }
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          handleBackButton();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF9C0003),
            toolbarHeight: 100,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    "မြန်မာတို့ဧ။်",
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFFE3B900),
                      fontFamily: 'NotoSerifMyanmar',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Text(
                  "ရွှေကုန်သည်",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFFE3b900),
                    fontFamily: 'NotoSerifMyanmar',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, top: 20),
                  child: Text(
                    "အပလီကေးရှင်း",
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFFE3b900),
                      fontFamily: 'NotoSerifMyanmar',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.menu, color: Color(0xFFE3b900)),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Expandable animated menu
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: _isExpanded ? 220 : 0,
                child: SingleChildScrollView(
                  child: Container(
                    color: const Color(0xFF9C0003), // background color
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildMenuItem("အကောင့်ဝင်ရန်", () {}),
                        _buildMenuItem("သူငယ်ချင်းရှာရန်", () {}),
                        _buildMenuItem("ဆက်သွယ်ရန်", () {}),
                        _buildMenuItem("မေးခွန်းကြည့်ရန်", () {}),
                      ],
                    ),
                  ),
                ),
              ),

              // Main content with wallpaper and glass card
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background image
                    Image.asset("assets/homeBg.jpg", fit: BoxFit.cover),

                    // Centered glass card
                    Center(
                      child: Container(
                        width: cardWidth,
                        height: cardHeight,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1), // glass effect
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 6),
                            ),
                          ],
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize
                                      .min, // ✅ only take content height
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(
                                          context,
                                          '/',
                                        );
                                      },
                                      child: Text(
                                        '" ရွှေသည် အနာဂတ်အတွက် အကောင်းဆုံးရင်းနှီးမြှုပ်နှံမှုဖြစ်သည် "',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            255,
                                            248,
                                            214,
                                          ),
                                          fontSize: 18,
                                          fontFamily: 'NotoSerifMyanmar',
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(height: 30),

                                    // Button
                                    InkWell(
                                      borderRadius: BorderRadius.circular(12),
                                      onTap: () {
                                        LoginPopUpCard(context); // pas္
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 40,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xFF9c0003),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 5,
                                          ),
                                          child: const Text(
                                            "အကောင့်ဝင်ရန်",
                                            style: TextStyle(
                                              color: Color(0xFFe3b900),
                                              fontFamily: 'NotoSerifMyanmar',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Footer at the bottom
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02, // 2% of screen height
                    horizontal: screenWidth * 0.04, // 4% of screen width
                  ),
                  color: Color(0xFF9c0003),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "© 2025 GoldTrade Inc.",
                        style: TextStyle(
                          color: Color(0xFFE3b900),
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              debugPrint("Viber icon pressed!");
                            },
                            icon: Image.asset(
                              "assets/viber.png",
                              width: 23,
                              height: 23,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.telegram),
                            color: Color(0xFFE3b900),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.facebook),
                            color: Color(0xFFE3b900),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.wechat),
                            color: Color(0xFFE3b900),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: const Color(0xFFE3B900),
          fontFamily: 'NotoSerifMyanmar',
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),

      onTap: () {
        onTap;
      },
    );
  }
}
