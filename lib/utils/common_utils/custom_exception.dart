part of utils;
class CustomException implements Exception {
  String cause;
  CustomException(this.cause);
}