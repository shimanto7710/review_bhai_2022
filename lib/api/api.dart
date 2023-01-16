import 'dart:convert';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:review_bhai_2022/api/model/UserModel.dart';
import 'package:review_bhai_2022/api/model/review_model.dart';
import 'package:review_bhai_2022/core/glitch.dart';
import '../SharedPref/prefManager.dart';
import 'api_interface.dart';
import 'constants.dart';
import 'dio/dio_helper.dart';
import 'dio/global_dio.dart' as global;
import 'dio/default_response.dart';
import 'interceptor.dart';
import 'model/request_body/UserDetailRequestBody.dart';

/*abstract class HomeApi {
  Future<Either<String, DefaultRes>> getTopicList({required bool forceRefresh});
}*/

class Api implements ApInterface {
  /*@override
  Future<Either<String, DefaultRes>> getTopicList(
      {required bool forceRefresh}) async {
    const String _url = 'topic_list.json';
    final Options options =
        await DioHelper.getDefaultOptions();
    try {
      final Response<dynamic> response =
          await global.dio.get(_url, options: options);
      final DefaultRes profileResponse = DefaultRes.fromJson(response.data);
      return Right<String, DefaultRes>(profileResponse);
    } catch (e) {
      print(e.toString());
      return Left<String, DefaultRes>(e.toString());
    }
  }*/

  // late DioClient dioClient;
  final String BASE_URL = "https://10.0.2.2:8000/";
  Api() {
    /*List<Interceptor> interceptors = [];

    interceptors.add(AppInterceptors());
    interceptors.add(CurlLoggerDioInterceptor());

    dioClient = DioClient(BASE_URL, interceptors: interceptors);*/
  }

  @override
  Future<Either<Glitch, UserModel>> authByPhoneNumber({phoneNumber}) async {
    const String _url = '/api/user/phone';
    final Options options = await DioHelper.getDefaultOptions();
    try {
      final Response<dynamic> response =
          await global.dio.post(_url, options: options, data: {"PhoneNumber": phoneNumber});
      UserModel userModel=UserModel.fromJson(response.data);
      SharedPrefManager sharedPrefManager=SharedPrefManager();
      sharedPrefManager.setUserId(userModel.id.toString());
      return Right<Glitch, UserModel>(userModel);
    } catch (e) {
      print(e.toString());
      return Left<Glitch, UserModel>(DioException());
    }
  }

  @override
  Future<Either<Glitch, String>> getTokenByPhoneNumber(
      {phoneNumber}) async {
    const String _url = '/api/login';

    try {
      final Options options = await DioHelper.getDefaultOptions();
      final Response<dynamic> response =
      await global.dio.post(_url, options: options, data: {"PhoneNumber": phoneNumber});
      return Right<Glitch, String>(response.data);

    }on DioError  catch (ex) {
      print("dio DioError " +ex.error);
      print("dio DioError " +ex.message);
      print("dio DioError " +ex.type.toString());
      return Left<Glitch, String>(DioException());
    }
  }

  @override
  Future<Either<Glitch, bool>> updateUserDetails({required String id, required UserDetailRequestBody requestBody}) async{
    try {
      UserDetailRequestBody userDetailResponse;

      final url = Uri.encodeFull('/api/update-user/$id');
      final Options options = await DioHelper.getDefaultOptions();
      Response response = await global.dio.put(url, options: options,data: requestBody.toJson());
      if(response.statusCode==200){
        _runHttpInspector();
        userDetailResponse=UserDetailRequestBody.fromJson(response.data);
        print("user info updated");
      }else if(response.statusCode==401){
        return Left(UnAuthorizeGlitch());
      }
      else {
        return Left(NoInternetGlitch());
      }
      return const Right(true);
    } catch (error, stacktrace) {
      _runHttpInspector();
      print("user detail error no internet glitch");
      print(error);
      print(stacktrace);
      return Left(NoInternetGlitch());
    }
  }

  void _runHttpInspector() {
    DioHelper.alice.showInspector();
  }

  @override
  Future<Either<Glitch, List<ReviewModel>>> getReviewList() async{
    const String _url = '/api/reviews';

    try {
      final Options options = await DioHelper.getDefaultOptions();
      final Response<dynamic> response =
          await global.dio.get(_url, options: options,);
      List<ReviewModel> list=[];
      list=((response.data as List)
          .map((x) => ReviewModel.fromJson(x))
          .toList());
      return Right<Glitch, List<ReviewModel>>(list);

    }on DioError  catch (ex) {
      print("dio DioError " +ex.error);
      print("dio DioError " +ex.message);
      print("dio DioError " +ex.type.toString());
      return Left<Glitch, List<ReviewModel>>(DioException());
    }
  }
}
