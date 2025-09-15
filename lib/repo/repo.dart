import 'package:practise/api/api_services.dart';
import 'package:practise/models/user.dart';

class RepoServices{
  final ApiServices _apiServices;
  RepoServices(this._apiServices);
  Future<List<User>>getAllUsers()async{
    var response=await _apiServices.getAllUsers();
    return response.map((user)=>User.fromJson(user.toJson())).toList();
  }
  Future<User>getSingleUsers(int id)async{
    var response=await _apiServices.geSingleUsers(id);
    return User.fromJson(response.toJson());
  }
  Future<User>createNewUser(User user,String token)async{
    var response=await _apiServices.createNewUsers(user, token);
    return response;
  }
}