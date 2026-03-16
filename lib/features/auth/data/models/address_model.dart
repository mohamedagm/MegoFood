class AddressModel {
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final String? label;

  AddressModel({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.label,
  });
}
