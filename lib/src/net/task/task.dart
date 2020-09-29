abstract class NetTask<T> {
  Future<T> result();

  bool cancel();
}