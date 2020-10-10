import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';

import 'api.dart';

class HttpGenerator extends GeneratorForAnnotation<Api>{
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    return "var ss = 233;";
  }

}