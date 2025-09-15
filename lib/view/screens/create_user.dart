import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practise/cubit/practise_cubit.dart';
import 'package:practise/cubit/practise_states.dart';
import 'package:practise/di/di.dart';
import 'package:practise/models/user.dart';

class createUserScreen extends StatelessWidget {
  const createUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>getit<PractiseCubit>()..createNewUser(
        User( name: "mariam", email: "mariam6@gmail.com",
            gender: "female", status: "active"), "Bearer a22ac459796d1a824fe485aee3e8c401d1e5b30e2a64dea82b97775ecef86e98"),
      child: BlocBuilder<PractiseCubit,PractiseStates>
      (builder: (context,state){
      if(state is CreateNewUser){
      return       Scaffold(
        body: Column(
          children: [
Text(state.user.name!,style: TextStyle(
  fontWeight: FontWeight.bold,fontSize: 24.0,
  color: Colors.black

),),
            Text(state.user.email!,style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 24.0,
                color: Colors.black

            ),),
            Text(state.user.status!,style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 24.0,
                color: Colors.black

            ),),
            Text(state.user.gender!,style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 24.0,
                color: Colors.black

            ),),
          ],
        ),
      );
      }
      else{
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    }),);

  }
}
