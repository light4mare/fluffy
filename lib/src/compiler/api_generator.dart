import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:mustache4dart2/mustache4dart2.dart';
import 'package:source_gen/source_gen.dart';

import 'api.dart';
import 'template/get.dart';

// https://www.jianshu.com/p/3b9992b84e60
// https://www.jianshu.com/p/aa6cc00cb76d
class ApiGenerator extends GeneratorForAnnotation<Api> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    var jsonMethod = annotation.read("method").stringValue;

    var paramBuffer = StringBuffer();
    var formBuffer = StringBuffer();
    var codeBuffer = StringBuffer();

    if (element is ClassElement) {
      codeBuffer.write("class ${element.name}Repo {\n");
      for (var method in element.methods) {
        paramBuffer.clear();
        formBuffer.clear();
        method.parameters.forEach((element) {
          if(paramBuffer.isNotEmpty) {
            formBuffer.write(', ');
            paramBuffer.write(', ');
          }
          formBuffer.write("\'${element.name}\': ${element.name}");
          paramBuffer.write(element.getDisplayString(withNullability: false));
        });

        for (var annotation in method.metadata) {
          var value = annotation.computeConstantValue();
          var annotationName = value.type.getDisplayString(withNullability: false);
          var reader = ConstantReader(value);
          var customJsonMethod = reader.peek("jsonMethod")?.stringValue;

          var template;
          if(annotationName == 'Get') {
            template = temple_get;
          } else {
            template = temple_post;
          }
          var result = render(template, <String, dynamic>{
            'methodName':method.name,
            'originParam': paramBuffer.toString(),
            'RspType':method.returnType.getDisplayString(withNullability: false),
            'jsonMethod':customJsonMethod ?? jsonMethod,
            'url':reader.peek("path").stringValue,
            'parameter': '{${formBuffer.toString()}}'
          }).toString();
          // print('2333333333333333 result: $result');

          codeBuffer.writeln(result);
        }
      }
    }

    codeBuffer.write("\n}");
    var result = codeBuffer.toString().replaceAll("&apos;", "\'");
    // print("2333333333333333 result: $result");
    return result;
  }
}
