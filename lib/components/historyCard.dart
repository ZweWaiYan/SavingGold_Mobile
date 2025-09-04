import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final bool isBuy;

  const HistoryCard({super.key, required this.isBuy});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
      decoration: BoxDecoration(
        color: isBuy
            ? const Color.fromARGB(255, 139, 233, 142)
            : const Color.fromARGB(255, 255, 135, 126),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: isBuy
                          ? const Color.fromARGB(255, 0, 255, 8)
                          : const Color.fromARGB(255, 255, 17, 0),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: isBuy
                              ? Colors.green.withOpacity(0.5)
                              : const Color.fromARGB(255, 252, 77, 65),
                          blurRadius: 6,
                          spreadRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text(
                      isBuy ? 'ဝယ်ယူ' : 'ရောင်းချ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                '1.2500 ရွှေး',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '9,700,000 MMK',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '15-Aug-2025',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
