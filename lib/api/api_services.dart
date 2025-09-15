import 'package:dio/dio.dart';
import 'package:practise/models/user.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_services.g.dart';
@RestApi(baseUrl: "https://gorest.co.in/public/v2/")
abstract class ApiServices{
  factory ApiServices(Dio dio)=_ApiServices;
  @GET("users")
  Future<List<User>>getAllUsers();
  @GET("users/{id}")
  Future<User>geSingleUsers(@Path() int id);
  @POST("users")
  Future<User>createNewUsers(@Body()User user,
      @Header("Authorization")String token);

}