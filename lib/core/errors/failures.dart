abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure({
    required String message,
    this.statusCode,
  }) : super(message);
}
