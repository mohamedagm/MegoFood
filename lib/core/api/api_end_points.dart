class ApiEndPoints {
  static String baseUrl = 'http://megofood.runasp.net';
  static String login = '/api/Account/Login';
  static String register = '/api/Account/register';
  static String forgetPassword = '/api/Account/ForgetPassword';
  static String vertifyForgetPassword = '/api/Account/VerfiyForgetPasswordOTP';
  static String resetPassword = '/api/Account/ResetPassword';
  static String confirmEmail = '/api/Account/confirm-email';
  static String resendConfirmEmail =
      '/api/Account/resend-confirmation-email- OTP';
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
