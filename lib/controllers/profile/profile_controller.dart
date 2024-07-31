// /customer-details
import 'package:get/get.dart';
import '../../http_client.dart';

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<dynamic> profileResponse = Rx<dynamic>({});

  RxList<dynamic> profileData = RxList<dynamic>([]);
  RxList<dynamic> addressData = RxList<dynamic>([]);
  RxList<dynamic> orderData = RxList<dynamic>([]);

  void getProfileData() async {
    try {
      isLoading.value = true;
      final response = await HttpRequestHelper.get('/customer-details');
      profileResponse.value = response;
      profileData.value = response['data'];
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  // /customer-address get
  void getAddressData() async {
    try {
      isLoading.value = true;
      final response = await HttpRequestHelper.get('/customer-address');
      addressData.value = response['data'];
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  // /add-customer-address
  void addAddress(Map<String, dynamic> address) async {
    try {
      isLoading.value = true;
      final response =
          await HttpRequestHelper.post('/add-customer-address', address);
      // addressData.add(response['data']);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  // /delete-customer-address?id=${id} get
  void deleteAddress(int id) async {
    try {
      isLoading.value = true;
      final response =
          await HttpRequestHelper.get('/delete-customer-address?id=${id}');
      // addressData.add(response['data']);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  // /edit-customer-address post
  void editAddress(Map<String, dynamic> address) async {
    try {
      isLoading.value = true;
      final response =
          await HttpRequestHelper.post('/edit-customer-address', address);
      // addressData.add(response['data']);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  // /my-order get
  void getOrderData() async {
    try {
      isLoading.value = true;
      final response = await HttpRequestHelper.get('/my-order');
      orderData.value = response['data'];
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  // /v2/place-order-v2 post
  void placeOrder(Map<String, dynamic> order) async {
    try {
      isLoading.value = true;
      final response =
          await HttpRequestHelper.post('/v2/place-order-v2', order);
      // orderData.add(response['data']);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
