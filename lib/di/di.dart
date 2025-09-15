import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:practise/api/api_services.dart';
import 'package:practise/cubit/practise_cubit.dart';
import 'package:practise/repo/repo.dart';
final getit=GetIt.instance;
void setUp(){

  getit.registerLazySingleton<PractiseCubit>(()=>PractiseCubit(getit()));
  getit.registerLazySingleton<RepoServices>(()=>RepoServices(getit()));
  getit.registerLazySingleton<ApiServices>(()=>ApiServices(Dio()));

}
Dio createDio(){
  Dio dio=Dio();
  dio..options.connectTimeout=
      (1000 * 1) as Duration..options.receiveTimeout=(10*1000) as Duration?;
dio.interceptors.add(LogInterceptor(
  request: true,
  requestBody: true,
  requestHeader: true,
  error: true,
  responseBody: true,
  responseHeader: true
));
return dio;
}