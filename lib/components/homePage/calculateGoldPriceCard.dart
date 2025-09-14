import 'package:flutter/material.dart';
import 'package:gold_td/components/calculatePricePopUp.dart';
import 'package:gold_td/components/sellBuyPopUp.dart';
// ignore: depend_on_referenced_packages

class Calculategoldpricecard extends StatefulWidget {
  const Calculategoldpricecard({
    super.key,
    required this.todayBuyGoldPrice,
    required this.todaySellGoldPrice,
    required this.onUpdateGold,
    required this.onUpdateMoney,
  });

  final double todayBuyGoldPrice;
  final double todaySellGoldPrice;
  final void Function({double? inputYway, int? fromWhere}) onUpdateGold;
  final void Function() onUpdateMoney;

  @override
  State<Calculategoldpricecard> createState() => _CalculategoldpricecardState();
}

class _CalculategoldpricecardState extends State<Calculategoldpricecard> {
  String isBuySelected = "-1";

  final double mmkPrice = 12312312;
  final double goldRate = 2030901;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(bottom: BorderSide(color: Color(0xFF9c0003), width: 5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ရွှေစျေးနှုန်းတွက်ရန်', style: TextStyle(fontSize: 14)),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              children: [
                SizedBox(height: 20),

                //buy / sell tab
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isBuySelected = "0";
                          });
                          CalculatePricePopUp(
                            context,
                            isBuySelected,
                            totalPrice: widget.todayBuyGoldPrice,
                            onUpdateGold: widget.onUpdateGold,
                            onUpdateMoney: widget.onUpdateMoney,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: isBuySelected == "0"
                                ? Color(0xFF9c0003)
                                : Colors.white,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(8),
                            ),
                            border: Border.all(
                              color: Color(0xFF9c0003),
                              width: 2,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "ဝယ်မည်",
                            style: TextStyle(
                              color: isBuySelected == "0"
                                  ? Colors.white
                                  : Color(0xFF9c0003),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isBuySelected = "1";
                          });
                          CalculatePricePopUp(
                            context,
                            isBuySelected,
                            totalPrice: widget.todaySellGoldPrice,
                            onUpdateGold: widget.onUpdateGold,
                            onUpdateMoney: widget.onUpdateMoney,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: isBuySelected == "0"
                                ? Colors.white
                                : Color(0xFF9c0003),
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(8),
                            ),
                            border: Border.all(
                              color: Color(0xFF9c0003),
                              width: 2,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "ရောင်းမည်",
                            style: TextStyle(
                              color: isBuySelected == "0"
                                  ? Color(0xFF9c0003)
                                  : Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
