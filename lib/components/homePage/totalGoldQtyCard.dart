import 'package:flutter/material.dart';

class Totalgoldqtycard extends StatefulWidget {
  const Totalgoldqtycard({super.key});

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
              Text(
                _isVisible
                    ? '1,250,000 ကျပ် , 0.500 ပဲ , 1.250 ရွှေး' // actual numbers
                    : '... ကျပ် , ... ပဲ , ... ရွှေး', // hidden
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),

          SizedBox(height: 30),

          //ငွေစာရင်းလက်ကျန်
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ငွေစာရင်းလက်ကျန်', style: TextStyle(fontSize: 14)),
              SizedBox(height: 10),
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        _isVisible ? '1,250,000 MMK' : '... MMK',
                        style: TextStyle(fontSize: 14),
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
