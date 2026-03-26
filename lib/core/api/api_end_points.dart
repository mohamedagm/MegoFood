class ApiEndPoints {
  //base url
  static String baseUrl = 'http://megofood.runasp.net';
  //authentication
  static String login = '/api/Authentication/Login';
  static String register = '/api/Authentication/register';
  static String forgetPassword = '/api/Authentication/forgot-password';
  static String vertifyForgetPassword =
      '/api/Authentication/verify-forgot-password-otp';
  static String resetPassword = '/api/Authentication/reset-password';
  static String confirmEmail = '/api/Authentication/confirm-email';
  static String resendConfirmEmail =
      '/api/Authentication/resend-confirmation-email';
  static String refreshToken = '/api/Authentication/refresh-token';
  static String createProfile = '/api/Authentication/Complete-Profile';
  //Base Categories
  static String getAllBaseCategories =
      '/api/BaseCategories/Get_All_BaseCategories';
  //products
  static String getProductsByCategory =
      '/api/Products/Get_Products_By_Category';
  //Restaurants
  static String getRestaurantesByBaseCategoryId =
      '/api/Restaurants/Get_All_Restaurantes_ByBaseCategoryId';
}

class ApiKeys {
  static String email = 'email';
  static String password = 'password';
  static String otpForgetPassword = 'codeOTP';
  static String otpConfirmEmail = 'otp';
  static String token = 'token';
  static String newPassword = 'newPassword';
  static String confirmNewPassword = 'confirmNewPassword';
}
