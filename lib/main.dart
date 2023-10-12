Stream<int> boatStream() async* {
  for (int i = 1; i <= 10; i++) {
    print('Sent boat no. ${i.toString()}');
    await Future.delayed(const Duration(seconds: 2));
    yield i;
  }
}

void main() async {
  Stream<int> stream = boatStream();

  stream.listen((event) {
    print('Received boat no. ${event.toString()}');
  });
}
