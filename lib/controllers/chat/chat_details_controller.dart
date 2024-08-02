import 'package:get/get.dart';
import '../../http_client.dart';

class ChatDetailsController extends GetxController {
  RxBool isLoading = RxBool(true);
  Rx<dynamic> messageResponse = Rx<dynamic>({});
  Rx<dynamic> senderInfo = Rx<dynamic>({});
  RxList<dynamic> messageList = RxList<dynamic>([]);
  RxInt limit = 40.obs;
  RxInt page = 1.obs;
  RxString search = ''.obs;
  RxInt recipientId = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> loadMessages() async {
    try {
      isLoading.value = true;
      print('recipientId: ${recipientId.value}');
      print(senderInfo.value);
      // /messages/private/2?limit=10&page=1&search=
      final response = await HttpRequestHelper.get(
          '/messages/private/${recipientId.value}?limit=${limit.value}&page=${page.value}&search=${search.value}');
      messageList.value = response['data']['messages'];
      print(response);
      isLoading.value = false;
    } catch (e) {
      print(e);
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
