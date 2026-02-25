import 'package:mego_food/core/errors/failures.dart';

class ErrorAuthModel extends Failures {
  final String type;
  final String title;
  final int status;
  final Map<String, List<String>> errors;
  final String? traceId;

  ErrorAuthModel(
    super.message, {
    required this.type,
    required this.title,
    required this.status,
    required this.errors,
    this.traceId,
  });

  factory ErrorAuthModel.fromJson(Map<String, dynamic> json) {
    final rawErrors = json['errors'] as Map<String, dynamic>;

    final parsedErrors = rawErrors.map(
      (key, value) => MapEntry(key, List<String>.from(value)),
    );

    final combinedMessage = parsedErrors.values.expand((e) => e).join('\n');

    return ErrorAuthModel(
      combinedMessage,
      type: json['type'],
      title: json['title'],
      status: json['status'],
      errors: parsedErrors,
      traceId: json['traceId'],
    );
  }
}
