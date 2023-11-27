import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'favorite_api.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/posts")
  Future<List<dynamic>> getPosts();
}
