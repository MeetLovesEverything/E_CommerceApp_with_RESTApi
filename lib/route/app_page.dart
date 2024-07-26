import 'package:get/get.dart';
import 'package:my_ecomerce/route/app_route.dart';
import 'package:my_ecomerce/view/dashboard/dashboard_binding.dart';
import 'package:my_ecomerce/view/dashboard/dashboard_screen.dart';

class AppPage {
  static var list = [
    GetPage(
      name: AppRoute.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    )
  ];
}
