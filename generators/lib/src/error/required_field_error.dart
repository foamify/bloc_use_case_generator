// ignore_for_file: public_member_api_docs, sort_constructors_first
class RequiredFieldError implements Exception {
  final String fieldName;

  RequiredFieldError({
    required this.fieldName,
  });

  @override
  String toString() {
    return '$fieldName required';
  }
}
