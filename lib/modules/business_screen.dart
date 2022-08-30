import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news__app/shared/BLOC/cubit.dart';
import 'package:news__app/shared/BLOC/states.dart';
import 'package:news__app/shared/components/components.dart';


class Business extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    var list=NewsCubit.get(context).business;

    return BlocConsumer<NewsCubit,NewsStates>(
      builder: (context, state) {
        return articles(list, context);
      },
      listener: (context,state){

      });
    
    throw UnimplementedError();
  }

}