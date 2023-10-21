import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/shared/components/components.dart';
import 'package:online_store/shared/components/constans/constans.dart';
import 'package:online_store/shared/cubit/cubit.dart';
import 'package:online_store/shared/cubit/states.dart';
import 'package:online_store/shared/styles/colors.dart';

class Favorits extends StatelessWidget {
  const Favorits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Appcubit()..getfavorits(),
      child: BlocConsumer<Appcubit, States>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = Appcubit.get(context);
            return ConditionalBuilder(
              condition: true,
              builder: (context) => ListView.separated(
                itemBuilder: (context, index) =>
                    buildfavitem(context, favorits[index]),
                separatorBuilder: (context, index) => devider(),
                itemCount: favorits.length,
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
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
                      image: model['product']['image'] != null
                          ? NetworkImage('${model['product']['image']}')
                          : NetworkImage(
                              'https://th.bing.com/th/id/R.54092e0d8bbb210bda6eeb2f33e94b74?rik=xXxvRhcxsUoKyw&riu=http%3a%2f%2fmypresta.eu%2fcontent%2fuploads%2f2013%2f05%2floading.png&ehk=yJHyhRe1hfOE1a4auD8PJLD0jlYBWTP0zHn4D4uK9R0%3d&risl=&pid=ImgRaw&r=0',
                            ),
                      width: 120,
                      height: 120,
                    ),
                    if (model['product']['discount'] != 0)
                      Container(
                        color: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'DICOUNT',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
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
                      '${model['product']['name']}',
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
                          '${model['product']['price']} جنيه',
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
                        if (model['product']['discount'] != 0)
                          Text(
                            '${model['product']['old_price']}',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        Spacer(),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Appcubit.get(context)
                                .setfavorits(model['product']['id']);
                            //Appcubit.get(context).getproduct();
                            //Appcubit.get(context).getfavorits();
                          },
                          icon: CircleAvatar(
                            radius: 15,
                            // backgroundColor: defaultcolor,
                            backgroundColor:
                                favoritsbool[model['product']['id']] == true
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
