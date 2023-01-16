import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../../SharedPref/prefManager.dart';
import '../interceptor.dart';

// import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:alice/alice.dart';

mixin DioHelper {
  static Dio? _dio;
  static late Alice alice;

  // static DioCacheManager? _manager;

  static const Duration maxApiCacheAge = Duration(hours: 1);
  static const Duration maxApiStaleAge = Duration(hours: 3);

  static Future<Options> getDefaultOptions(
      {bool isCacheEnabled = true,
      Duration cacheDuration = maxApiCacheAge,
      Duration staleDuration = maxApiStaleAge}) async {
    String token = '';
    SharedPrefManager sharedPrefManager = SharedPrefManager();
    token = await sharedPrefManager.getToken();

    final Options apiOptions = Options(
      headers: <String, dynamic>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + token
      },
    );
/*    if (isCacheEnabled) {
      final Options cacheOptions = buildCacheOptions(cacheDuration,
          maxStale: staleDuration,
          options: apiOptions,
          forceRefresh: forceRefresh);
      return cacheOptions;
    }*/

    return apiOptions;
  }

  // set proxy
  /*static DefaultHttpClientAdapter _getHttpClientAdapter() {
    DefaultHttpClientAdapter httpClientAdapter;
    httpClientAdapter = DefaultHttpClientAdapter();
    httpClientAdapter.onHttpClientCreate = (HttpClient client) {
      client.findProxy = (uri) {
        return 'PROXY 10.0.2.2:44300';
      };
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };
    return httpClientAdapter;
  }*/

  static Dio getDio({required String baseUrl}) {
    _dio ??= Dio(BaseOptions(
        contentType: 'application/json; charset=utf-8',
        baseUrl: baseUrl,
        connectTimeout: 10 * 1000, // 10 seconds
        receiveTimeout: 10 * 1000 // 10 seconds
        ))
      // ..httpClientAdapter = _getHttpClientAdapter()
      // ..interceptors.add(getCacheManager().interceptor)
      // ..interceptors.add(AppInterceptors())

      ..interceptors.add(alice.getDioInterceptor())
      ..interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
      ));

    /*String token = '';
    SharedPrefManager sharedPrefManager = SharedPrefManager();
    token = await sharedPrefManager.getToken();
    print("interceptor token " + token);
    _dio?.options.headers["Authorization"] = "Bearer " + token;*/

    (_dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return _dio!;
  }

/*  static DioCacheManager getCacheManager() {
    _manager ??= DioCacheManager(CacheConfig(
      defaultMaxAge: const Duration(hours: 1),
      defaultMaxStale: const Duration(days: 1),
      maxMemoryCacheCount: 25,
    ));
    return _manager!;
  }*/

// // set proxy
// static DefaultHttpClientAdapter _getHttpClientAdapter() {
//   DefaultHttpClientAdapter httpClientAdapter;
//   httpClientAdapter = DefaultHttpClientAdapter();
//   httpClientAdapter.onHttpClientCreate = (HttpClient client) {
//     client.findProxy = (uri) {
//       return 'PROXY 192.168.0.102:8081';
//     };
//     client.badCertificateCallback =
//         (X509Certificate cert, String host, int port) {
//       return true;
//     };
//   };
//   return httpClientAdapter;
// }
}
