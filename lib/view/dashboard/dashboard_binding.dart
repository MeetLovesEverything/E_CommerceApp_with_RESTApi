import 'package:get/get.dart';
import 'package:my_ecomerce/controller/category_controller.dart';
import 'package:my_ecomerce/controller/dashboard_controller.dart';

import '../../controller/auth_controller.dart';
import '../../controller/home_controller.dart';
import '../../controller/product_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(ProductController());
    Get.put(CategoryController());
    Get.put(AuthController());
  }
}
