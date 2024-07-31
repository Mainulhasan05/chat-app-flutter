import 'package:shared_preferences/shared_preferences.dart';

class PrefData {
  static String prefName = "com.example.goinmart";

  static String introAvailable = "${prefName}isIntroAvailable";
  static String isLoggedIn = "${prefName}isLoggedIn";
  static String getTheme = "${prefName}isSelectedTheme";
  static String getDefaultCode = "${prefName}code";
  static String getDefaultCountry = "${prefName}country";
  static String defIndexVal = "${prefName}index";
  static String modelBooking = "${prefName}bookingModel";
  static String defCountryName = "image_albania.jpg";
  static String token = "";
  static String cart_token = "";

  static Future<SharedPreferences> getPrefInstance() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences;
  }

  static setLogIn(bool avail) async {
    SharedPreferences preferences = await getPrefInstance();
    preferences.setBool(isLoggedIn, avail);
  }

  static setToken(String token) async {
    SharedPreferences preferences = await getPrefInstance();
    preferences.setString("token", token);
  }

  static setCartToken(String token) async {
    SharedPreferences preferences = await getPrefInstance();
    preferences.setString("cart_token", token);
  }

  static setBookingModel(String avail) async {
    SharedPreferences preferences = await getPrefInstance();
    preferences.setString(modelBooking, avail);
  }

  static Future<bool> isLogIn() async {
    SharedPreferences preferences = await getPrefInstance();
    bool isIntroAvailable = preferences.getBool(isLoggedIn) ?? false;
    return isIntroAvailable;
  }

  static Future<String> getToken() async {
    SharedPreferences preferences = await getPrefInstance();
    String isIntroAvailable = preferences.getString("token") ?? "";
    return isIntroAvailable;
  }

  static Future<String> getCartToken() async {
    SharedPreferences preferences = await getPrefInstance();
    String isIntroAvailable = preferences.getString("cart_token") ?? "";
    return isIntroAvailable;
  }

  static Future<String> getBookingModel() async {
    SharedPreferences preferences = await getPrefInstance();
    String isIntroAvailable = preferences.getString(modelBooking) ?? "";
    return isIntroAvailable;
  }

  static Future<int> getDefIndex() async {
    SharedPreferences preferences = await getPrefInstance();
    int isIntroAvailable = preferences.getInt(defIndexVal) ?? 0;
    return isIntroAvailable;
  }

  static Future<String> getDefCode() async {
    SharedPreferences preferences = await getPrefInstance();
    String isIntroAvailable = preferences.getString(getDefaultCode) ?? "+1";
    return isIntroAvailable;
  }

  static Future<String> getDefCountry() async {
    SharedPreferences preferences = await getPrefInstance();
    String isIntroAvailable =
        preferences.getString(getDefaultCountry) ?? defCountryName;
    return isIntroAvailable;
  }
}
