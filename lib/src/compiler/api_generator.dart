import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';

import 'api.dart';

// https://www.jianshu.com/p/3b9992b84e60
class ApiGenerator extends GeneratorForAnnotation<Api>{
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    // print("2333333333333 element.name  ${element.toString()} \n   element.displayName: ${element.displayName}    \n   element.declaration: ${element.enclosingElement}   ");
    // if(element is ClassElement){
    //   for (var method in element.methods) {
    //     print("2333333333333333 method.returnType ${method}");
    //   }
    // }

    return '//添加一条注释111111111111111111123333333333333333333';//这里因为测试，只自动生成了一个注释
  }
}