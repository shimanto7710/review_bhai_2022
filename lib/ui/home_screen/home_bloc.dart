import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_bhai_2022/api/model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../SharedPref/prefManager.dart';
import '../../api/dio/dio_helper.dart';
import '../../api/model/review_model.dart';
import '../../api/repo.dart';
import '../user_details/user_details_screen.dart';

class HomeState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoadingState extends HomeState {}



class LoadedState extends HomeState{
  List<ReviewModel> reviews;
  LoadedState(this.reviews);
}

class InitState extends HomeState {}

class ErrorState extends HomeState {
  String msg;
  ErrorState(this.msg);
}

// class OtpSentState extends HomeState {}

//---------------------------------------------------  event

class HomeEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class InitEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class LoadingEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class ErrorEvent extends HomeEvent {
  String msg;

  ErrorEvent({required this.msg});

  @override
  List<Object> get props => [];
}

//----------------------------------------------------------------------- bloc

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late Repo _repo;

  HomeBloc(BuildContext buildContext) : super(InitState()) {
    // homeInit();
    _repo = Repo();

    on<LoadingEvent>((event, emit) async {
      // LoadingState();
      // emit(LoadingState());
      await restoreToken();

      final response = await _repo.getReviewList();
      response.fold((l) {
        // final response = Left(l);
        print("error");
        emit(ErrorState("Database Error"));
      }, (r) async {
        final response = Right(r);
        final reviewList = response.value;
        emit(LoadedState(reviewList));
        // _onClickLogin(event.phone, buildContext);
      });


      // DioHelper.alice.showInspector();
    });

    on<InitEvent>((event, emit) => emit(InitState()));
    on<ErrorEvent>((event, emit) => emit(ErrorState(event.msg)));

    emit(LoadingState());
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
    add(LoadingEvent());
  }

  Future restoreToken() async{
    SharedPrefManager sharedPrefManager = SharedPrefManager();
    final phone=await sharedPrefManager.getPhone();
    final token=await _repo.getTokenByPhoneNumber(phoneNumber: phone);
    // SharedPrefManager sharedPrefManager = SharedPrefManager();

    token.fold((l) {
      final response = Left(l);

    }, (r) {
      final response = Right(r);
      sharedPrefManager.setToken(response.value);
      print(response.value);
    });
  }
}
