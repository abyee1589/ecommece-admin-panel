import 'package:ab_ecommerce_admin_panel/common/widgets/data_table/paginated_data_table.dart';
import 'package:ab_ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'table_source.dart';

class ProductsTable extends StatelessWidget {
  const ProductsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return AbPaginatedDataTable(
      minWidth: 1000,
      columns: [
        DataColumn2(
          label: const Text('Product'),
          fixedWidth: !AbDeviceUtils.isDesktopScreen(context) ? 300 : 400,
        ),
        const DataColumn2(label: Text('Stock')),
        const DataColumn2(label: Text('Brand')),
        const DataColumn2(label: Text('Price')),
        const DataColumn2(label: Text('Date')),
        const DataColumn2(label: Text('Action'), fixedWidth: 100),
      ],
      source: ProductsRows(),
    );
  }
}