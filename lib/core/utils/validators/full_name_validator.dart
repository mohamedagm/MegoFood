String? fullNameValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Name cannot be empty';
  }
  if (value.trim().length < 2) {
    return 'Name is too short';
  }
  final nameRegExp = RegExp(r"^[a-zA-Z\s]+$");
  if (!nameRegExp.hasMatch(value.trim())) {
    return 'Name can only contain letters';
  }
  return null;
}
