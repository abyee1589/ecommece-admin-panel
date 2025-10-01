import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ab_ecommerce_admin_panel/utils/helpers/helper_functions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/dashboard/dashboard_controller..dart';

class OrderStatusPieChart extends StatelessWidget {
  const OrderStatusPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DashboardController.instance;
    return AbRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Status', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: AbSizes.spaceBtwSections),

          /// Graph
          SizedBox(
            height: 400,
            child: PieChart(
              PieChartData(
                sections: controller.orderStatusData.entries.map((entry){
                  final status = entry.key;
                  final count = entry.value;
                  return PieChartSectionData(
                    radius: 100,
                    color: AbHelperFunctions.getOrderColorStatus(status),
                    title: count.toString(),
                    value: count.toDouble(),
                    titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  );
                }).toList(),
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse){
                    /// Handle touch events if needed
                  },
                  enabled: true
                ),
              )
            ),
          ),

          /// Show status and color meta
          DataTable(
            columns: const [
              DataColumn(label: Text('Status')),
              DataColumn(label: Text('Orders')),
              DataColumn(label: Text('Total')),
            ], 
            rows: controller.orderStatusData.entries.map((entry){
              final OrderStatus status = entry.key;
              final int count = entry.value;
              final totalAmount = controller.totalAmount[status] ?? 0;
              return DataRow(cells: [DataCell(
                Row(
                  children: [
                    AbCircularContainer(width: 20, height: 20, backgroundColor: AbHelperFunctions.getOrderColorStatus(status) ?? Colors.transparent),
                    Expanded(child: Text(controller.getDisplayStatusName(status))),
                  ],
                )
                ),
                DataCell(Text(count.toString())),
                DataCell(Text('\$${totalAmount.toStringAsFixed(2)}')),
                ]);
            }).toList())
        ]
      )
    );
    
  }
}