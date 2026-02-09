import 'package:ab_ecommerce_admin_panel/features/shop/models/banner_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/data_table/table_action_buttons.dart';
import '../../../../../../common/widgets/images/ab_rounded_image.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/enums.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';

class BannersRows extends DataTableSource{
  @override
  DataRow? getRow(int index) {
   return DataRow2(cells: [
        const DataCell(
          Row(
            children: [
              AbRoundedImage(
                width: 180,
                height: 180,
                padding: AbSizes.sm,
                image: AbImages.user,
                imageType: ImageType.asset,
                borderRadius: AbSizes.borderRadiusMd,
                backgroundColor: AbColors.primaryBackground,
              ),
            ],)
        ),
        const DataCell(Text('Shop')),
        const DataCell(Icon(Iconsax.eye, color: AbColors.primary)),
        DataCell(AbTableActionButtons(
          onEditPressed: () => Get.toNamed(AbRoutes.editBanner, arguments: const BannerModel(imageUrl: '', targetScreen: '', isActive: false)),
          onDeletePressed: (){}
        ))
      ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 10;

  @override
  int get selectedRowCount => 0;
}