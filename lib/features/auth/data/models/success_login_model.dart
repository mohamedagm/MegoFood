import 'dart:convert';

class SuccessLoginModel {
  final String userId;
  final String token;
  final int expiresIn;
  final String refreshToken;
  final String refreshTokenExpiration;

  SuccessLoginModel({
    required this.userId,
    required this.token,
    required this.expiresIn,
    required this.refreshToken,
    required this.refreshTokenExpiration,
  });

  factory SuccessLoginModel.fromJson(Map<String, dynamic> json) {
    return SuccessLoginModel(
      userId: json['userId'],
      token: json['token'],
      expiresIn: json['expiresIn'],
      refreshToken: json['refreshToken'],
      refreshTokenExpiration: json['refreshTokenExpiration'],
    );
  }

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'token': token,
    'expiresIn': expiresIn,
    'refreshToken': refreshToken,
    'refreshTokenExpiration': refreshTokenExpiration,
  };

  @override
  String toString() => jsonEncode(toJson());
}
