import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecomerce/view/home/components/popular_category/popular_category.dart';
import 'package:my_ecomerce/view/home/components/popular_category/popular_category_loading.dart';
import 'package:my_ecomerce/view/home/components/popular_product/popular_product_loading.dart';
import 'package:my_ecomerce/view/home/components/section_tile.dart';
import '../../component/main_header.dart';
import '../../controller/controllers.dart';
import 'components/carousel_slider/carousel_loading.dart';
import 'components/carousel_slider/carousel_slider_view.dart';
import 'components/popular_product/popular_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: SingleChildScrollView(

          child: Column(
            children: [
              const MainHeader(),
              Obx(() {
                print(homeController.bannerList.isNotEmpty);
                if (homeController.bannerList.isNotEmpty) {
                  return CarouselSliderView(
                      bannerList: homeController.bannerList,
                  );
                } else {
                  return const CarouselLoading();
                }
              }),
              const SectionTitle(title: 'PopularCategory'),
              Obx(() {
                print(homeController.popularCategoryList.isNotEmpty);
                if (homeController.popularCategoryList.isNotEmpty) {
                  return PopularCategory(categories: homeController.popularCategoryList);
                } else {
                  return const PopularCategoryLoading();
                }
              }),
              const SectionTitle(title: "Popular Product"),
              Obx(() {
                if (homeController.popularProductList.isNotEmpty) {
                  return PopularProduct(
                      popularProducts: homeController.popularProductList);
                } else {
                  return const PopularProductLoading();
                }
              }),
          
            ],
          ),
        ));
  }
}