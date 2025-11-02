String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter your email';
  }

  if (!value.contains('@')) {
    return 'Missing @ symbol';
  }

  final parts = value.split('@');
  if (parts.length != 2 || parts[0].isEmpty || parts[1].isEmpty) {
    return 'Invalid email format';
  }

  if (!parts[1].contains('.')) {
    return 'Missing domain dot';
  }

  final domainParts = parts[1].split('.');
  if (domainParts.last.length < 2) {
    return 'Invalid domain extension';
  }

  const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  final regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Invalid characters';
  }

  return null;
}
