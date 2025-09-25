import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';

class AbPagingatedDataTable extends StatelessWidget {
  const AbPagingatedDataTable({
    super.key, 
    this.sortAscending = true, 
    this.sortColumnIndex, 
    this.rowsPerPage = 10, 
    required this.source, 
    required this.columns, 
    this.onPageChanged, 
    this.dataRowHeight = AbSizes.xl * 2, 
    this.tableHeight = 760, 
    this.minWidth = 1000
  });
  final bool sortAscending;
  final int? sortColumnIndex;
  final int rowsPerPage;
  final DataTableSource source;
  final List<DataColumn> columns;
  final Function(int)? onPageChanged;
  final double dataRowHeight;
  final double tableHeight;
  final double? minWidth;


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(cardTheme: const CardThemeData(color: Colors.white, elevation: 0)),
      child: PaginatedDataTable2(
        source: source,
        columns: columns,
        columnSpacing: 12,
        dividerThickness: 0,
        minWidth: minWidth,
        horizontalMargin: 12,
        showCheckboxColumn: true,
        dataRowHeight: dataRowHeight,
        rowsPerPage: rowsPerPage,
        showFirstLastButtons: true,
        onPageChanged: onPageChanged,
        renderEmptyRowsInTheEnd: false,
        onRowsPerPageChanged: (noOfRows) => {},
        headingTextStyle: Theme.of(context).textTheme.titleMedium,
        headingRowColor: WidgetStateProperty.resolveWith((state) => AbColors.primaryBackground),
        headingRowDecoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(AbSizes.borderRadiusMd),topRight: Radius.circular(AbSizes.borderRadiusMd))),
        sortAscending: sortAscending,
        sortArrowAlwaysVisible: true,
        sortArrowIcon: Icons.line_axis,
        sortColumnIndex: sortColumnIndex,
        sortArrowBuilder: (bool ascending, bool sorted){
          if(sorted){
            return Icon(ascending ? Iconsax.arrow_up_3 : Iconsax.arrow_down, size: AbSizes.iconSm);
          }
          else {
            return const Icon(Iconsax.arrow_3, size: AbSizes.iconSm);
          }
        },
      ),
    );
  }
}