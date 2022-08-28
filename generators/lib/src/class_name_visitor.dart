import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/element.dart';

class ClassNameVisitor extends SimpleElementVisitor<dynamic> {
  String? blocName;

  @override
  dynamic visitClassElement(ClassElement element) {
    final type = element.runtimeType.toString();

    print(element.runtimeType);

    blocName = type.replaceFirst('Bloc', '');

    return super.visitClassElement(element);
  }
}
