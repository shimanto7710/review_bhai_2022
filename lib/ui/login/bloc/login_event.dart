import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class InitEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}

class ErrorEvent extends LoginEvent {
  String msg;
  ErrorEvent({required this.msg});

  @override
  List<Object> get props => [];
}

class SendOtpEvent extends LoginEvent {
  String phone;
  SendOtpEvent({required this.phone});

  @override
  List<Object> get props => [];
}
