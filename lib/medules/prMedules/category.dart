import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/medules/mainMedules/categoryWidget.dart';
import 'package:online_store/shared/components/components.dart';
import 'package:online_store/shared/cubit/cubit.dart';
import 'package:online_store/shared/cubit/states.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Appcubit(),
      child: BlocConsumer<Appcubit, States>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = Appcubit.get(context);
            return ListView.separated(
                itemBuilder: (context, index) =>
                    buildCatItem(cat[index], context),
                separatorBuilder: (context, index) => devider(),
                itemCount: cat.length);
          }),
    );
  }

  Widget buildCatItem(cat, context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              numberofCat = cat['id'];
              nameofCat = cat['name'];
              //print(numberofCat);
            });
            navigatto(context, CatItemScreen());
          },
          child: Row(
            children: [
              Image(
                image: NetworkImage('${cat['image']}'),
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 20,
              ),
              FittedBox(
                child: Text(
                  '${cat['name']}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textScaleFactor: 0.9,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
              ),
            ],
          ),
        ),
      );
}
