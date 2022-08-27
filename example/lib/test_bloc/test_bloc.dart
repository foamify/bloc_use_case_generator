import 'package:annotations/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'test_bloc.g.dart';

@BlocStateAnnotation(names: ['AddToCart', 'DeleteFromCart'])
class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc(TestState initialState) : super(initialState) {
    on<TestEvent>((event, emit) {});
  }
}



class TestEvent {

}

class TestState {}
