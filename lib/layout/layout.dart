import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news__app/modules/search.dart';
import 'package:news__app/shared/BLOC/cubit.dart';
import 'package:news__app/shared/BLOC/states.dart';
import 'package:news__app/shared/components/components.dart';

class layout extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit=NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: Text("News"),
            actions: [
              IconButton(onPressed: (){
                navigateTo(context, Search());
              }, icon: Icon(Icons.search),),
              SizedBox(width: 10,),
              IconButton(onPressed: (){
                cubit.changeMode();
              }, icon: Icon(Icons.brightness_4_sharp),)
            ],),
            body: cubit.screens[cubit.currentindex],
            bottomNavigationBar: BottomNavigationBar(items: cubit.bottomItems,
            currentIndex: cubit.currentindex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);          
            },),
            //floatingActionButton: FloatingActionButton(onPressed: (){cubit.GetScienceNews();}),
          );
        },
      );
    throw UnimplementedError();
  }
}
