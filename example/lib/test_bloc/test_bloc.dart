import 'package:annotations/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/test_model.dart';

part 'test_bloc.g.dart';

@BlocStateAnnotation(
  baseEventType: TestEvent,
  baseStateType: TestState,
  options: [
    Option(
      name: 'AddToCart',
      inputType: int,
      outputType: List<TestModel>,
    ),
  ],
)
class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc(TestState initialState) : super(initialState) {
    on<TestEvent>((event, emit) {});
  }
}

@BlocEvent(inputType: int)
abstract class TestEvent {}

@BlocState(type: List<TestModel>)
abstract class TestState {}
