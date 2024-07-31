import 'dart:ui';

Color primaryColor = "#2799D5".toColor();
Color secondaryColor = "#0068C0".toColor();
Color bottomNav = "#727272".toColor();
Color borderColor = "#C3EAFF".toColor();
Color authBorderColor = "#ECE9FF".toColor();
Color inputFiledBackground = "#DEDEDE".toColor();
Color categoryTextColor = "#5C5C5C".toColor();
Color dividerColor = "#F0F0F0".toColor();
Color oldPriceColor = "#AFAFAF".toColor();
Color newPriceColor = "#444444".toColor();
Color flashSaleBackgroundColor = "#EEF7FF".toColor();
Color sizeItemColor = "#494949".toColor();

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
