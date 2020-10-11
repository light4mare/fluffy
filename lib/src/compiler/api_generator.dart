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
    var paramBuffer = StringBuffer();
    var formBuffer = StringBuffer();
    var codeBuffer = StringBuffer();

    if (element is ClassElement) {
      codeBuffer.write("class ${element.name}Repo {\n");
      for (var method in element.methods) {
        paramBuffer.clear();
        formBuffer.clear();
        method.parameters.forEach((element) {
          print("2333333333333 element: $element");
          if(paramBuffer.isNotEmpty) {
            formBuffer.write(', ');
            paramBuffer.write(', ');
          }
          formBuffer.write("\'${element.name}\': ${element.name}");
          paramBuffer.write(element);
        });

        for (var value in method.metadata) {

          var reader = ConstantReader(value.computeConstantValue());

          var result = render(temple_get, <String, dynamic>{
            'methodName':method.name,
            'originParam': paramBuffer.toString(),
            'RspType':method.returnType.toString(),
            'jsonMethod':annotation.read("method").stringValue,
            'url':reader.peek("path").stringValue,
            'parameter': '{${formBuffer.toString()}}'
          }).toString();

          codeBuffer.write(result + "\n");
        }
      }
    }

    codeBuffer.write("\n}");
    var result = codeBuffer.toString().replaceAll("&apos;", "\'");
    return result;
  }
}
