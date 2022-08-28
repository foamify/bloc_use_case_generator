import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generators/src/error/invalid_argument.dart';
import 'package:generators/src/error/required_field_error.dart';
import 'package:generators/src/model/use_case.dart';
import 'package:source_gen/source_gen.dart';

import 'class_name_visitor.dart';

class BlocGenerator extends GeneratorForAnnotation<BlocAnnotation> {
  @override
  String generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    final blocName = element.name?.replaceFirst('Bloc', '');
    final baseEventType = annotation.read('baseEventType').typeValue;
    final baseStateType = annotation.read('baseStateType').typeValue;

    if (blocName == null) {
      throw RequiredFieldError(fieldName: 'name');
    }

    var useCases = annotation.read('blocUseCases').listValue;
    final List<UseCase> usecaseModels = [];
    for (final useCase in useCases) {
      final outputDartMap = useCase.getField('output')?.toMapValue();
      final inputDartMap = useCase.getField('input')?.toMapValue();
      final name = useCase.getField('name')?.toStringValue();

      if (name == null) {
        throw RequiredFieldError(fieldName: 'name');
      }

      final extraStatesDartList = useCase.getField('extraStates')?.toListValue();

      Map<String, String> outputs = {};
      if (outputDartMap != null) {
        for (var entry in outputDartMap.entries) {
          var key = entry.key?.toStringValue();
          var type = entry.value?.toTypeValue().toString().replaceAll('*', '');
          if (key == null || type == null) {
            throw InvalidArgumentException(
              fieldName: 'output',
              correctUsage: "{'name':type}",
            );
          }
          outputs[key] = type;
        }
      }

      Map<String, String> inputs = {};
      if (inputDartMap != null) {
        for (var entry in inputDartMap.entries) {
          var key = entry.key?.toStringValue();
          var type = entry.value?.toTypeValue().toString().replaceAll('*', '');
          if (key == null || type == null) {
            throw InvalidArgumentException(
              fieldName: 'input',
              correctUsage: "{'name':type}",
            );
          }
          inputs[key] = type;
        }
      }

      List<String> states = [];
      if (extraStatesDartList != null) {
        for (var state in extraStatesDartList) {
          var s = state.toStringValue();
          if (s != null) {
            states.add(s);
          }
        }
      }

      usecaseModels.add(UseCase(
        name: name,
        inputs: inputs,
        outputs: outputs,
        extraStates: states,
      ));
    }

    final buffer = StringBuffer();

    for (final model in usecaseModels) {
      buffer.writeln('class ${model.name}Event extends ${blocName}Event{');
      if (model.inputs.isNotEmpty) {
        writeIO(buffer, model.inputs, '${model.name}Event');
      }
      buffer.writeln('}');

      buffer.writeln('class ${model.name}InProgressState extends ${blocName}State{}');

      if (model.extraStates.isNotEmpty) {
        for (var state in model.extraStates) {
          buffer.writeln("class ${state}State extends ${blocName}State{}");
        }
      }

      buffer.writeln('class ${model.name}CompletedState extends ${blocName}State{');
      if (model.outputs.isNotEmpty) {
        writeIO(buffer, model.outputs, '${model.name}CompletedState');
      }
      buffer.writeln('}');
      buffer.writeln('class ${model.name}FailedState extends ${blocName}State{}');
    }

    return buffer.toString();
  }

  void writeIO(StringBuffer buffer, Map<String, String> map, String constructorName) {
    for (var input in map.entries) {
      buffer.writeln('final ${input.value} ${input.key};');
    }
    buffer.writeln(constructorName);
    var fields = map.keys.map((e) => 'required this.$e').join(',');
    if (fields.isNotEmpty) {
      buffer.writeln('({$fields});');
    } else {
      buffer.writeln('();');
    }
  }
}
