extension AnyExtensioin on Object {
  cast<T>(func(T t)) {
    if (this is T) {
      func(this);
    }
  }
}

class Cast<T> {
  T it;

  call() {}
}
