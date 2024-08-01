abstract class Routes {
  static const homeRoute = Paths.homepath;
  static const introRoute = Paths.introPath;
  static const loginRoute = Paths.loginPath;
  static const forgotRoute = Paths.forgotPath;
  static const resetPasswordRoute = Paths.resetPasswordPath;
  static const changePasswordRoute = Paths.changePasswordPath;
  static const signupRoute = Paths.signUpPath;
  static const verifyRoute = Paths.verifyPath;
  static const chatDetailRoute = Paths.chatDetailPath;
  static const homeScreenRoute = Paths.homescreenPath;

  static const profileRoute = Paths.profilePath;
  static const searchRoute = Paths.searchPath;
  static const searchResultRoute = Paths.searchResultPath;
}

abstract class Paths {
  static const homepath = "/";
  static const introPath = "/IntroScreen";
  static const loginPath = "/LoginScreen";
  static const forgotPath = "/ForgotPassword";
  static const resetPasswordPath = "/ResetPassword";
  static const changePasswordPath = "/ChangePassword";
  static const signUpPath = "/SignUpScreen";
  static const verifyPath = "/VerifyScreen";
  static const homescreenPath = "/HomeScreen";
  static const chatDetailPath = "/ChatDetailScreen";

  static const categoryPath = "/CategoryScreen";
  static const detailPath = "/DetailScreen";

  static const paymentPath = "/PaymentScreen";

  static const profilePath = "/ProfileScreen";
  static const editProfilePath = "/EditProfileScreen";

  static const notificationPath = "/NotificationScreen";
  static const searchPath = "/SearchScreen";
  static const searchResultPath = "/SearchResultScreen";

  // ConfirmForgetPassOtp
  static const confirmForgetPassOtpPath = "/ConfirmForgetPassOtp";
}
