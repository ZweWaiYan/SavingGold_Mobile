import 'package:flutter/material.dart';
import 'package:gold_td/components/historyCard.dart';

class Historylistcard extends StatefulWidget {
  const Historylistcard({super.key});

  @override
  State<Historylistcard> createState() => _HistorylistcardState();
}

class _HistorylistcardState extends State<Historylistcard> {
  bool _isExpanded = false;

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
              Text('မှတ်တမ်း', style: TextStyle(fontSize: 14)),
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
                    'အားလုံးကြည့်ရန်',
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
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: List.generate(
                  5,
                  (index) => HistoryCard(isBuy: index % 2 == 0),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
