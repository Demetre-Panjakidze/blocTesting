Future<int> futureFunc(int passedVal) async {
  await Future.delayed(const Duration(seconds: 2));
  print(passedVal);
  return passedVal;
}
