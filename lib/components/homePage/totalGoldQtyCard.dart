import 'package:flutter/material.dart';

class Totalgoldqtycard extends StatefulWidget {
  const Totalgoldqtycard({
    super.key,
    required this.totalGoldKyat,
    required this.totalGoldPae,
    required this.totalGoldYway,
    required this.totalMoney,
  });

  final double totalGoldKyat;
  final double totalGoldPae;
  final double totalGoldYway;
  final double totalMoney;

  @override
  State<Totalgoldqtycard> createState() => _TotalgoldqtycardState();
}

class _TotalgoldqtycardState extends State<Totalgoldqtycard> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
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
          //Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('မင်္ဂလာ မနက်ခင်းပါ', style: TextStyle(fontSize: 14)),
                  SizedBox(height: 10),
                  Text(
                    'Account Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),

              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isVisible = !_isVisible; // toggle visibility
                      });
                    },
                    child: Icon(Icons.remove_red_eye, size: 20),
                  ),
                  SizedBox(width: 15),
                  Image.asset('assets/noti.png', width: 22),
                  SizedBox(width: 15),
                  Image.asset('assets/setting.png', width: 22),
                ],
              ),
            ],
          ),

          SizedBox(height: 30),

          //ရွှေစာရင်းလက်ကျန်
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ရွှေစာရင်းလက်ကျန်', style: TextStyle(fontSize: 14)),
              SizedBox(height: 10),
              // Text(
              //   _isVisible
              //       ? widget.formattedText
              //       : '... ကျပ် , ... ပဲ , ... ရွေး',
              //   style: TextStyle(fontSize: 14),
              // ),
              _isVisible
                  ? RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: widget.totalGoldKyat.toStringAsFixed(0),
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WidgetSpan(child: SizedBox(width: 8)),
                          TextSpan(
                            text: "ကျပ်",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          WidgetSpan(child: SizedBox(width: 8)), // space
                          TextSpan(
                            text: widget.totalGoldPae.toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WidgetSpan(child: SizedBox(width: 8)),
                          TextSpan(
                            text: "ပဲ",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          WidgetSpan(child: SizedBox(width: 8)),
                          TextSpan(
                            text: widget.totalGoldYway.toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WidgetSpan(child: SizedBox(width: 8)),
                          TextSpan(
                            text: "ရွေး",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  : RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "...",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          WidgetSpan(child: SizedBox(width: 8)),
                          TextSpan(
                            text: "ကျပ်",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          WidgetSpan(child: SizedBox(width: 8)), // space
                          TextSpan(
                            text: "...",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          WidgetSpan(child: SizedBox(width: 8)),
                          TextSpan(
                            text: "ပဲ",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          WidgetSpan(child: SizedBox(width: 8)),
                          TextSpan(
                            text: "...",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          WidgetSpan(child: SizedBox(width: 8)),
                          TextSpan(
                            text: "ရွေး",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
            ],
          ),

          SizedBox(height: 30),

          //ငွေစာရင်းလက်ကျန်
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ငွေစာရင်း', style: TextStyle(fontSize: 14)),
              SizedBox(height: 10),
              Row(
                children: [
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: _isVisible
                                  ? widget.totalMoney.toStringAsFixed(2)
                                  : '...',
                              style: TextStyle(
                                fontSize: 17, // big
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: ' MMK',
                              style: TextStyle(
                                fontSize: 15, // normal size
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    _isVisible ? '( + 1232220.231 MMK )' : '... MMK',
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ],
          ),

          SizedBox(height: 30),

          //ပွိုင့်
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Member', style: TextStyle(fontSize: 14)),
                  SizedBox(height: 10),
                  Text(
                    _isVisible ? '100000 ပွိုင့်' : '... ပွိုင့်',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),

              Row(
                children: [
                  Text('ကြည့်ရန်', style: TextStyle(fontSize: 12)),
                  SizedBox(width: 7),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.arrow_forward_ios_outlined, size: 13),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
