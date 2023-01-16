import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_bhai_2022/api/model/UserModel.dart';
import '../../SharedPref/prefManager.dart';
import '../../api/repo.dart';
import '../home_screen/home_screen.dart';
import '../user_details/user_details_screen.dart';

class ConfirmState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoadingState extends ConfirmState {}

class InitState extends ConfirmState {}

class ErrorState extends ConfirmState {
  String msg;

  ErrorState(this.msg);
}

// class OtpSentState extends ConfirmState {}

//---------------------------------------------------  event

class ConfirmEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class InitEvent extends ConfirmEvent {
  @override
  List<Object> get props => [];
}

class ErrorEvent extends ConfirmEvent {
  String msg;

  ErrorEvent({required this.msg});

  @override
  List<Object> get props => [];
}

class VerifyPinEvent extends ConfirmEvent {
  String pin;

  VerifyPinEvent({required this.pin});
}

/*class SendOtpEvent extends ConfirmEvent {
  @override
  List<Object> get props => [];
}*/

//----------------------------------------------------------------------- bloc

class ConfirmBloc extends Bloc<ConfirmEvent, ConfirmState> {
  late Repo _repo;

  ConfirmBloc(BuildContext buildContext) : super(InitState()) {
    // homeInit();
    _repo = Repo();

    on<VerifyPinEvent>((event, emit) async {
      // LoadingState();
      emit(LoadingState());
      SharedPrefManager sharedPrefManager = SharedPrefManager();
      final phoneNumber = await sharedPrefManager.getPhone();
      final response =
          await _repo.authByPhoneNumber(phoneNumber: phoneNumber.toString());
      response.fold((l) {
        // final response = Left(l);
        print("error");
        emit(ErrorState("Database Error"));
      }, (r) async{
        final response = Right(r);
        UserModel userModel = response.value;
        SharedPrefManager sharedPrefManager=SharedPrefManager();
        await sharedPrefManager.setIsLoggedIn(true);

        if (userModel.email != null) {
          if(userModel.email!.isNotEmpty){
            // main_screen
            _onClickHomeScreen(buildContext);
            await sharedPrefManager.setIsCompletedInfo(true);
          }else{
            // detail info
            await sharedPrefManager.setIsCompletedInfo(false);
            _onClickDetailScreen(userModel.id.toString(), buildContext);
          }
        } else {
          // detail
          await sharedPrefManager.setIsCompletedInfo(false);
          // await sharedPrefManager.setUserId(userModel.id);
          _onClickDetailScreen(userModel.id.toString(), buildContext);
        }
        emit(InitState());

      });
    });

    on<InitEvent>((event, emit) => emit(InitState()));
    on<ErrorEvent>((event, emit) => emit(ErrorState(event.msg)));

    homeInit();
  }

  _onClickDetailScreen(String id, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserDetailsScreen(
            id: id,
          ),
        ));
  }

  _onClickHomeScreen(BuildContext context) {
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
