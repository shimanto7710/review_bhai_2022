import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:review_bhai_2022/SharedPref/prefManager.dart';
import 'package:review_bhai_2022/api/api_interface.dart';
import 'package:review_bhai_2022/api/dio/default_response.dart';
import 'package:review_bhai_2022/api/model/request_body/UserDetailRequestBody.dart';
import 'package:review_bhai_2022/api/model/review_model.dart';
import 'package:review_bhai_2022/core/glitch.dart';

import 'model/UserModel.dart';

class FirebaseService implements ApInterface {
  @override
  Future<Either<Glitch, UserModel>> authByPhoneNumber({phoneNumber}) async {
    UserModel? userModel;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection("users")
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();

    if (snapshot.docs.isEmpty) {
      int badgeId = -1;
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection("badges").get();

      if (snapshot.docs.isEmpty) {
      } else {
        badgeId = snapshot.docs[0]['id'];
      }

      print("user not found");
      await users.add({
        'phoneNumber': phoneNumber,
        'name': "",
        'email': "",
        'sex': 0,
        'userType': 0,
        'dp': "",
        'budgeId': badgeId,
        'point': 0,
      }).then((value) async {
        QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
            .instance
            .collection("users")
            .where('phoneNumber', isEqualTo: phoneNumber)
            .get();
        if (snapshot.docs.isEmpty) {
          print("user not added");
          return Left<Glitch, UserModel>(FirebaseError());
        } else {
          print("user found ");
          userModel = UserModel(
              id: -100,
              phoneNumber: snapshot.docs[0]['phoneNumber'],
              badge: null,
              badgeId: snapshot.docs[0]['budgeId'],
              dp: snapshot.docs[0]['dp'],
              email: snapshot.docs[0]['email'],
              createdAt: null,
              firebaseKey: "",
              isFirstTime: 1,
              name: snapshot.docs[0]['name'],
              point: snapshot.docs[0]['point'],
              restaurantModel: null,
              sex: snapshot.docs[0]['sex'],
              userType: snapshot.docs[0]['userType']);

          final ref = FirebaseFirestore.instance
              .collection('users')
              .where('phoneNumber', isEqualTo: snapshot.docs[0]['phoneNumber'])
              .get()
              .then((value) {
            value.docs.forEach((element) {
              print(element.id);
              SharedPrefManager sharedPrefManager = SharedPrefManager();
              sharedPrefManager.setUserId(element.id);
            });
          });
          // print(userModel.toString());
          return Right<Glitch, UserModel>(userModel!);
          return Left<Glitch, UserModel>(FirebaseError());
        }
      }).catchError((error) {
        print(error.toString());
        return Left<Glitch, UserModel>(FirebaseError());
      });
    } else {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection("users")
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();
      if (snapshot.docs.isEmpty) {
        print("user not found 2");
        return Left<Glitch, UserModel>(FirebaseError());
      } else {
        print("user found 2");
        userModel = UserModel(
            id: -100,
            phoneNumber: snapshot.docs[0]['phoneNumber'],
            badge: null,
            badgeId: snapshot.docs[0]['budgeId'],
            dp: snapshot.docs[0]['dp'],
            email: snapshot.docs[0]['email'],
            createdAt: null,
            firebaseKey: "",
            isFirstTime: 1,
            name: snapshot.docs[0]['name'],
            point: snapshot.docs[0]['point'],
            restaurantModel: null,
            sex: snapshot.docs[0]['sex'],
            userType: snapshot.docs[0]['userType']);

        final ref = FirebaseFirestore.instance
            .collection('users')
            .where('phoneNumber', isEqualTo: snapshot.docs[0]['phoneNumber'])
            .get()
            .then((value) {
          value.docs.forEach((element) {
            print(element.id);
            SharedPrefManager sharedPrefManager = SharedPrefManager();
            sharedPrefManager.setUserId(element.id);
          });
        });
        // print(userModel.toString());
        return Right<Glitch, UserModel>(userModel);
        return Left<Glitch, UserModel>(FirebaseError());
      }
    }

    if (userModel != null) {
      return Right<Glitch, UserModel>(userModel!);
    } else {
      return Left<Glitch, UserModel>(FirebaseError());
    }
    // return Left<Glitch, UserModel>(FirebaseError());
  }

  @override
  Future<Either<Glitch, String>> getTokenByPhoneNumber({phoneNumber}) async {
    return const Right<Glitch, String>("token");
  }

  @override
  Future tet({phoneNumber}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection("users")
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();

    if (snapshot.docs.isEmpty) {
      print(snapshot.docs);
      return false;
    } else {
      print(snapshot.docs);
      return true;
    }
  }

  @override
  Future<Either<Glitch, bool>> updateUserDetails(
      {required String id, required UserDetailRequestBody requestBody}) async {
    try {
      final ref = FirebaseFirestore.instance
          .collection('users')
          .where('phoneNumber', isEqualTo: requestBody.phoneNumber)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          print(element.id);
          var collection = FirebaseFirestore.instance.collection('users');
          collection.doc(element.id).update({
            'email': '${requestBody.email}',
            'name': '${requestBody.name}',
            'sex': requestBody.sex,
            'userType': requestBody.userType,
            'dp': element.id,
          });
        });
      });
      return const Right(true);
    } catch (error, stacktrace) {
      // _runHttpInspector();
      print("user detail error no internet glitch");
      print(error);
      print(stacktrace);
      return Left(NoInternetGlitch());
    }
  }

  @override
  Future<Either<Glitch, List<ReviewModel>>> getReviewList() {
    // TODO: implement getReviewList
    throw UnimplementedError();
  }

// final FirebaseAuth _firebaseAuth;

// DatabaseReference _databaseReference;

// FirebaseService(this._firebaseAuth);

/*Future<Either<dynamic, UserCredential>> signIn(
      {String email, String password}) async {
    try {
      // addUser();
      // getUserData();
      // addUserById(UserModel(2,"asd"));

      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      // print(e.code);
      return Left(e.code);
    }
  }*/

/*Future<OtpResponse> sendOtp({String phoneNumber}) async {
    print("sendOtp");

    await _firebaseAuth.verifyPhoneNumber(
      timeout: Duration(seconds: 60),
      phoneNumber: '+8801686352645',
      verificationCompleted: (PhoneAuthCredential credential) {
        print("verification completed");

      },
      verificationFailed: (FirebaseAuthException e) {
        print("verification failed " + e.toString());

      },
      codeSent: (String verificationId, int resendToken) {
        OtpResponse otpResponse = OtpResponse(verificationId, resendToken);
        print("verification code sent");

      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("verification timeout");

      },
    );
  }*/

/*Future<void> _submitPhoneNumber() async {
    print("_submitPhoneNumber");

    /// NOTE: Either append your phone number country code or add in the code itself
    /// Since I'm in India we use "+91 " as prefix `phoneNumber`
    String phoneNumber = "+8801686352645";
    print(phoneNumber);

    /// The below functions are the callbacks, separated so as to make code more readable
    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');
    }

    void verificationFailed(FirebaseAuthException error) {
      print("error");
      print(error);
    }

    void codeSent(String verificationId, [int code]) {
      print('codeSent');
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout');
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      /// Make sure to prefix with your country code
      phoneNumber: phoneNumber,

      /// `seconds` didn't work. The underlying implementation code only reads in `milliseconds`
      timeout: Duration(milliseconds: 10000),

      /// If the SIM (with phoneNumber) is in the current device this function is called.
      /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
      verificationCompleted: verificationCompleted,

      /// Called when the verification is failed
      verificationFailed: verificationFailed,

      /// This is called after the OTP is sent. Gives a `verificationId` and `code`
      codeSent: codeSent,

      /// After automatic code retrival `tmeout` this function is called
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    ); // All the callbacks are above
  }*/
}
