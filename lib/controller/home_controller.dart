import 'package:get/get.dart';
import 'package:my_ecomerce/model/ad_banner.dart';
import 'package:my_ecomerce/model/product.dart';
import 'package:my_ecomerce/service/remote_services/remote_banner_service.dart';
import 'package:my_ecomerce/service/remote_services/remote_popular_category_service.dart';

import '../model/category.dart';
import '../service/local_services/local_ad_banner_service.dart';
import '../service/local_services/local_category_service.dart';
import '../service/local_services/local_product_service.dart';
import '../service/remote_services/remote_popular_product_service.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> popularCategoryList = List<Category>.empty(growable: true).obs;
  RxList<Product> popularProductList = List<Product>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;
  RxBool isPopularCategoryLoading = false.obs;
  RxBool isPopularProductLoading = false.obs;
  final LocalAdBannerService _localAdBannerService = LocalAdBannerService();
  final LocalCategoryService _localCategoryService = LocalCategoryService();
  final LocalProductService _localProductService = LocalProductService();

  @override
  Future<void> onInit() async {
    super.onInit();
    await _localAdBannerService.init();
    await _localCategoryService.init();
    await _localProductService.init();
    getAdBanners();
    getPopularCategories();
    getPopularProduct();
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);

      if (_localAdBannerService.getAdBanners().isNotEmpty) {
        bannerList.assignAll(_localAdBannerService.getAdBanners());
      }

      var result = await RemoteBannerService().get();
      if (result != null) {
        var adBanners = adBannerListFromJson(result.body);
        bannerList.assignAll(adBanners);
        await _localAdBannerService.assignAllAdBanners(adBanners: adBanners);
      }
    } finally {
      isBannerLoading(false);
    }
  }

  void getPopularCategories() async {
    try {
      isPopularCategoryLoading(true);

      if (_localCategoryService.getPopularCategories().isNotEmpty) {
        popularCategoryList.assignAll(_localCategoryService.getPopularCategories());
      }

      var result = await RemotePopularCategoryService().get();
      if (result != null) {
        var categories = popularCategoryListFromJson(result.body);
        popularCategoryList.assignAll(categories);
        await _localCategoryService.assignAllPopularCategories(popularCategories: categories);
      }
    } finally {
      print(popularCategoryList.length);
      isPopularCategoryLoading(false);
    }
  }

  void getPopularProduct() async {
    try {
      isPopularProductLoading(true);

      if (_localProductService.getPopularProducts().isNotEmpty) {
        popularProductList.assignAll(_localProductService.getPopularProducts());
      }

      var result = await RemotePopularProductService().get();
      if (result != null) {
        var products = popularProductListFromJson(result.body);
        popularProductList.assignAll(products);
        await _localProductService.assignAllPopularProducts(popularProducts: products);
      }
    } finally {
      print("popular product list len ${popularProductList.length}");
      isPopularProductLoading(false);
    }
  }
}
