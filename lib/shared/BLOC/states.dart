import 'package:flutter/cupertino.dart';

abstract class NewsStates{}

class InitialState extends NewsStates{}

class NavbarState extends NewsStates{}

class GetBusinessLoadingState extends NewsStates{}

class GetBusinessSucessState extends NewsStates{}

class GetBusinessErrorState extends NewsStates{

  String error;
  GetBusinessErrorState(this.error);
}

class GetSportsLoadingState extends NewsStates{}
class GetSportsSucessState extends NewsStates{}
class GetSportsErrorState extends NewsStates{
  String error;
  GetSportsErrorState(this.error);
}

class GetScienceLoadingState extends NewsStates{}
class GetScienceSucessState extends NewsStates{}
class GetScienceErrorState extends NewsStates{
  String error;
  GetScienceErrorState(this.error);
}

class GetSearchLoadingState extends NewsStates{}
class GetSearchSucessState extends NewsStates{}
class GetSearchErrorState extends NewsStates{
  String error;
  GetSearchErrorState(this.error);
}

class changeModeState extends NewsStates{}


