import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/data_table/table_action_buttons.dart';
import '../../../../../../common/widgets/images/ab_rounded_image.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/enums.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/product_model.dart';

class ProductsRows extends DataTableSource{
  @override
  DataRow? getRow(int index) {
   return DataRow2(cells: [
        DataCell(
          Row(
            children: [
              const AbRoundedImage(
                width: 50,
                height: 50,
                padding: AbSizes.xs,
                image: AbImages.user,
                imageType: ImageType.asset,
                borderRadius: AbSizes.borderRadiusMd,
                backgroundColor: AbColors.primaryBackground,
              ),
              const SizedBox(width: AbSizes.spaceBtwItems),
              Flexible(
                child: Text(
                  'Product Title', 
                   style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(color: AbColors.primary),
                   overflow: TextOverflow.ellipsis
                )
              )
            ],
          )
        ),
        const DataCell(Text('256')),
        DataCell(
          Row(
            children: [
              const AbRoundedImage(
                width: 35,
                height:35,
                padding: AbSizes.xs,
                image: AbImages.user,
                imageType: ImageType.asset,
                borderRadius: AbSizes.borderRadiusMd,
                backgroundColor: AbColors.primaryBackground,
              ),
              const SizedBox(width: AbSizes.spaceBtwItems),
              Flexible(
                child: Text(
                  'Nike', 
                   style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(color: AbColors.primary),
                   overflow: TextOverflow.ellipsis
                )
              )
            ],
          )
        ),
        const DataCell(Text('\$99.9')),
        DataCell(Text(DateTime.now().toString())),
        DataCell(AbTableActionButtons(
          onEditPressed: () => Get.toNamed(AbRoutes.editProduct, arguments: ProductModel.empty()),
          onDeletePressed: (){}
        ))
      ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 100;

  @override
  int get selectedRowCount => 0;
}