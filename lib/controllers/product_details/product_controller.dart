import 'package:get/get.dart';
import '../../http_client.dart';
import 'dart:convert';

class ProductController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<dynamic> productDetails = Rx<dynamic>(null);
  RxList<String> productImages = RxList<String>([]);
  RxList<dynamic> productOptions = RxList<dynamic>([]);
  RxList<dynamic> selectedProductOptions = RxList<dynamic>([]);
  RxString productSlug = ''.obs;
  RxString productName = ''.obs;
  RxString productPrice = ''.obs;
  RxBool isSelected = false.obs;
  RxInt quantity = 1.obs;
  var selectedSize = Rx<String?>(null);

  void getProductDetails(
      String slug, String name, String price, String image) async {
    try {
      productName.value = name;
      productImages.clear();
      productImages.add(image);
      quantity.value = 1;
      productPrice.value = price;
      selectedProductOptions.clear();
      productSlug.value = slug;
      isLoading.value = true;
      print('slug= $slug');

      final response = await HttpRequestHelper.get(
          "/product-details?slug=${productSlug.value}");
      print(response);

      productDetails.value = response;
      productImages.value = List<String>.from(
        response['images']
            .map((image) => Constant.imageDomain + image['image']),
      );
      productDetails.value?['description']['description'] = (Uri.decodeFull(
          productDetails.value?['description']?['description'] ?? ""));
      productImages.insert(0, image);
      productOptions.value = response['option'];
    } catch (e) {
      print("printing error");
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  // increase quantity
  void increaseQuantity() {
    quantity.value += 1;
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value -= 1;
    }
  }

  void selectSize(String optionValueId) {
    selectedSize.value = optionValueId;
  }

  void selectOption(String parentId, String childId) {
    // Check if the option with the same parentId already exists
    var existingOption = selectedProductOptions.firstWhere(
      (option) => option['parent'] == parentId,
      orElse: () => null,
    );

    if (existingOption != null) {
      // Replace the child value
      selectedProductOptions.remove(existingOption);
    }
    selectedProductOptions.add({'parent': parentId, 'child': childId});
  }

  bool isOptionSelected(String parentId, String childId) {
    return selectedProductOptions.any(
      (option) => option['parent'] == parentId && option['child'] == childId,
    );
  }

  // apply coupon
  void applyCoupon(String coupon, String product_id) async {
    print(coupon);
    print(product_id);
    // /quickcoupon
    var data = {'coupon': coupon, 'product_id': product_id};
    try {
      final response = await HttpRequestHelper.postFormData("/coupon", data);
    } catch (e) {}
  }
}
