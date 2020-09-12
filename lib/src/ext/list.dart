typedef FilterBlock<T> = bool Function(T it);

extension ListExtensioin on List {
  List<T> filter<T>(FilterBlock<T> block) {
    var result = List<T>();
    for (var value in this) {
      if (block(value)) {
        result.add(value);
      }
    }
    return result;
  }

  List<T> removeIf<T>(FilterBlock<T> block) {
    removeWhere(block);
    return this;
  }

  List<T> removeNull<T>() {
    removeWhere((value) => value == null);
    return this;
  }
}
