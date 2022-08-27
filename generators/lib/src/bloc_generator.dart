import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';

import 'class_name_visitor.dart';

class BlocGenerator extends GeneratorForAnnotation<BlocStateAnnotation> {
  @override
  String generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    var blocName = element.name.replaceFirst('Bloc', '');

    var names = annotation.read('names').listValue.map((e) => e.toStringValue()).toList();
    
    final buffer = StringBuffer();

    for (final name in names) {
      buffer.writeln('class ${name}Event extends ${blocName}Event{}');
      buffer.writeln('class ${name}InProgressState extends ${blocName}State{}');
      buffer.writeln('class ${name}CompletedState extends ${blocName}State{}');
      buffer.writeln('class ${name}FailedState extends ${blocName}State{}');
    }

    return buffer.toString();
  }
}
