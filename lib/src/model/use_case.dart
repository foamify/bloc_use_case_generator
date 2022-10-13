// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc_use_case_generator/src/model/use_case_state.dart';

class UseCase {
  final String name;
  final Map<String, String> inputs;
  final Map<String, String> outputs;
  final List<UseCaseState> extraStates;
  final String? failureModel;

  UseCase({
    required this.name,
    required this.inputs,
    required this.outputs,
    required this.extraStates,
    required this.failureModel,
  });
}
