Stream<int> StreamGenerator(int count) async* {
  for (var i = 0; i <= count; i++) {
    await Future.delayed(const Duration(seconds: 2));
    yield i;
  }
}

StreamFunc() {
  Stream<int> stream = StreamGenerator(10);
  stream.listen((data) {
    print('Num right now: ${data.toString()}');
  });
}
