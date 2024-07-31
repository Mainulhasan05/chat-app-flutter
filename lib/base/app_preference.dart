import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const String authTokenKey = 'authToken';
  static const String cartTokenKey = 'cart';

  // Save the authentication token
  static Future<void> saveAuthToken(String authToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(authTokenKey, authToken);
  }

  // Get the authentication token
  static Future<String?> getAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(authTokenKey);
  }

  // Remove the authentication token
  static Future<void> removeAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(authTokenKey);
  }

  // write functions to store and manage cart_token
  static Future<void> saveCartToken(String cartToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(cartTokenKey, cartToken);
  }

  static Future<String?> getCartToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(cartTokenKey);
  }

  static Future<void> removeCartToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(cartTokenKey);
  }
}
