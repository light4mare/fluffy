import 'dart:convert';

void main() {
  var str = "Hello world";
  var bytes = utf8.encode(str);

  var encoded1 = base64Encode(bytes);

  print(encoded1);
  print(base64Decode(encoded1));
  print(String.fromCharCodes(base64Decode(encoded1)));
}