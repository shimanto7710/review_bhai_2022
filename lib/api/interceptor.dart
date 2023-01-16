import 'dart:async';
import 'package:dio/dio.dart';
import '../SharedPref/prefManager.dart';

class AppInterceptors extends Interceptor {
  @override
  FutureOr<dynamic> onRequest(RequestOptions options, RequestInterceptorHandler requestInterceptorHandler) async {
    return requestInterceptor(options);
  }

  static dynamic requestInterceptor(RequestOptions options) async {
    // Get your JWT token
    String token = '';
    SharedPrefManager sharedPrefManager = SharedPrefManager();
    token = await sharedPrefManager.getToken();
    // print("interceptor token " + token);
    // options.headers["Authorization"] = "Bearer " + token;
    return options;
  }

  @override
  FutureOr<dynamic> onError(DioError dioError, ErrorInterceptorHandler errorInterceptorHandler) {
    print("error "+dioError.error);
    print("error msg"+dioError.message);
    print("error msg"+dioError.response.toString());

    return dioError;
  }

  @override
  FutureOr<dynamic> onResponse(Response options, ResponseInterceptorHandler responseInterceptorHandler) async {
    /*if (options.headers.value("verifyToken") != null) {
      //if the header is present, then compare it with the Shared Prefs key
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var verifyToken = prefs.get("VerifyToken");

      // if the value is the same as the header, continue with the request
      if (options.headers.value("verifyToken") == verifyToken) {
        return options;
      }
    }*/
    return options;

    // return DioError(request: options.request, message: "User is no longer active", requestOptions: null);
  }
}