
import 'package:ab_ecommerce_admin_panel/common/widgets/images/ab_rounded_image.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/controllers/dashboard/dashboard_controller..dart';
import 'package:ab_ecommerce_admin_panel/routes/routes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'table_action_buttons.dart';

class CategoryRows extends DataTableSource{
  @override
  DataRow? getRow(int index) {
    return DataRow2(
      cells: [
        DataCell(
          Row(
            children: [
              const AbRoundedImage(
                width: 50,
                height: 50,
                padding: AbSizes.sm,
                image: AbImages.user,
                imageType: ImageType.asset,
                borderRadius: AbSizes.borderRadiusMd,
                backgroundColor: AbColors.primaryBackground,
              ),
              const SizedBox(width: AbSizes.spaceBtwItems),
              Expanded(
                child: Text(
                  'Name', style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(color: AbColors.primary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              )
            ],)
        ),
        const DataCell(
          Text('Parent')
        ),
        const DataCell(Icon(Iconsax.heart5, color: AbColors.primary)),
        DataCell(
          Text(DateTime.now().toString())
        ),
        DataCell(AbTableActionButtons(
          onEditPressed: () => Get.toNamed(AbRoutes.editCategory, arguments: 'category'),
          onDeletePressed: (){}
        ))
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