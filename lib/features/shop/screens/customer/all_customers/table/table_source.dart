import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/data_table/table_action_buttons.dart';
import 'package:ab_ecommerce_admin_panel/routes/routes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../authentication/models/user_model.dart';

class CustomerRows extends DataTableSource {
  
  @override
  DataRow? getRow(int index) {
    return DataRow2(
      cells: [
        DataCell(
         Row(
          children: [
            const AbRoundedContainer(
              width: 50,
              height: 50,
              padding: EdgeInsets.all(AbSizes.sm),
              image: AbImages.user,
              imageType: ImageType.network,
              borderRadius: AbSizes.borderRadiusMd,
              backgroundColor: AbColors.primaryBackground,
            ),
            const SizedBox(width: AbSizes.spaceBtwItems),

            Expanded(
              child: Text('Coding with Ab', style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(color: AbColors.primary),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
            )
          ],
         )
        ),
        const DataCell(Text('abdibekele2021@gmail.com')),
        const DataCell(Text('+251915948189')),
        DataCell(Text(DateTime.now().toString())),
        DataCell(
          AbTableActionButtons(
            view: true,
            edit: false,
            onViwPressed: () => Get.toNamed(AbRoutes.customerDetails, arguments: UserModel.empty()),
            onDeletePressed: () {},
          )
        )
      ]
    );
  }
  
  @override
  bool get isRowCountApproximate => false;
  
  @override
  int get rowCount => 10;
  
  @override
  int get selectedRowCount => 0;
}