class ErrorCodeMessage {
  final String code;
  final String message;

  ErrorCodeMessage({required this.code, required this.message});

  factory ErrorCodeMessage.fromJson(Map<String, dynamic> json) {
    return ErrorCodeMessage(code: json['code'], message: json['message']);
  }

  Map<String, dynamic> toJson() => {'code': code, 'message': message};
}
