import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/layouts/initialPage.dart';
import 'package:online_store/medules/logineScreen.dart';
import 'package:online_store/shared/components/database.dart';
import 'package:online_store/shared/cubit/cubit.dart';
import 'package:online_store/shared/cubit/states.dart';
import 'package:online_store/shared/styles/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Appcubit(),
      child: BlocConsumer<Appcubit, States>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'online shop app',
              theme: ThemeData(
                primarySwatch: defaultcolor,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: defaultcolor,
                    unselectedItemColor: Colors.grey),
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          // color: Colors.grey[900]!,
                          )),
                ),
              ),
              home: InitialPage(),
              //home: Login(),
            );
          }),
    );
  }
}
