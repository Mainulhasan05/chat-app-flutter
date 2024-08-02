import 'package:shared_preferences/shared_preferences.dart';

class PrefData {
  static final String prefName = "com.example.chatapp";

  // User data keys
  static final String userId = "${prefName}userId";
  static final String userName = "${prefName}userName";
  static final String userPhone = "${prefName}userPhone";
  static final String userImage = "${prefName}userImage";
  static final String roomId = "${prefName}roomId";

  // Other keys
  static final String introAvailable = "${prefName}isIntroAvailable";
  static final String isLoggedIn = "${prefName}isLoggedIn";
  static final String getTheme = "${prefName}isSelectedTheme";
  static final String getDefaultCode = "${prefName}code";
  static final String getDefaultCountry = "${prefName}country";
  static final String defIndexVal = "${prefName}index";
  static final String modelBooking = "${prefName}bookingModel";
  static final String defCountryName = "image_albania.jpg";

  // Initialize SharedPreferences
  static Future<SharedPreferences> _initializePreferences() async {
    return await SharedPreferences.getInstance();
  }

  // Access SharedPreferences
  static Future<SharedPreferences> get _preferences async {
    return await _initializePreferences();
  }

  static Future<void> setLogIn(bool avail) async {
    final prefs = await _preferences;
    await prefs.setBool(isLoggedIn, avail);
  }

  static Future<void> setToken(String token) async {
    final prefs = await _preferences;
    await prefs.setString("token", token);
  }

  static Future<void> setCartToken(String token) async {
    final prefs = await _preferences;
    await prefs.setString("cart_token", token);
  }

  static Future<void> setBookingModel(String model) async {
    final prefs = await _preferences;
    await prefs.setString(modelBooking, model);
  }

  static Future<bool> isLogIn() async {
    final prefs = await _preferences;
    return prefs.getBool(isLoggedIn) ?? false;
  }

  static Future<String> getToken() async {
    final prefs = await _preferences;
    return prefs.getString("token") ?? "";
  }

  static Future<String> getCartToken() async {
    final prefs = await _preferences;
    return prefs.getString("cart_token") ?? "";
  }

  static Future<String> getBookingModel() async {
    final prefs = await _preferences;
    return prefs.getString(modelBooking) ?? "";
  }

  static Future<int> getDefIndex() async {
    final prefs = await _preferences;
    return prefs.getInt(defIndexVal) ?? 0;
  }

  static Future<String> getDefCode() async {
    final prefs = await _preferences;
    return prefs.getString(getDefaultCode) ?? "+1";
  }

  static Future<String> getDefCountry() async {
    final prefs = await _preferences;
    return prefs.getString(getDefaultCountry) ?? defCountryName;
  }

  static Future<void> setUserInfo(String id, String name, String phone,
      String image, String room_id) async {
    final prefs = await _preferences;
    await prefs.setString(userId, id);
    await prefs.setString(userName, name);
    await prefs.setString(userPhone, phone);
    await prefs.setString(userImage, image);
    await prefs.setString(roomId, room_id);
  }

  static Future<Map<String, String>> getUserInfo() async {
    final prefs = await _preferences;
    return {
      "id": prefs.getString(userId) ?? "",
      "full_name": prefs.getString(userName) ?? "",
      "phone": prefs.getString(userPhone) ?? "",
      "avatar": prefs.getString(userImage) ?? "",
      "room_id": prefs.getString(roomId) ?? "",
    };
  }
}
