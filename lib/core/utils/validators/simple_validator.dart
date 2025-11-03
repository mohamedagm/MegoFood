String? simpleValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'fill this field';
  }
  return null;
}
