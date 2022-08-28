import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/generators/bloc_generator.dart';




Builder generateBloc(BuilderOptions options) {
  return SharedPartBuilder([BlocGenerator()], 'bloc_generator');
}
