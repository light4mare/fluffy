import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:fluffy/src/compiler/visitor/api_element_visitor.dart';
import 'package:source_gen/source_gen.dart';

import 'api.dart';
import 'visitor/api_type_visitor.dart';

// https://www.jianshu.com/p/3b9992b84e60
// https://www.jianshu.com/p/aa6cc00cb76d
class ApiGenerator extends GeneratorForAnnotation<Api>{
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    print("2333333333333 element.name  ${element.toString()} \n   element.displayName: ${element.displayName}    \n   element.declaration: ${element.enclosingElement}   ");
    var visitor = ApiTypeVisitor();
    if(element is ClassElement){
      for (var method in element.methods) {
        // method.returnType.element.accept(ApiElementVisitor());
        var type = method.returnType;
        // https://www.it1352.com/593422.html
        if(type is ParameterizedType) {
          print("2333333333333333 method.returnType ${type.typeArguments}");
        }
        print("2333333333333333 method.returnType ${method.returnType.runtimeType}");
      }
    }

    return '//添加一条注释111111111111111111123333333333333333333';//这里因为测试，只自动生成了一个注释
  }
}