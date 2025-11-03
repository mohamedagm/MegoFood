String normalizeEgyptianPhone(String value) {
  String normalized = value.trim();
  normalized = normalized.replaceAll(RegExp(r'[\s\-\(\)]'), '');
  if (normalized.startsWith('0')) {
    normalized = '+20${normalized.substring(1)}';
  } else if (!normalized.startsWith('+20')) {
    normalized = '+20$normalized';
  }
  return normalized;
}
