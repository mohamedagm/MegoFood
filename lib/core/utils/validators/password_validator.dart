String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter your password';
  }

  if (value.length < 8) {
    return 'At least 8 characters';
  }

  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Add an uppercase letter';
  }

  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Add a lowercase letter';
  }

  if (!RegExp(r'\d').hasMatch(value)) {
    return 'Add a number';
  }

  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    return 'Add a special character';
  }

  return null;
}
