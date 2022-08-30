
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news__app/layout/layout.dart';
import 'package:news__app/shared/BLOC/cubit.dart';
import 'package:news__app/shared/BLOC/states.dart';
import 'package:news__app/shared/network/local/cache_helper.dart';
import 'package:news__app/shared/network/remote/bloc_observer.dart';
import 'package:news__app/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () {},
    blocObserver: MyBlocObserver(),
  );
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark=CacheHelper.GetData(key: 'isDark');

  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  MyApp({
    this.isDark,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewsCubit()
          ..GetBusinessNews()..GetScienceNews()..GetSportsNews()
          ..changeMode(fromShared: isDark),
        child: BlocConsumer<NewsCubit, NewsStates>(
            builder: (context, state) {
              return MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                    appBarTheme: AppBarTheme(
                      titleSpacing: 20,
                      titleTextStyle: TextStyle(
                          color: Color.fromRGBO(46, 20, 117, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      elevation: 0,
                      backgroundColor: Colors.white,
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: Colors.white,
                          statusBarBrightness: Brightness.light),
                      iconTheme: IconThemeData(
                        color: Color.fromRGBO(46, 20, 117, 1),
                      ),
                    ),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                        elevation: 30,
                        unselectedItemColor: Color.fromARGB(255, 108, 108, 108),
                        selectedItemColor: Color.fromRGBO(46, 20, 117, 1),
                        type: BottomNavigationBarType.fixed),
                    textTheme: TextTheme(
                        bodyText1: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black))),


                darkTheme: ThemeData(
                    primarySwatch: Colors.blue,
                    scaffoldBackgroundColor: HexColor('737CA1'),
                    appBarTheme: AppBarTheme(
                      titleSpacing: 20,
                      titleTextStyle: TextStyle(
                          color: HexColor('1F1B24'),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      elevation: 0,
                      backgroundColor: HexColor('1F1B24'),
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: HexColor('1F1B24'),
                          statusBarBrightness: Brightness.light),
                      iconTheme: IconThemeData(
                        color: Color.fromARGB(255, 178, 160, 196),
                      ),
                    ),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                        backgroundColor: HexColor('1F1B24'),
                        elevation: 30,
                        unselectedItemColor: Color.fromARGB(255, 168, 170, 195),
                        selectedItemColor: Color.fromARGB(255, 106, 94, 149),
                        type: BottomNavigationBarType.fixed),
                    textTheme: TextTheme(
                        bodyText1: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: HexColor('1F1B24')))),
                themeMode: NewsCubit.get(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: layout(),
                debugShowCheckedModeBanner: false,
              );
            },
            listener: (context, state) {}));
  }
}
