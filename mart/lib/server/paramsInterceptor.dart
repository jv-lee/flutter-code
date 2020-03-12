import 'package:dio/dio.dart';

class ParamsInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    // options.headers.addEntries(newEntries)
    return super.onRequest(options);
  }

  @override
  Future onError(DioError err) {
    return super.onError(err);
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }
}
