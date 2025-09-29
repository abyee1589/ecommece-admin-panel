
import 'package:ab_ecommerce_admin_panel/features/authentication/models/order_model.dart';
import 'package:ab_ecommerce_admin_panel/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/enums.dart';

class DashboardController extends GetxController{
  static DashboardController get instance => Get.find();

  /// Variables
  final RxList<double> weeklySales = <double>[].obs;


  static final List<OrderModel> orders = [
  OrderModel(
    id: 'cwab0012',
    status: OrderStatus.pending,
    totalAmount: 256,
    orderDate: DateTime.now().subtract(const Duration(days: 0)), // today
    deliveryDate: DateTime.now(),
  ),
  OrderModel(
    id: 'cwab0023',
    status: OrderStatus.processing,
    totalAmount: 300,
    orderDate: DateTime.now().subtract(const Duration(days: 1)), // yesterday
    deliveryDate: DateTime.now(),
  ),
  OrderModel(
    id: 'cwab0034',
    status: OrderStatus.shipped,
    totalAmount: 150,
    orderDate: DateTime.now().subtract(const Duration(days: 2)), // 2 days ago
    deliveryDate: DateTime.now(),
  ),
  OrderModel(
    id: 'cwab0045',
    status: OrderStatus.delivered,
    totalAmount: 400,
    orderDate: DateTime.now().subtract(const Duration(days: 3)), // 3 days ago
    deliveryDate: DateTime.now(),
  ),
];


  @override
  void onInit(){
    _calculateWeeklySales();
    super.onInit();
  }

  void _calculateWeeklySales(){
    weeklySales.value = List<double>.filled(7, 0.0);
    for(var order in orders){
      final DateTime orderWeekStart = AbHelperFunctions.getStartOfDate(order.orderDate);
      if(orderWeekStart.isBefore(DateTime.now()) && orderWeekStart.add(const Duration(days: 7)).isAfter(DateTime.now())){
        int index = (order.orderDate.weekday - 1) % 7;

        index = index < 0 ? index + 7 : index;

        weeklySales[index] += order.totalAmount;

        print('Order date: ${order.orderDate}, Current week day: $orderWeekStart, Index: $index');
      }
    }
    print('$weeklySales weaekly sales');
  }
}