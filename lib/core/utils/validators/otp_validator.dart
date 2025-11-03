String? otpValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter the verification code';
  }
  if (value.trim().length < 4) {
    return 'OTP must be 4 digits';
  }
  final isNumeric = RegExp(r'^\d+$').hasMatch(value.trim());
  if (!isNumeric) {
    return 'OTP should contain only numbers';
  }
  return null;
}
