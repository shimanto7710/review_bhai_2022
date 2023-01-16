import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_bhai_2022/api/model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../SharedPref/prefManager.dart';
import '../../api/repo.dart';
import '../user_details/user_details_screen.dart';

class MainState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoadingState extends MainState {}

class LoadedState extends MainState {}

class InitState extends MainState {}

class ErrorState extends MainState {
  String msg;
  ErrorState(this.msg);
}

// class OtpSentState extends HomeState {}

//---------------------------------------------------  event

class MainEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class InitEvent extends MainEvent {
  @override
  List<Object> get props => [];
}

class LoadingEvent extends MainEvent {
  @override
  List<Object> get props => [];
}

class ErrorEvent extends MainEvent {
  String msg;

  ErrorEvent({required this.msg});

  @override
  List<Object> get props => [];
}

//----------------------------------------------------------------------- bloc

class MainBloc extends Bloc<MainEvent, MainState> {
  late Repo _repo;

  MainBloc(BuildContext buildContext) : super(InitState()) {
    // homeInit();
    _repo = Repo();

    on<LoadingEvent>((event, emit) async {
      // LoadingState();
      emit(LoadingState());

    });

    on<InitEvent>((event, emit) => emit(InitState()));
    on<ErrorEvent>((event, emit) => emit(ErrorState(event.msg)));

    homeInit();
  }

  _onClickLogin(String id, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserDetailsScreen(
            id: id,
          ),
        ));
  }

  void homeInit() {
    add(InitEvent());
  }
}
