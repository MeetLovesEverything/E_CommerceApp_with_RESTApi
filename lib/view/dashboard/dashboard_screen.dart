import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecomerce/view/account/account_screen.dart';
import 'package:my_ecomerce/view/category/category_screen.dart';
import 'package:my_ecomerce/view/home/home.dart';
import 'package:my_ecomerce/view/product/product_screen.dart';
import '../../controller/controllers.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: IndexedStack(
            index: dashboardController.currentIndex.value,
            children: const [
              HomeScreen(),
              ProductScreen(),
              CategoryScreen(),
              AccountScreen()
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: CurvedNavigationBar(
            backgroundColor: Colors.grey.shade100,
            color: Theme.of(context).primaryColor,
            buttonBackgroundColor: Theme.of(context).primaryColor,
            height: 60,
            animationDuration: const Duration(milliseconds: 600),
            items: const <Widget>[
              Icon(Icons.home, size: 30, color: Colors.white),
              Icon(Icons.category, size: 30, color: Colors.white),
              Icon(Icons.menu, size: 30, color: Colors.white),
              Icon(Icons.account_circle, size: 30, color: Colors.white),
            ],
            onTap: (index) {
              dashboardController.updateIndex(index);
            },
            index: dashboardController.currentIndex.value,
          ),
        ),
      );
    });
  }
}
