// ignore_for_file: public_member_api_docs, sort_constructors_first
class Option {
  final String name;
  final Type outputType;
  final Type inputType;

  const Option({
    required this.name,
    required this.outputType,
    required this.inputType,
  });
}

class BlocStateAnnotation {
  final Type baseEventType;
  final Type baseStateType;
  final List<Option> options;


  const BlocStateAnnotation({
    required this.baseEventType,
    required this.baseStateType,
    required this.options,
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
