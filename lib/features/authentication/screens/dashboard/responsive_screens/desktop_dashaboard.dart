import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/texts/section_heading.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesktopDashboardScreen extends StatelessWidget {
  const DesktopDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DashboardController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Header
                Text('Dahsboard', style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: AbSizes.spaceBtwSections),

                /// Cards
                const Row(
                  children: [
                    AbRoundedContainer(
                      padding: EdgeInsets.all(AbSizes.lg),
                      child: Column(
                        children: [
                          AbSectionHeading(title: 'Sales', textColor: AbColors.textSecondary),
                          SizedBox(height: AbSizes.spaceBtwSections)
                        ],
                      ),
                    )
                  ],
                )


                // TextFormField(
                //   controller: controller.searchTextController,
                //   onChanged: (query) => controller.searchQuery(query),
                //   decoration: const InputDecoration(hintText: 'Search Here...', prefixIcon: Icon(Iconsax.search_normal))),
                // const SizedBox(height: AbSizes.spaceBtwSections),
          
                // /// Dashboard Table
                // Expanded(
                //   child: Obx(
                //     () {
                //       Visibility(visible: false, child: Text(controller.filteredDataList.length.toString()));
                //       return AbPagingatedDataTable(
                //         sortAscending: controller.sortAscending.value,
                //         sortColumnIndex: controller.sortColumnIndex.value,
                //         source: MyData(), 
                //         columns: [
                //           const DataColumn2(label: Text('Clumn 1'), ),
                //           DataColumn2(label: const Text('Clumn 2'), onSort: (columnIndex, ascending) => controller.sortById(columnIndex, ascending)),
                //           const DataColumn2(label: Text('Clumn 3')),
                //           DataColumn2(label: const Text('Clumn 4'), onSort: (columnIndex, ascending) => controller.sortById(columnIndex, ascending)),
                //         ]
                //       );
                //     }
                //   ),
                // )
              ], 
            )
          ),
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  final controller = DashboardController.instance;
  @override
  DataRow? getRow(int index) {
    // TODO: implement getRow
    final data = controller.dataList[index];
    return DataRow2(
      onTap: (){},
      selected: controller.selectedRows[index],
      onSelectChanged: (value) {
        controller.selectedRows[index] = value ?? false;
        notifyListeners();
      },
      cells: [
            DataCell(Text(data['Column1'] ?? '')),
            DataCell(Text(data['Column2'] ?? '')),
            DataCell(Text(data['Column3'] ?? '')),
            DataCell(Text(data['Column4'] ?? '')),
           ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => controller.dataList.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

}

class DashboardController extends GetxController{
  static DashboardController get instance => Get.find();
  var dataList = <Map<String, String>>[].obs; 
  var filteredDataList = <Map<String, String>>[].obs; 
  RxList<bool> selectedRows = <bool>[].obs; 
  RxInt sortColumnIndex = 1.obs; 
  RxBool sortAscending = true.obs; 
  final searchTextController = TextEditingController();

  @override
  void onInit(){
    super.onInit();
    fetchDummyData();
  }

  void fetchDummyData(){
    selectedRows.assignAll(List.generate(36, (index) => false));
    dataList.addAll(List.generate(36, (index) => {
      'Column1': 'Data ${index + 1} - 1',
      'Column2': 'Data ${index + 1} - 2',
      'Column3': 'Data ${index + 1} - 3',
      'Column4': 'Data ${index + 1} - 4',
    }));

    filteredDataList.addAll(List.generate(36, (index) => {
      'Column1': 'Data ${index + 1} - 1',
      'Column2': 'Data ${index + 1} - 2',
      'Column3': 'Data ${index + 1} - 3',
      'Column4': 'Data ${index + 1} - 4',
    }));
  }

  void searchQuery(String query){
    filteredDataList.assignAll(dataList.where((item) => item['Column1']!.contains(query.toLowerCase())));
  }

  void sortById(int sortColumnIndex, bool ascending){
    sortAscending.value = ascending;
    dataList.sort((a, b){
      if(ascending){
        return dataList[0]['Column1'].toString().toLowerCase().compareTo(dataList[0]['Column1'].toString().toLowerCase());
      }
      else {
        return dataList[0]['Column1'].toString().toLowerCase().compareTo(dataList[0]['Column1'].toString().toLowerCase());
      }
    });
    this.sortColumnIndex.value = sortColumnIndex;
  }
}