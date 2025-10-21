import 'package:ab_ecommerce_admin_panel/utils/device/device_utility.dart';
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

class BrandRows extends DataTableSource{
  @override
  DataRow? getRow(int index) {
   return DataRow2(cells: [
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
                  'Adidas', style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(color: AbColors.primary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              )
            ],)
        ),
        DataCell(
          Padding(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.symmetric(vertical: AbSizes.sm),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Wrap(
                spacing: AbSizes.xs,
                direction: AbDeviceUtils.isMobileScreen(Get.context!) ? Axis.vertical : Axis.horizontal,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: AbDeviceUtils.isMobileScreen(Get.context!) ? 0 : AbSizes.xs),
                    child: const Chip(label: Text('Shoes'), padding: EdgeInsets.all(AbSizes.xs)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: AbDeviceUtils.isMobileScreen(Get.context!) ? 0 : AbSizes.xs),
                    child: const Chip(label: Text('TrackSuits'), padding: EdgeInsets.all(AbSizes.xs)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: AbDeviceUtils.isMobileScreen(Get.context!) ? 0 : AbSizes.xs),
                    child: const Chip(label: Text('Joggers'), padding: EdgeInsets.all(AbSizes.xs)),
                  ),
                ],
              ),
            ),
          )
        ),
        const DataCell(Icon(Iconsax.heart5, color: AbColors.primary)),
        DataCell(Text(DateTime.now().toString())),
        DataCell(AbTableActionButtons(
          onEditPressed: () => Get.toNamed(AbRoutes.editBrand, arguments: ''),
          onDeletePressed: (){}
        ))
      ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 20;

  @override
  int get selectedRowCount => 0;
}