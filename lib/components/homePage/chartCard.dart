import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gold_td/components/goldPriceChart.dart';
import 'package:gold_td/enumData/data.dart';

class Chartcard extends StatefulWidget {
  final int selectedgoldPriceDateIndex;

  const Chartcard({super.key, required this.selectedgoldPriceDateIndex});

  @override
  State<Chartcard> createState() => _ChartcardState();
}

class _ChartcardState extends State<Chartcard> {
  bool isExpanded = false;
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedgoldPriceDateIndex;
  }

  @override
  Widget build(BuildContext context) {
    // Example dynamic prices based on selected index
    List<double> prices = getGoldPricesForIndex(selectedIndex);

    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          bottom: BorderSide(color: Color(0xFF9c0003), width: 5),
          left: BorderSide.none,
          top: BorderSide.none,
          right: BorderSide.none,
        ),
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
          // Top row
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ယနေ့ အခေါက်ရွှေစျေးနှုန်း', style: TextStyle(fontSize: 14)),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ဝယ်စျေး  ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    '7,759,985 MMK',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Divider(),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ရောင်းစျေး',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    '7,609,000 MMK',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 20),

          // Clickable "အသေးစိတ်ကြည့်ရန်" text
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded; // toggle visibility
              });
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Text(
                'အသေးစိတ်ကြည့်ရန်',
                style: TextStyle(fontSize: 13, color: Color(0xFF9C0003)),
              ),
            ),
          ),

          // Hidden content
          if (isExpanded)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(goldPriceDate.length, (index) {
                    final isSelected = selectedIndex == index;

                    return ChoiceChip(
                      label: Text(
                        goldPriceDate[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Color(0xFF9C0003),
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                      selected: isSelected,
                      showCheckmark: false,
                      selectedColor: Color(0xFF9C0003),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Color(0xFF9C0003)),
                      ),
                      onSelected: (_) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    );
                  }),
                ),

                SizedBox(height: 20),

                // Chart with dynamic prices
                GoldPriceChart(price: prices),
              ],
            ),
        ],
      ),
    );
  }

  // Example function: returns dummy prices based on selected index
  List<double> getGoldPricesForIndex(int index) {
    // Replace with your real data logic
    List<List<double>> allPrices = [
      [7750000, 7765000, 7745000, 7765000, 7770000, 7775000, 7760000],
      [7745000, 7755000, 7750000, 7755000, 7760000, 7765000, 7755000],
      // add more data sets if needed
    ];

    return allPrices[index % allPrices.length];
  }
}
