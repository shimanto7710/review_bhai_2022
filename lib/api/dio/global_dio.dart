import 'package:dio/dio.dart';

import 'dio_helper.dart';

final Dio dio = DioHelper.getDio(
    // baseUrl: "https://localhost:44300/"
    baseUrl: "https://10.0.2.2:44300"
);
