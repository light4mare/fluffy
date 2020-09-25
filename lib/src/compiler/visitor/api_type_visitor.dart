import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';

import 'api_element_visitor.dart';

class ApiTypeVisitor extends TypeVisitor{
  @override
  visitDynamicType(DynamicType type) {
    print("\n-------@@@@@@@@@--------- visitDynamicType type: $type");
    type.element.accept(ApiElementVisitor());
  }

  @override
  visitFunctionType(FunctionType type) {
    print("\n-------@@@@@@@@@--------- visitFunctionType type: $type");
    type.element.accept(ApiElementVisitor());
  }

  @override
  visitInterfaceType(InterfaceType type) {
    print("\n-------@@@@@@@@@--------- visitInterfaceType type: ${type.accessors}");
    type.element.accept(ApiElementVisitor());
  }

  @override
  visitNeverType(NeverType type) {
    print("\n-------@@@@@@@@@--------- visitNeverType type: $type");
    type.element.accept(ApiElementVisitor());
  }

  @override
  visitTypeParameterType(TypeParameterType type) {
    print("\n-------@@@@@@@@@--------- visitTypeParameterType type: $type");
    type.element.accept(ApiElementVisitor());
  }

  @override
  visitVoidType(VoidType type) {
    print("\n-------@@@@@@@@@--------- visitVoidType type: $type");
    type.element.accept(ApiElementVisitor());
  }
}