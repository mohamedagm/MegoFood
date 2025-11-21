import 'package:mego_food/core/errors/failures.dart';
import 'package:mego_food/features/auth/data/models/error_code_message.dart';

class ErrorAuthModel extends Failures {
  final String type;
  final String title;
  final int status;
  final ErrorCodeMessage error;
  final String? traceId;

  ErrorAuthModel(
    super.message, {
    required this.type,
    required this.title,
    required this.status,
    required this.error,
    this.traceId,
  });

  factory ErrorAuthModel.fromJson(Map<String, dynamic> json) {
    return ErrorAuthModel(
      ErrorCodeMessage.fromJson(json['error']).message,
      type: json['type'],
      title: json['title'],
      status: json['status'],
      error: ErrorCodeMessage.fromJson(json['error']),
      traceId: json['traceId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'type': type,
    'title': title,
    'status': status,
    'error': error.toJson(),
    'traceId': traceId,
  };
}
