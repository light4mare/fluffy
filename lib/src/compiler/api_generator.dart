import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:dio/dio.dart';
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
    // print("2333333333333 element.name  ${element.toString()} \n   element.displayName: ${element.displayName}    \n   element.declaration: ${element.enclosingElement}   ");
    // print("2333333333333 annotation info :${annotation.read("host").stringValue}");

    // var buffer = StringBuffer();

    // Dio().clear();
    // CancelToken();
    // if (element is ClassElement) {
    //   buffer.write("class ${element.name}Creator {\n");
    //   for (var method in element.methods) {
    //     method.parameters.forEach((element) {
    //       print("2333333333333 element: $element");
    //     });
    //
    //     for (var value in method.metadata) {
          // value.constantValue.toBoolValue(): ${value.constantValue.toBoolValue()}

          // buffer.write(method.returnType.toString());
          // buffer.write(" ${method.name}() {\nreturn ");
          // buffer.write(method.returnType.toString());
          // buffer.write(".");
          // buffer.write(annotation.peek("method").stringValue + "(null)");
          // buffer.write(";\n}");

          // var reader = ConstantReader(value.computeConstantValue());
          //
          // var result = render(temple_get, <String, dynamic>{
          //   'RspType':method.returnType.toString(),
          //   'jsonMethod':annotation.read("host").stringValue,
          //   'url':reader.peek("path").stringValue,
          //   'parameter': '''{
          //
          //   }'''
          // }).toString();
          //
          // buffer.write(result + "\n\n");




          // var element = value.element;
          //
          // ParsedLibraryResult parsedLibResult = element.session.getParsedLibraryByElement(element.library);
          //
          // ElementDeclarationResult elDeclarationResult = parsedLibResult.getElementDeclaration(element);

          // if(element is ConstructorElement){
          // }
          // var reader = ConstantReader(value.computeConstantValue());
          // print("23333333333 method.metadata value:  ${reader.peek("path").stringValue}  ");
        // }
        // print("233333333333 method.runtimeType ${method.runtimeType}");


        // method.returnType.element.accept(ApiElementVisitor());
        // var type = method.returnType;
        // // https://www.it1352.com/593422.html
        // print("2333333333333333 method.returnType ${type}");
        // if (type is InterfaceType) {
        //   for (var value in type.typeArguments) {
        //     print("2333333333333333 method.returnType ${value.toString()}");
        //   }
        // }
    //   }
    // }


    // buffer.write("\n}");
    // return buffer.toString();
    return '//添加一条注释111111111111111111123333333333333333333'; //这里因为测试，只自动生成了一个注释
  }
}
