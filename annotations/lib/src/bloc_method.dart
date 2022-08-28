// ignore_for_file: public_member_api_docs, sort_constructors_first
class BlocUseCase {
  final String name;
  final Map<String, Type>? output;
  final Map<String, Type>? input;
  final List<String>? extraStates;
  final Type? failureModel;

  const BlocUseCase({
    required this.name,
    this.output,
    this.input,
    this.extraStates,
    this.failureModel,
  });
}

class BlocAnnotation {
  final Type baseEventType;
  final Type baseStateType;

  /// if not null it will be global for bloc
  final Type? failureModel;
  final List<BlocUseCase> blocUseCases;

  const BlocAnnotation({
    required this.baseEventType,
    required this.baseStateType,
    required this.blocUseCases,
    this.failureModel,
  });
}

/// T is input model for event
class BlocEvent {
  final Type? inputType;
  const BlocEvent({this.inputType});
}

/// T is output model for [CompletedState]
class BlocState {
  final Type type;
  const BlocState({required this.type});
}
