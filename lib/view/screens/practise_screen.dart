import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practise/cubit/practise_cubit.dart';
import 'package:practise/cubit/practise_states.dart';
import 'package:practise/view/screens/user_detial_screen.dart';

import '../../di/di.dart';

class PractiseScreen extends StatelessWidget {
  const PractiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: BlocProvider(create: (context)=>
      getit<PractiseCubit>()..getAllUsers(),
      child:
      BlocBuilder<PractiseCubit,PractiseStates>(builder: (context,state){
        if(state is GetAllUsers){
          return ListView.separated(itemBuilder: (context,index){
            return
              ListTile(
               onTap: (){
                 final cubit = context.read<PractiseCubit>();
                 Navigator.push(context,
                     MaterialPageRoute(builder: (context)=>
                BlocProvider.value(value: cubit..
                getSingleUsers(state.users[index].id!),
                  child:
                  UserDetialScreen(user: state.users[index])
                  ,)));
               },
              leading:state.users[index].gender=="male"?Icon(Icons.male,color: Colors.teal,):
              Icon(Icons.female,color: Colors.teal,) ,
              title: Text(state.users[index].name!,style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,color: Colors.black
              ),),
              subtitle: Text(state.users[index].email!,style: TextStyle(
                color: Colors.grey,fontSize: 18.0
              ),),
            );
          },
              separatorBuilder: (context,index){
            return SizedBox(height: 16.0,);
              },itemCount: state.users.length);
        }
        return SizedBox.shrink();
      }),)
    );
  }
}
