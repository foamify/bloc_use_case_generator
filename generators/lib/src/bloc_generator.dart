import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';

import 'class_name_visitor.dart';

class BlocGenerator extends GeneratorForAnnotation<BlocStateAnnotation> {
  @override
  String generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    final blocName = element.name.replaceFirst('Bloc', '');

    final options = annotation
        .read('options')
        .listValue
        .map((e) => Option(
              name: e.getField('name').toStringValue(),
              inputType: e.getField('inputType').toTypeValue().runtimeType
           
            ))
        .toList();
    final baseEventType = annotation.read('baseEventType').typeValue;
    final baseStateType = annotation.read('baseStateType').typeValue;

    final buffer = StringBuffer();

    for (final option in options) {
      buffer.writeln('class ${option.name}Event extends ${blocName}Event{}');
      buffer.writeln('class ${option.name}InProgressState extends ${blocName}State{}');
      buffer.writeln('class ${option.name}CompletedState extends ${blocName}State{}');
      buffer.writeln('class ${option.name}FailedState extends ${blocName}State{}');
    }

    return buffer.toString();
  }
}
