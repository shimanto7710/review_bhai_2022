import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../SharedPref/prefManager.dart';
import '../../api/model/request_body/UserDetailRequestBody.dart';
import '../../api/repo.dart';
import '../home_screen/home_screen.dart';

class UserDetailState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoadingState extends UserDetailState {}

class InitState extends UserDetailState {}

class LoadedState extends UserDetailState {}

class ErrorState extends UserDetailState {
  String msg;

  ErrorState(this.msg);
}

// class OtpSentState extends ConfirmState {}

//---------------------------------------------------  event

class UserDetailEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class InitEvent extends UserDetailEvent {
  @override
  List<Object> get props => [];
}

class ErrorEvent extends UserDetailEvent {
  String msg;

  ErrorEvent({required this.msg});

  @override
  List<Object> get props => [];
}

class SubmitDataEvent extends UserDetailEvent {
  UserDetailRequestBody userBody;
  String id;

  SubmitDataEvent({required this.userBody, required this.id});

  @override
  List<Object> get props => [];
}

//----------------------------------------------------------------------- bloc

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  late Repo _repo;

  UserDetailBloc(BuildContext buildContext) : super(InitState()) {
    // homeInit();
    _repo = Repo();

    on<SubmitDataEvent>((event, emit) async {
      // LoadingState();
      emit(LoadingState());

      final response = await _repo.updateUserDetails(
          id: event.id, requestBody: event.userBody);
      response.fold((l) {
        // final response = Left(l);
        print("error");
        emit(ErrorState("Database Error"));
      }, (r) async {
        final response = Right(r);
        bool userModel = response.value;
        if (userModel) {
          print("updated");
          SharedPrefManager sharedPrefManager = SharedPrefManager();
          await sharedPrefManager.setIsCompletedInfo(true);
          await sharedPrefManager.setIsLoggedIn(true);
          emit(InitState());
          _onClickHome(buildContext);
        } else {
          print("false update");
          emit(ErrorState("Database Error"));
        }
        emit(InitState());
        // _onClickLogin(event.phone, buildContext);
      });
    });

    on<InitEvent>((event, emit) => emit(InitState()));
    on<ErrorEvent>((event, emit) => emit(ErrorState(event.msg)));

    homeInit();
  }

  _onClickHome(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
  }

  void homeInit() {
    add(InitEvent());
  }
}
