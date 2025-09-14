import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GoldPriceChart extends StatefulWidget {
  final dynamic price;
  final dynamic labels;

  const GoldPriceChart({super.key, required this.price, required this.labels});

  @override
  State<GoldPriceChart> createState() => _GoldPriceChartState();
}

class _GoldPriceChartState extends State<GoldPriceChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: (widget.labels.length - 1).toDouble(),
          minY: 7745000,
          maxY: 7775000,
          titlesData: FlTitlesData(
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false), // Remove top titles
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false), // Remove right titles
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  int index = value.toInt();
                  if (index >= 0 && index < widget.labels.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        widget.labels[index],
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            drawVerticalLine: true,
            horizontalInterval: 5000, // adjust as needed
            verticalInterval: 1,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.3),
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.3),
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                widget.price.length,
                (index) => FlSpot(index.toDouble(), widget.price[index]),
              ),
              isCurved: true,
              color: Color(0xFF9c0003),
              barWidth: 2,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                color: Colors.red.withOpacity(0.1),
              ),
            ),
          ],

          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (spots) => Colors.black87,
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((lineBarSpot) {
                  return LineTooltipItem(
                    '',
                    const TextStyle(),
                    children: [
                      TextSpan(
                        text: '${lineBarSpot.y.toStringAsFixed(0)} MMK',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                }).toList();
              },
            ),
          ),
        ),
      ),
    );
  }
}
