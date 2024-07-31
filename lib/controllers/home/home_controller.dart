import 'package:get/get.dart';
import '../../http_client.dart';

class HomeController extends GetxController {
  RxBool isHomeLoading = RxBool(true);
  RxBool isCategoryLoading = RxBool(true);
  Rx<dynamic> homepageResponse = Rx<dynamic>({});
  RxList<dynamic> homeCategories = RxList<dynamic>([]);
  RxList<dynamic> bannerImages = RxList<dynamic>([]);
  RxList<dynamic> flashSaleProducts = RxList<dynamic>([]);
  RxList<dynamic> bestSellingProducts = RxList<dynamic>([]);
  RxList<dynamic> homeCategoryProducts = RxList<dynamic>([]);
  RxInt selectedCategoryIndex = RxInt(0);

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getHomepageData() async {
    try {
      isHomeLoading.value = true;
      final response = await HttpRequestHelper.get('/get-homepage-data-dev2');
      homepageResponse.value = response;
      homeCategories.value = response['category'];
      flashSaleProducts.value = response['discount_product'];
      bestSellingProducts.value = response['best_seller'];
      bannerImages.value = response['banner']['large']
          .map((banner) => ({
                'image': banner['image'],
              }))
          .toList();
      isHomeLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      isHomeLoading.value = false;
    }
  }

  Future<void> getCategories() async {
    try {
      isCategoryLoading.value = true;

      final response = await HttpRequestHelper.get('/allcategory');

      homeCategories.value = response['data'];
    } catch (e) {
      print(e);
    } finally {
      isCategoryLoading.value = false;
    }
  }
}
