import 'package:flutter/material.dart';

class Calculategoldpricecard extends StatefulWidget {
  const Calculategoldpricecard({super.key});

  @override
  State<Calculategoldpricecard> createState() => _CalculategoldpricecardState();
}

class _CalculategoldpricecardState extends State<Calculategoldpricecard> {
  bool _isExpanded = false;
  String _selectedButton = "-1";
  bool isBuySelected = true;

  final _formKey = GlobalKey<FormState>();

  final List<TextEditingController> _controllers = List.generate(
    11,
    (index) => TextEditingController(),
  );

  final List<String> _labels = ["‌ရွှေပမာဏ", "ဝယ်ယူမည့်ငွေကြေး"];

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
        // 🔹 use Column so content can expand vertically
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ရွှေစျေးနှုန်းတွက်ရန်', style: TextStyle(fontSize: 14)),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF9c0003), // background
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    _isExpanded ? 'ပိတ်ပါ' : 'ဖွင့်ပါ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'NotoSerifMyanmar',
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Hidden content below the row
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Column(
                children: [
                  SizedBox(height: 10),

                  //buy / sell tab
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isBuySelected = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: isBuySelected
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
                              "Buy",
                              style: TextStyle(
                                color: isBuySelected
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
                              isBuySelected = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: isBuySelected
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
                              "Sell",
                              style: TextStyle(
                                color: isBuySelected
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

                  SizedBox(height: 20),

                  //ရွှေပမာဏ
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(_labels[0]),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _controllers[0],
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 13,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  Image.asset(
                    'assets/exchangePrice.png',
                    width: 30,
                    height: 30,
                  ),

                  SizedBox(height: 15),

                  //ဝယ်ယူမည့်ငွေကြေး
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(_labels[1]),
                      ),
                      SizedBox(height: 13),
                      TextField(
                        controller: _controllers[0],
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          hintText: 'MMK',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 13,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  //Two Btn
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedButton = "0";
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                          decoration: BoxDecoration(
                            color: _selectedButton == "0"
                                ? const Color(0xFF9c0003)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: const Color(0xFF9c0003),
                              width: 2,
                            ),
                          ),
                          child: Text(
                            'Clear',
                            style: TextStyle(
                              color: _selectedButton == "0"
                                  ? Colors.white
                                  : Colors.black,
                              fontFamily: 'NotoSerifMyanmar',
                              fontWeight: FontWeight.w800,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedButton = "1";
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                          decoration: BoxDecoration(
                            color: _selectedButton == "1"
                                ? const Color(0xFF9c0003)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: const Color(0xFF9c0003),
                              width: 2,
                            ),
                          ),
                          child: Text(
                            'ဝယ်ယူမည်',
                            style: TextStyle(
                              color: _selectedButton == "1"
                                  ? Colors.white
                                  : Colors.black,
                              fontFamily: 'NotoSerifMyanmar',
                              fontWeight: FontWeight.w800,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // if (_selectedButton == "0")
                  //   Padding(
                  //     padding: const EdgeInsets.only(top: 20),
                  //     child: Align(
                  //       alignment: Alignment.centerLeft,
                  //       child: Text(
                  //         'မှန်ကန်သော ငွေပမာဏထည့်ပါ',
                  //         style: TextStyle(fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
