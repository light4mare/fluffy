import 'package:analyzer/dart/element/element.dart';

class ApiElementVisitor extends ElementVisitor {
  @override
  visitClassElement(ClassElement element) {
    print("****************** visitClassElement $element");
  }

  @override
  visitCompilationUnitElement(CompilationUnitElement element) {
    // TODO: implement visitCompilationUnitElement
    throw UnimplementedError();
  }

  @override
  visitConstructorElement(ConstructorElement element) {
    // TODO: implement visitConstructorElement
    throw UnimplementedError();
  }

  @override
  visitExportElement(ExportElement element) {
    // TODO: implement visitExportElement
    throw UnimplementedError();
  }

  @override
  visitExtensionElement(ExtensionElement element) {
    // TODO: implement visitExtensionElement
    throw UnimplementedError();
  }

  @override
  visitFieldElement(FieldElement element) {
    // TODO: implement visitFieldElement
    throw UnimplementedError();
  }

  @override
  visitFieldFormalParameterElement(FieldFormalParameterElement element) {
    // TODO: implement visitFieldFormalParameterElement
    throw UnimplementedError();
  }

  @override
  visitFunctionElement(FunctionElement element) {
    // TODO: implement visitFunctionElement
    throw UnimplementedError();
  }

  @override
  visitFunctionTypeAliasElement(FunctionTypeAliasElement element) {
    // TODO: implement visitFunctionTypeAliasElement
    throw UnimplementedError();
  }

  @override
  visitGenericFunctionTypeElement(GenericFunctionTypeElement element) {
    // TODO: implement visitGenericFunctionTypeElement
    throw UnimplementedError();
  }

  @override
  visitImportElement(ImportElement element) {
    // TODO: implement visitImportElement
    throw UnimplementedError();
  }

  @override
  visitLabelElement(LabelElement element) {
    // TODO: implement visitLabelElement
    throw UnimplementedError();
  }

  @override
  visitLibraryElement(LibraryElement element) {
    // TODO: implement visitLibraryElement
    throw UnimplementedError();
  }

  @override
  visitLocalVariableElement(LocalVariableElement element) {
    print("****************** visitLocalVariableElement $element");
  }

  @override
  visitMethodElement(MethodElement element) {
    // TODO: implement visitMethodElement
    throw UnimplementedError();
  }

  @override
  visitMultiplyDefinedElement(MultiplyDefinedElement element) {
    // TODO: implement visitMultiplyDefinedElement
    throw UnimplementedError();
  }

  @override
  visitParameterElement(ParameterElement element) {
    // TODO: implement visitParameterElement
    throw UnimplementedError();
  }

  @override
  visitPrefixElement(PrefixElement element) {
    // TODO: implement visitPrefixElement
    throw UnimplementedError();
  }

  @override
  visitPropertyAccessorElement(PropertyAccessorElement element) {
    // TODO: implement visitPropertyAccessorElement
    throw UnimplementedError();
  }

  @override
  visitTopLevelVariableElement(TopLevelVariableElement element) {
    // TODO: implement visitTopLevelVariableElement
    throw UnimplementedError();
  }

  @override
  visitTypeParameterElement(TypeParameterElement element) {
    print("****************** visitTypeParameterElement $element");
  }
}