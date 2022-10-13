class UseCaseState {
  /// [name] should be without `State` word
  /// code generation adds `State` to generated class
  final String name;

  /// defines class fields
  /// map as field name - field type
  final Map<String, String>? arguments;

  UseCaseState({
    required this.name,
    this.arguments,
  });
}
