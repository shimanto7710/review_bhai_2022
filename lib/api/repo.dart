
import 'package:dartz/dartz.dart';
import 'package:review_bhai_2022/api/api_interface.dart';
import 'package:review_bhai_2022/api/dio/default_response.dart';
import 'package:review_bhai_2022/api/model/request_body/UserDetailRequestBody.dart';
import 'package:review_bhai_2022/api/model/review_model.dart';
import 'package:review_bhai_2022/core/glitch.dart';
import 'api.dart';
import 'firebase_service.dart';
import 'model/UserModel.dart';

class Repo implements ApInterface{
  final api = Api();
  // final api = FirebaseService();
  @override
  Future<Either<Glitch, UserModel>> authByPhoneNumber({phoneNumber}) async{
    final apiResult = await api.authByPhoneNumber(phoneNumber: phoneNumber);
    return apiResult.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Glitch, String>> getTokenByPhoneNumber({phoneNumber}) async{
    final apiResult = await api.getTokenByPhoneNumber(phoneNumber: phoneNumber);
    return apiResult.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Glitch, bool>> updateUserDetails({required String id, required UserDetailRequestBody requestBody}) async{
    final apiResult = await api.updateUserDetails(id: id, requestBody: requestBody);
    return apiResult.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Glitch, List<ReviewModel>>> getReviewList() async{
    final apiResult = await api.getReviewList();
    return apiResult.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }


}