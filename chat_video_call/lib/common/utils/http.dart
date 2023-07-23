import 'package:chat_video_call/common/entities/error.dart';
import 'package:chat_video_call/common/store/user.dart';
import 'package:chat_video_call/common/values/cache.dart';
import 'package:chat_video_call/common/values/server.dart';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() => _instance;

  late Dio dio;

  CancelToken cancelToken = CancelToken();

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: const Duration(seconds: 10000),
      receiveTimeout: const Duration(seconds: 5000),
      headers: {},
      contentType: 'application/json; charset=uft-8',
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    //cookie management
    CookieJar cookieJar = CookieJar();

    dio.interceptors.add(CookieManager(cookieJar));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        //Do something before request is sent
        return handler.next(options);
      },
      onResponse: (response, handler) {
        //Do something with response data
        return handler.next(response);
      },
      onError: (DioException exception, handler) {
        //Do something with response error
        EasyLoading.dismiss();
        ErrorEntity errorEntity = createErrorEntity(exception);
        onError(errorEntity);
        return handler.next(exception);
      },
    ));
  }

  void onError(ErrorEntity errorEntity) {
    switch (errorEntity.code) {
      case 401:
        UserStore.to.onLogout();
        EasyLoading.showError(errorEntity.message!);
        break;
      default:
        EasyLoading.showError('unknown error');
        break;
    }
  }

  ErrorEntity createErrorEntity(DioException exception) {
    if (exception.type == DioExceptionType.cancel) {
      return ErrorEntity(code: -1, message: "cancel request");
    } else if (exception.type == DioExceptionType.connectionTimeout) {
      return ErrorEntity(code: -1, message: "connection Time out");
    } else if (exception.type == DioExceptionType.sendTimeout) {
      return ErrorEntity(code: -1, message: "request Time out");
    } else if (exception.type == DioExceptionType.badResponse) {
      return ErrorEntity(code: -1, message: "bad response");
    }
    return ErrorEntity(code: -1, message: "Unknown");
  }

  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};

    if (Get.isRegistered<UserStore>() && UserStore.to.hasToken) {
      headers['Authorization'] = 'Bearer ${UserStore.to.token}';
    }
    return headers;
  }

  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool refresh = false,
    bool noCache = !CACHE_ENABLE,
    bool list = false,
    String cacheKey = '',
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.extra ??= <String, dynamic>{};
    requestOptions.extra!.addAll({
      "refresh": refresh,
      "noCache": noCache,
      "list": list,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });

    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();

    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );

    return response.data;
  }

  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();

    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );

    return response.data;
  }
}
