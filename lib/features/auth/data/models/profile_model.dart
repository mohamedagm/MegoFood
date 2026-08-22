class ProfileModel {
  final String id;
  final String email;
  final String fullName;
  final String? photoUrl;
  final String? gender;
  final String? dateOfBirth;

  ProfileModel({
    required this.id,
    required this.email,
    required this.fullName,
    this.photoUrl,
    this.gender,
    this.dateOfBirth,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id']?.toString() ?? '',
      email: json['email'] ?? '',
      fullName: json['fullName'] ?? '',
      photoUrl: json['photoUrl'],
      gender: json['gender'],
      dateOfBirth: json['dateOfBirth'],
    );
  }
}
