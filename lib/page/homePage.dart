import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gold_td/components/goldPriceChart.dart';
import 'package:gold_td/components/homePage/calculateGoldPriceCard.dart';
import 'package:gold_td/components/homePage/chartCard.dart';
import 'package:gold_td/components/homePage/historyListCard.dart';
import 'package:gold_td/components/homePage/totalGoldQtyCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedgoldPriceDateIndex = 0;

  @override
  Widget build(BuildContext context) {
    DateTime? lastBackPressed;

    void showExitDialog() {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Exit App'),
          content: const Text('Do you really want to exit?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => SystemNavigator.pop(),
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

    Future<bool> onWillPop() async {
      await handleBackButton();
      // Returning false prevents automatic pop
      return false;
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Color(0xFFE0DCDC),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Main Card
                Totalgoldqtycard(),

                //ယနေ့ အခေါက်ရွှေစျေးနှုန်း
                Chartcard(
                  selectedgoldPriceDateIndex: _selectedgoldPriceDateIndex,
                ),

                //ရွှေစျေးနှုန်တွက်ရန်
                Calculategoldpricecard(),

                //မှတ်တမ်း
                Historylistcard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
