import 'dart:ffi';

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

  double todayBuyGoldPrice = 7759985;
  double todaySellGoldPrice = 7700000;

  double totalGoldKyat = 0.00;
  double totalGoldPae = 0.00;
  double totalGoldYway = 0.00;

  double totalMoney = 0.00;
  double totalYway = 0.00;

  void updateGold({double? inputYway, int? fromWhere}) {
    if (inputYway == null) return;

    if (fromWhere == 0) {
      totalYway += inputYway;
    } else {
      totalYway -= inputYway;
    }

    // Convert step by step
    int kyat = totalYway ~/ 128;
    double remainderAfterKyat = totalYway - kyat * 128;

    int pae = remainderAfterKyat ~/ 8;
    double yway = remainderAfterKyat - pae * 8;

    setState(() {
      totalGoldKyat = kyat.toDouble();
      totalGoldPae = pae.toDouble();
      totalGoldYway = yway;
    });
  }

  void updateMoney() {
    double totaGold =
        totalGoldKyat + (totalGoldPae / 16) + (totalGoldYway / 128);

    setState(() {
      totalMoney = totaGold * todaySellGoldPrice;
    });
  }

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
                Totalgoldqtycard(
                  totalGoldKyat: totalGoldKyat,
                  totalGoldPae: totalGoldPae,
                  totalGoldYway: totalGoldYway,
                  totalMoney: totalMoney,
                ),

                //ယနေ့ အခေါက်ရွှေစျေးနှုန်း
                Chartcard(
                  selectedgoldPriceDateIndex: _selectedgoldPriceDateIndex,
                  todayBuyGoldPrice: todayBuyGoldPrice,
                  todaySellGoldPrice: todaySellGoldPrice,
                ),

                //ရွှေစျေးနှုန်တွက်ရန်
                Calculategoldpricecard(
                  todayBuyGoldPrice: todayBuyGoldPrice,
                  todaySellGoldPrice: todaySellGoldPrice,
                  onUpdateGold: updateGold,
                  onUpdateMoney: updateMoney,
                ),

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
