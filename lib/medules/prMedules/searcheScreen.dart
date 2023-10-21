import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/shared/components/components.dart';
import 'package:online_store/shared/components/constans/constans.dart';
import 'package:online_store/shared/cubit/cubit.dart';
import 'package:online_store/shared/cubit/states.dart';
import 'package:online_store/shared/styles/colors.dart';

class Search extends StatelessWidget {
  var searchcontrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Appcubit(),
      child: BlocConsumer<Appcubit, States>(
          listener: (context, state) {},
          builder: (context, state) {
            dynamic data = {'text': searchcontrol.text};
            var cubit = Appcubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.black),
                title: Text(
                  'SEARCH',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: searchcontrol,
                      onChanged: (v) {
                        data = {'text': searchcontrol.text};
                        cubit.searchProduct(data);
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'SEARCH',
                          labelText: 'Search',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero)),
                    ),
                  ),
                  ConditionalBuilder(
                    condition: !cubit.searchload,
                    builder: (context) => Expanded(
                      child: ListView.separated(
                        //shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            buildfavitem(context, searchmodel[index]),
                        separatorBuilder: (context, index) => devider(),
                        itemCount: searchmodel.length,
                      ),
                    ),
                    fallback: (context) => Expanded(
                        child: Center(child: CircularProgressIndicator())),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget buildfavitem(context, model) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 120,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: 120,
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image(
                      image: model['image'] != null
                          ? NetworkImage('${model['image']}')
                          : NetworkImage(
                              'https://th.bing.com/th/id/R.54092e0d8bbb210bda6eeb2f33e94b74?rik=xXxvRhcxsUoKyw&riu=http%3a%2f%2fmypresta.eu%2fcontent%2fuploads%2f2013%2f05%2floading.png&ehk=yJHyhRe1hfOE1a4auD8PJLD0jlYBWTP0zHn4D4uK9R0%3d&risl=&pid=ImgRaw&r=0',
                            ),
                      width: 120,
                      height: 120,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model['name']}',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          '${model['price']}جنيه ',
                          style: TextStyle(
                            fontSize: 12,
                            color: defaultcolor,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Spacer(),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Appcubit.get(context).setfavorits(model['id']);
                            //Appcubit.get(context).getproduct();
                            //Appcubit.get(context).getfavorits();
                          },
                          icon: CircleAvatar(
                            radius: 15,
                            // backgroundColor: defaultcolor,
                            backgroundColor: favoritsbool[model['id']] == true
                                ? LovedColor
                                : Colors.grey,
                            child: Icon(
                              Icons.favorite_border,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
