import 'package:get/get.dart';
import '../../http_client.dart';

class HomeController extends GetxController {
  RxBool isLoading = RxBool(true);
  Rx<dynamic> homepageResponse = Rx<dynamic>({});
  RxList<dynamic> privateChatList = RxList<dynamic>([]);
  RxList<dynamic> groupChatList = RxList<dynamic>([]);

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getHomepageData() async {
    try {
      isLoading.value = true;

      final response = await HttpRequestHelper.get('/api/chats');
      print(response);
      privateChatList.value = response['data']['privateChats'];
      groupChatList.value = response['data']['groupChats'];

      isLoading.value = false;
    } catch (e) {
      print(e);
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
