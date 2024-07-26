import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../model/product.dart';
import '../service/remote_services/remote_products_service.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  TextEditingController searchTextEditController = TextEditingController();
  RxString searchVal = ''.obs;
  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  var cartList = <Product, Map<int, String>>{}.obs;
  RxInt totalItems = 0.obs;
  RxBool isProductLoading = false.obs;


  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isProductLoading(true);
      var result = await RemoteProductService().get();
      if(result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      print(productList.length);
    }
  }

  void getProductByName({required String keyword}) async {
    try {
      isProductLoading(true);
      var result = await RemoteProductService().getByName(key: keyword);
      if(result != null){
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      print(productList.length);
    }
  }
  void getProductByCategory({required int id}) async {
    try {
      isProductLoading(true);
      var result = await RemoteProductService().getByCategory(id: id);
      if(result != null){
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      print(productList.length);
    }
  }

  void updateCart(Product product, int qty, String title) {
    if (cartList.containsKey(product)) {
      cartList[product]![qty] = title;
    } else {
      cartList[product] = {qty: title};
    }
    // Update totalItems to reflect the number of different products in the cart
    totalItems.value = cartList.length;

    print(cartList.keys);
    print(cartList.values);
  }
  String items(){
    return totalItems.toString();
  }
}