import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/main_header.dart';
import '../../controller/controllers.dart';

import 'components/product_grid.dart';
import 'components/product_loading_grid.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Expanded(
            child: Obx(() {
              if (productController.isProductLoading.value) {
                return const ProductLoadingGrid();
              } else {
                if (productController.productList.isNotEmpty) {
                  return ProductGrid(products: productController.productList);
                } else {
                  return Stack(
                    children: [
                      Image.asset(
                        'assets/page_not_found.png',
                        fit: BoxFit.fill,
                      ),
                      const Positioned(
                        bottom: 220,
                        // Adjust this value to position the text higher or lower
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Text(
                            "Products Not Found!",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              }
            }),
          ),
        ],
      ),
    );
  }
}
