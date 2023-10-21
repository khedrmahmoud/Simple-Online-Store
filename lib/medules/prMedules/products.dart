import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/medules/mainMedules/categoryWidget.dart';
import 'package:online_store/medules/mainMedules/sammaryTotalPrice.dart';
import 'package:online_store/shared/components/components.dart';
import 'package:online_store/shared/components/constans/constans.dart';
import 'package:online_store/shared/cubit/cubit.dart';
import 'package:online_store/shared/cubit/states.dart';
import 'package:online_store/shared/styles/colors.dart';

class Productssc extends StatefulWidget {
  const Productssc({Key? key}) : super(key: key);

  @override
  State<Productssc> createState() => _ProductsscState();
}

class _ProductsscState extends State<Productssc> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Appcubit()..getproduct(),
      child: BlocConsumer<Appcubit, States>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = Appcubit.get(context);
          String banner = 'banners';
          //cubit.diogetdat(banner);
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ConditionalBuilder(
                condition: !cubit.bannerload,
                builder: (context) => productBuilder(
                  context,
                ),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              ),
              if (salse.length > 0)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      navigatto(context, SammaryTotalPrice());
                    },
                    child: Icon(Icons.shopping_cart),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget productBuilder(context) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: images,
              options: CarouselOptions(
                height: 200,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                viewportFraction: 1.0,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Container(
                    height: 100,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          buildcategory(context, cat[index]),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                      itemCount: cat.length,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'New Products',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 1.58,
                children: List.generate(product.length,
                    (index) => buildGrid(product[index], context)),
              ),
            ),
          ],
        ),
      );

  Widget buildcategory(context, model) => GestureDetector(
        onTap: () {
          setState(() {
            numberofCat = model['id'];
            nameofCat = model['name'];
            //print(numberofCat);
          });
          navigatto(context, CatItemScreen());
        },
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image(
              image: model['image'] != null
                  ? NetworkImage('${model['image']}')
                  : NetworkImage(
                      'https://th.bing.com/th/id/R.cc57fccc11df5702df7f196b338dba1a?rik=2jhE9uelCkdeOQ&pid=ImgRaw&r=0'),
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black.withOpacity(.8),
              width: 100,
              child: Text(
                '${model['name']}',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildGrid(dynamic model, context) => Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image(
                      image: model['image'] != null
                          ? NetworkImage('${model['image']}')
                          : NetworkImage(
                              'https://th.bing.com/th/id/R.cc57fccc11df5702df7f196b338dba1a?rik=2jhE9uelCkdeOQ&pid=ImgRaw&r=0'),
                      width: double.infinity,
                      height: 200,
                    ),
                    if (model['discount'].toString() != '0')
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
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Text(
                          '${model['name']}',
                          style: TextStyle(
                            fontSize: 11,
                            height: 1.3,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text(
                              '${model['price']}جنيه ',
                              style: TextStyle(
                                fontSize: 12,
                                color: defaultcolor,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          if (model['discount'].toString() != '0')
                            Text(
                              '${model['old_price']}',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: salseid.contains(model['id'])
                      ? defaultcolor
                      : Colors.grey,
                  shape: BoxShape.circle),
              child: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      if (salseid.contains(model['id'])) {
                        int index = salseid.indexOf(model['id']);
                        print(index);
                        salseid.removeAt(index);
                        salse.removeAt(index);
                      } else {
                        salseid.add(model['id']);
                        salse.add(model);
                      }
                      print(salse.length);
                    });
                  },
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                  )),
            ),
          ),
        ],
      );
}
//model['in_favorites']
