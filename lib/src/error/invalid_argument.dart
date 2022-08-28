// ignore_for_file: public_member_api_docs, sort_constructors_first
class InvalidArgumentException implements Exception {
  final String fieldName;
  final String correctUsage;

  InvalidArgumentException({
    required this.fieldName,
    required this.correctUsage,
  });

  @override
  String toString() {
    return '$fieldName isnt true.\n$correctUsage';
  }
}
