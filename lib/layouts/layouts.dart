import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/medules/prMedules/searcheScreen.dart';
import 'package:online_store/shared/components/components.dart';
import 'package:online_store/shared/cubit/cubit.dart';
import 'package:online_store/shared/cubit/states.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Appcubit()..diogetdat(),
      child: BlocConsumer<Appcubit, States>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = Appcubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text(
                  'SEDNAWY',
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      navigatto(context, Search());
                    },
                    icon: Icon(Icons.search),
                  )
                ],
              ),
              body: cubit.bottomscreen(index: cubit.currentindex),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentindex,
                onTap: (index) {
                  cubit.bottomscreen(index: index);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category_outlined), label: 'Category'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'Favorites'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings'),
                ],
              ),
            );
          }),
    );
  }
}
