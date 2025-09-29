import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/dashboard/dashboard_controller..dart';

class AbWeeklySales extends StatelessWidget {
  const AbWeeklySales({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return AbRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Weekly Sales', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: AbSizes.spaceBtwSections),
          /// Graph
          SizedBox(
            height: 400,
            child: BarChart(
              BarChartData(
                titlesData: buildFlTuitlesDate(),
                borderData: FlBorderData(show: true, border: const Border(top: BorderSide.none, right: BorderSide.none)),
                gridData: const FlGridData(
                  show: true,
                  drawHorizontalLine: false,
                  drawVerticalLine: false,
                  horizontalInterval: 200
                ),
                barGroups: controller.weeklySales.asMap().entries.map((entry) => BarChartGroupData(x: entry.key, barRods: [BarChartRodData(toY: entry.value, color: AbColors.primary,borderRadius: BorderRadius.circular(AbSizes.sm))])).toList()
              )
            ),
          )
        ],
      ),
    );
  }

  FlTitlesData buildFlTuitlesDate(){
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta){
            final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
            final index = value.toInt() % days.length;
            final day = days[index];

            return SideTitleWidget(meta: meta, space: 0, child: Text(day));
          }
        )
      ),
      leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: true, interval: 200, reservedSize: 50)),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false))
    );
  }
}