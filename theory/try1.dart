void main() {
  var myFuture = Future(() {
    return 'Hello';
  });
  print("1");
  myFuture
      .then((result) {
        print(result);
        return result;
      })
      .catchError((error) {
        // ...
      })
      .then((value) => print("$value after first then"));
  print("2");
  print("2");
  print("2");
  print("2");
}
