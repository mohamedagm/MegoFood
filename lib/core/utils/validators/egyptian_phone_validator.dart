String? egyptianPhoneValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Phone number cannot be empty';
  }

  String normalized = value.trim();
  normalized = normalized.replaceAll(RegExp(r'[\s\-\(\)]'), '');

  final validPattern = RegExp(r'^(\+?)[0-9]+$');
  if (!validPattern.hasMatch(normalized)) {
    return 'Invalid phone number format';
  }

  if (normalized.startsWith('0')) {
    normalized = '+20${normalized.substring(1)}';
  } else if (!normalized.startsWith('+20')) {
    normalized = '+20$normalized';
  }

  if (normalized.length != 13) {
    return 'Invalid Egyptian phone number';
  }

  return null;
}
