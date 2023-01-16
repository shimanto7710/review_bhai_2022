import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_bhai_2022/ui/login/bloc/login_event.dart';
import 'package:review_bhai_2022/ui/login/bloc/login_state.dart';
import '../../../SharedPref/prefManager.dart';
import '../../../api/repo.dart';
import '../../confirm/confirm_pin.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late CollectionReference users;
  late Repo _repo;
  LoginBloc(BuildContext buildContext) : super(InitState()){
    _repo=Repo();
    // homeInit();

    users = FirebaseFirestore.instance.collection('user');
    on<SendOtpEvent>((event, emit) async{
      emit(LoadingState());
      var phone="+88"+event.phone;
      final token=await _repo.getTokenByPhoneNumber(phoneNumber: phone);
      SharedPrefManager sharedPrefManager = SharedPrefManager();
      sharedPrefManager.setPhone(phone);

      token.fold((l) {
        final response = Left(l);
        emit(OtpErrorState("Database Error"));
      }, (r) {
        final response = Right(r);
        sharedPrefManager.setToken(response.value);
        print(response.value);
        emit(InitState());
        _onClickLogin(phone, buildContext);
      });

      /*final isFound=isPhoneNumberRegisteredFirebase(event.phone);
      if(isFound==true){
        _onClickLogin(event.phone, buildContext);
      }else{
        saveProfileToFirebase(event.phone);
      }*/
    });

    // on<SendOtpEvent>((event, emit) => emit(LoadingState()));
    on<InitEvent>((event, emit) => emit(InitState()));
    on<ErrorEvent>((event, emit) => emit(OtpErrorState(event.msg)));

    homeInit();
  }


 /* @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is SendOtpEvent) {
      yield LoadingState();
      try {
        // final result = await _firebaseRepo.sendOtp(phoneNumber: "+8801744223515");

      } catch (_) {
        yield OtpErrorState("Error from server");
      }
    }
    if (event is InitEvent) {
      yield InitState();
    }
    if (event is ErrorEvent) {
      yield OtpErrorState(event.msg);
    }
  }*/



  void homeInit() {
    add(InitEvent());
  }

  _onClickLogin(String phoneNumber, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmPinScreen(
            phoneNumber: phoneNumber,
          ),
        ));
  }

  Future<void> saveProfileToFirebase(String phoneNumber) async{
    // Call the user's CollectionReference to add a new user
    await users
        .add({
          'phoneNumber': phoneNumber
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));

  }

  Future<bool> isPhoneNumberRegisteredFirebase(String phoneNumber) async {
    // Call the user's CollectionReference to add a new user

    /*await FirebaseFirestore.instance
        .collection('users')
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get()
        .then((value) =>
        print("User got "+value.docs[0]['name']))
        .catchError((error) => print("Failed to get user: $error"));*/


    QuerySnapshot<Map<String, dynamic>> snapshot =
    await FirebaseFirestore.instance.collection("users").where('phoneNumber', isEqualTo: phoneNumber).get();

    if(snapshot.docs.isEmpty){
      return false;
    }else{
      return true;
    }
    print(snapshot.docs[0]['name']);

  }

}
