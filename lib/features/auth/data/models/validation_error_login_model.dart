import 'dart:convert';

import 'package:mego_food/core/errors/failures.dart';

class ValidationErrorAuthModel extends Failures {
  final String type;
  final String title;
  final int status;
  final Map<String, List<String>> errors;
  final String? traceId;

  ValidationErrorAuthModel(
    super.message, {
    required this.type,
    required this.title,
    required this.status,
    required this.errors,
    this.traceId,
  });

  factory ValidationErrorAuthModel.fromJson(Map<String, dynamic> json) {
    final Map<String, List<String>> parsed = {};
    json['errors'].forEach((key, value) {
      if (value is List) {
        parsed[key] = List<String>.from(value);
      } else if (value is String) {
        parsed[key] = [value];
      } else {
        parsed[key] = (value as List).map((e) => e.toString()).toList();
      }
    });
    return ValidationErrorAuthModel(
      parsed.values.first.first,
      type: json['type'],
      title: json['title'],
      status: json['status'],
      errors: parsed,
      traceId: json['traceId'],
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
