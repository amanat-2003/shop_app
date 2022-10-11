class HttpException implements Exception {
  final String message;

  HttpException({this.message});

  @override
  String toString() {
    // return super.toString(); // Instance of 'Http Exception'
    return message;
  }
}
