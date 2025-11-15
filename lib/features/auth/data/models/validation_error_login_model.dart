import 'dart:convert';

class ValidationErrorLoginModel {
  final String type;
  final String title;
  final int status;
  final Map<String, List<String>> errors;
  final String? traceId;

  ValidationErrorLoginModel({
    required this.type,
    required this.title,
    required this.status,
    required this.errors,
    this.traceId,
  });

  factory ValidationErrorLoginModel.fromJson(Map<String, dynamic> json) {
    final rawErrors = (json['errors'] as Map<String, dynamic>?) ?? {};
    final Map<String, List<String>> parsed = {};
    rawErrors.forEach((key, value) {
      if (value is List) {
        parsed[key] = value
            .map((e) => e?.toString() ?? '')
            .where((s) => s.isNotEmpty)
            .toList();
      } else if (value is String) {
        parsed[key] = [value];
      } else {
        parsed[key] = [value?.toString() ?? ''];
      }
    });

    return ValidationErrorLoginModel(
      type: json['type']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      status: (json['status'] is int)
          ? json['status'] as int
          : int.tryParse(json['status']?.toString() ?? '') ?? 0,
      errors: parsed,
      traceId: json['traceId']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'type': type,
    'title': title,
    'status': status,
    'errors': errors.map((k, v) => MapEntry(k, v)),
    if (traceId != null) 'traceId': traceId,
  };

  @override
  String toString() => jsonEncode(toJson());
}
