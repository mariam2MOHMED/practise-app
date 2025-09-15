import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practise/cubit/practise_cubit.dart';
import 'package:practise/cubit/practise_states.dart';
import 'package:practise/models/user.dart';

class UserDetialScreen extends StatelessWidget {
   UserDetialScreen({required this.user});
User user;
  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<PractiseCubit,PractiseStates>(builder: (context,state){
if(state is GetSingleUsers){
  return Scaffold(
    body:        Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [
        Text(user.name!,style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,fontWeight: FontWeight.bold
        ),),
        Text(user.email!,style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,fontWeight: FontWeight.bold
        ),),
        Text(user.gender!,style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,fontWeight: FontWeight.bold
        ),),
      ],
    ),
  );
}
else{
  return CircularProgressIndicator();
}

    });
  }
}
