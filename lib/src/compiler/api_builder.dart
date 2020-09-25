import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'api_generator.dart';

//code_generator 用于区别其它库
Builder codeGenerator(BuilderOptions options)=>
    SharedPartBuilder([ApiGenerator()], 'code_generator');