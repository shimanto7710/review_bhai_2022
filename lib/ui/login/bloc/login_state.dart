import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoadingState extends LoginState {}

class InitState extends LoginState {}

class OtpErrorState extends LoginState {
  String msg;

  OtpErrorState(this.msg);
}

class OtpSentState extends LoginState {}
