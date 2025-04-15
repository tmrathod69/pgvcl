Stream<int> numberStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1)); // 1 second wait
    yield i; // emit number
  }
}

void main() {
 //listen stream
  numberStream().listen((value) {
    print("Received: $value");
  });
}
