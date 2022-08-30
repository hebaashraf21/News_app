import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news__app/shared/BLOC/cubit.dart';
import 'package:news__app/shared/BLOC/states.dart';
import 'package:news__app/shared/components/components.dart';

class Search extends StatelessWidget
{
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      builder: (context,state){
        var list=NewsCubit.get(context).search;
       return  Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(20),
          child: TextFormField(
            controller: searchController,
            keyboardType: TextInputType.text,
            validator: (value) {
              if(value!.isEmpty)
              {
                print("Please type your search key word");

              }
            },
           decoration: InputDecoration(
            fillColor: Color.fromARGB(255, 135, 140, 142),
            label: Text("Search"),
            prefixIcon: Icon(Icons.search),
            border: const OutlineInputBorder(),
            labelStyle: TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
           ),
           onChanged: ((value) {

            NewsCubit.get(context).GetSearch(value);
             
           }),
            

          ),),

          Expanded(child: articles(list, context,isSearch: true))
        ],
      ),
    );
      },
       listener: (context,state){});
    throw UnimplementedError();
  }

}