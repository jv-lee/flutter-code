import 'package:dio/dio.dart';

var server = Server();

class Server {
  //私有构造函数
  Server._internal();

  //保存单例
  static Server _singleton = new Server._internal();

  //工厂构造函数
  factory Server() => _singleton;

  Dio dio;

  init() {
    dio = Dio();
    dio.options.headers = {"versionCode": "3", "macAddress": "xxxxxx"};
    dio.options.baseUrl = "http://120.79.153.144:8180";
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    //添加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      options.headers['token'] = '';
      print(
          'send request:path:${options.path}, baseURL:${options.baseUrl},data:${options.data},queryParameters:${options.queryParameters}');
      return options;
    }, onResponse: (Response response) async {
      print('receiver result:${response.data}');
      return response;
    }, onError: (DioError e) async {
      print('error -> ${e.error.toString()}');
      return e;
    }));
  }
}
