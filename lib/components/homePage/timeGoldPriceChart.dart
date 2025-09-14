import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Timegoldpricechart extends StatefulWidget {
  const Timegoldpricechart({super.key, required this.price});
  final dynamic price;

  @override
  State<Timegoldpricechart> createState() => _TimegoldpricechartState();
}

class _TimegoldpricechartState extends State<Timegoldpricechart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 80,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toStringAsFixed(0),
                    style: const TextStyle(fontSize: 12),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 9:
                      return const Text(
                        "09:00",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      );
                    case 11:
                      return const Text(
                        "11:00",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      );
                    case 13:
                      return const Text(
                        "13:00",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      );
                    case 15:
                      return const Text(
                        "15:00",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      );
                    case 17:
                      return const Text(
                        "17:00",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          minX: 9,
          maxX: 17,
          minY: 7740000,
          maxY: 7760000,
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              spots: const [
                FlSpot(9, 7740000),
                FlSpot(11, 7750000),
                FlSpot(13, 7753000),
                FlSpot(15, 7759000),
                FlSpot(17, 7759000),
              ],
              barWidth: 3,
              color: Colors.green,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                color: Colors.green.withOpacity(0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
