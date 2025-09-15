import 'package:practise/models/user.dart';

abstract class PractiseStates{}
class PractiseInitial extends PractiseStates{}
class GetAllUsers extends PractiseStates{
  List<User>users;
  GetAllUsers(this.users);
}
class GetSingleUsers extends PractiseStates{
  User user;
  GetSingleUsers(this.user);
}
class CreateNewUser extends PractiseStates{
  User user;
  CreateNewUser(this.user);
}