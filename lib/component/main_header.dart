import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controllers.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 10,
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(24),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: const Offset(0, 0),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Obx(
                      () => TextField(
                    autofocus: false,
                    controller: productController.searchTextEditController,
                    onSubmitted: (val) {
                      productController.getProductByName(keyword: val);
                      dashboardController.updateIndex(1);
                    },
                    onChanged: (val) {
                      productController.searchVal.value = val;
                    },
                    decoration: InputDecoration(
                      suffixIcon: productController.searchVal.value.isNotEmpty
                          ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          productController.searchTextEditController.clear();
                          productController.searchVal.value = '';
                          productController.getProducts();
                        },
                      )
                          : null,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 16,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search...",
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 8,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(12),
              child: const Icon(
                Icons.filter_alt_outlined,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 10),
            Obx(
                  () => badges.Badge(
                badgeContent: Text(
                  '${productController.totalItems}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Theme.of(context).primaryColor,
                ),
                child: Container(
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
