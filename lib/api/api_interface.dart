
import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:review_bhai_2022/api/model/review_model.dart';
import '../core/glitch.dart';
import 'dio/default_response.dart';
import 'model/UserModel.dart';
import 'model/request_body/UserDetailRequestBody.dart';

abstract class ApInterface {
  // Future<Either<Glitch, String>> getTokenByPhoneNumber({@required phoneNumber});

  Future<Either<Glitch, String>> getTokenByPhoneNumber({@required phoneNumber});

  Future<Either<Glitch, UserModel>> authByPhoneNumber({@required phoneNumber});

  Future<Either<Glitch, bool>> updateUserDetails({required String id,required UserDetailRequestBody requestBody});

  Future<Either<Glitch, List<ReviewModel>>> getReviewList();
}