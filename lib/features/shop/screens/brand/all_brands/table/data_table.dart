import 'package:ab_ecommerce_admin_panel/common/widgets/data_table/paginated_data_table.dart';
import 'package:ab_ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'table_source.dart';

class BrandTable extends StatelessWidget {
  const BrandTable({super.key});

  @override
  Widget build(BuildContext context) {
    return AbPaginatedDataTable(
      minWidth: 700,
      dataRowHeight: 64,
      columns: [
        DataColumn2(
          label: const Text('Brand'),
          fixedWidth: AbDeviceUtils.isMobileScreen(Get.context!) ? null : 200
        ),
        const DataColumn2(label: Text('Categories')),
        DataColumn2(
          label: const Text('Featured'),
          fixedWidth: AbDeviceUtils.isMobileScreen(Get.context!) ? null : 100
        ),
        DataColumn2(
          label: const Text('Date'),
          fixedWidth: AbDeviceUtils.isMobileScreen(Get.context!) ? null : 200
        ),
        DataColumn2(
          label: const Text('Action'),
          fixedWidth: AbDeviceUtils.isMobileScreen(Get.context!) ? null : 100
        ),
      ],
      source: BrandRows(),
    );
  }
}