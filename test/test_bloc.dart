import 'package:bloc_use_case_generator/bloc_generator.dart';
part 'test_bloc.g.dart';

class BaseBlocEvent {}

class BaseBlocState {}

@BlocAnnotation(
  baseEventType: BaseBlocEvent,
  baseStateType: BaseBlocState,
  blocUseCases: [
    BlocUseCase(name: 'Asd', input: {'arg': Nullable<bool>})
  ],
)
class Bloc {}
