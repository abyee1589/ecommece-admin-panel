
import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/features/authentication/controllers/dashboard/dashboard_controller..dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ab_ecommerce_admin_panel/utils/helpers/helper_functions.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderRows extends DataTableSource{
  @override
  DataRow? getRow(int index) {
    final order = DashboardController.orders[index];
    return DataRow2(
      cells: [
        DataCell(
          Text(
            order.id, 
            style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(color: AbColors.primary)
          )
        ),
        DataCell(
          Text(order.formattedOrderDate)
        ),
        const DataCell(Text('5 Items')),
        DataCell(
          AbRoundedContainer(
            radius: AbSizes.cardRadiusSm,
            padding: const EdgeInsets.symmetric(vertical: AbSizes.sm, horizontal: AbSizes.md),
            backgroundColor: AbHelperFunctions.getOrderColorStatus(order.status).withOpacity(0.1),
            child: Text(
              order.status.name.capitalize.toString(),
              style: TextStyle(color: AbHelperFunctions.getOrderColorStatus(order.status)),
            ),
          )
        ),
        DataCell(Text('\$${order.totalAmount}'))
      ]
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => DashboardController.orders.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

}