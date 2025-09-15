import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practise/cubit/practise_states.dart';
import 'package:practise/models/user.dart';
import 'package:practise/repo/repo.dart';

class PractiseCubit extends Cubit<PractiseStates>{
  PractiseCubit(this._repoServices):super(PractiseInitial());
  RepoServices _repoServices;
  Future <void> getAllUsers()async{
   final data=await _repoServices.getAllUsers();
   emit(GetAllUsers(data));
  }
  Future <void> getSingleUsers(int id)async{
    final data=await _repoServices.getSingleUsers(id);
    emit(GetSingleUsers(data));
  }
  Future <void> createNewUser(User user,String token)async{
    final data=await _repoServices.createNewUser(user, token);
    emit(CreateNewUser(data));
  }
}