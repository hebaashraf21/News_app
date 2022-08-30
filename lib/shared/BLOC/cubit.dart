import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news__app/modules/business_screen.dart';
import 'package:news__app/modules/science_screen.dart';
import 'package:news__app/modules/sports_screen.dart';
import 'package:news__app/shared/BLOC/states.dart';
import 'package:news__app/shared/network/local/cache_helper.dart';
import 'package:news__app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super(InitialState());

  static NewsCubit get(context)=>BlocProvider.of(context);

  int currentindex=0;

  List<Widget>screens=[ Business(),Sports(),Science(),];
  List<BottomNavigationBarItem>bottomItems=[
        BottomNavigationBarItem(icon: Icon(Icons.business),label:"Business"),
        BottomNavigationBarItem(icon: Icon(Icons.sports),label:"Sports"),
        BottomNavigationBarItem(icon: Icon(Icons.science),label:"Science"),
      ];

  List<dynamic>business=[];
  List<dynamic>sports=[];
  List<dynamic>science=[];  
  List<dynamic>search=[];

  bool isDark=false;  

  void changeMode( {bool? fromShared})
  {
    if(fromShared!=null)
    {
      isDark=fromShared;
      emit(changeModeState());
    }
    else{

      isDark=!isDark;
      CacheHelper.SetData(key: 'isDark',value: isDark).then((value) {
      emit(changeModeState());
      
    });
    }
    
    
    
    
  }

  void changeBottomNavBar(index)
  {
    currentindex=index;
    emit(NavbarState());
  }

  void GetBusinessNews()
  {
     emit(GetBusinessLoadingState());
    DioHelper.getdata(
      url:'v2/top-headlines',
    query:  {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'a13725eb0d4946c58ebdbf6d44d647f8',
      },
    ).then((value) {
      emit(GetBusinessSucessState());
      business=value.data['articles'];
      //print(business);
      

    }).catchError((
      err
    ){
      emit(GetBusinessErrorState(err.toString()));
    });
  }

  void GetSportsNews()
  {
     emit(GetSportsLoadingState());
    DioHelper.getdata(
      url:'v2/top-headlines',
    query:  {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'a13725eb0d4946c58ebdbf6d44d647f8',
      },
    ).then((value) {
      emit(GetSportsSucessState());
      sports=value.data['articles'];
      print(sports);
      

    }).catchError((
      err
    ){
      emit(GetSportsErrorState(err.toString()));
    });
  }

  void GetScienceNews()
  {
     emit(GetScienceLoadingState());
    DioHelper.getdata(
      url:'v2/top-headlines',
    query:  {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'a13725eb0d4946c58ebdbf6d44d647f8',
      },
    ).then((value) {
      emit(GetScienceSucessState());
      science=value.data['articles'];
      print(science);
      

    }).catchError((
      err
    ){
      emit(GetScienceErrorState(err.toString()));
    });
  }

  void GetSearch(String val)
  {
     emit(GetSearchLoadingState());
    DioHelper.getdata(
      url:'v2/everything',
    query:  {
        'q': '$val',   
        'apiKey': 'a13725eb0d4946c58ebdbf6d44d647f8',
      },
    ).then((value) {
      emit(GetSearchSucessState());
      search=value.data['articles'];
      print(search);
      

    }).catchError((
      err
    ){
      emit(GetSearchErrorState(err.toString()));
    });
  }



}