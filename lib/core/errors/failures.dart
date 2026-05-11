import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure(this.message);

  final String message;

  @override
  List<Object?> get props => <Object?>[message];
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message);
}
