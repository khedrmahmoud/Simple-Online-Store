import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_picker/language_picker.dart';
import 'package:online_store/layouts/layouts.dart';
import 'package:online_store/medules/mainMedules/requiredInformation.dart';
import 'package:online_store/shared/components/components.dart';
import 'package:online_store/shared/components/constans/constans.dart';
import 'package:online_store/shared/cubit/cubit.dart';
import 'package:online_store/shared/cubit/states.dart';
import 'package:online_store/shared/styles/colors.dart';

class SammaryTotalPrice extends StatefulWidget {
  const SammaryTotalPrice({Key? key}) : super(key: key);

  @override
  State<SammaryTotalPrice> createState() => _SammaryTotalPriceState();
}

class _SammaryTotalPriceState extends State<SammaryTotalPrice> {
  @override
  void initState() {
    // TODO: implement initState
    sumPrice = 0;
    sammarytotalPrice();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Appcubit()..getfavorits(),
      child: BlocConsumer<Appcubit, States>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = Appcubit.get(context);
            //List<Map<dynamic, dynamic>> categoryitem = [];
            return Scaffold(
              appBar: AppBar(
                title: Text('Your Products'),
                titleSpacing: 1,
                actions: [
                  TextButton.icon(
                    onPressed: () {
                      showCancelprocess();
                    },
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.tealAccent)),
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.grey,
                    ),
                    label: Text(
                      'CANCEL',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
              body: ConditionalBuilder(
                condition: salse.length > 0,
                builder: (context) => Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 135,
                          ),
                          ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                buildfavitem(context, salse[index]),
                            separatorBuilder: (context, index) => devider(),
                            itemCount: salse.length,
                          ),
                          SizedBox(
                            height: 85,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, right: 8, left: 8, bottom: 5),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            color: Colors.grey[300],
                            child: Container(
                              decoration: BoxDecoration(color: Colors.grey),
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total Price:',
                                          style: TextStyle(
                                              color: defaultcolor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        Spacer(),
                                        Text(
                                          '$sumPrice',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey[700]),
                                        ),
                                        Text(
                                          'جنيه ',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: defaultcolor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, top: 0.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total Number:',
                                          style: TextStyle(
                                              color: defaultcolor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        Spacer(),
                                        Text(
                                          '${salse.length}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey[700]),
                                        ),
                                        Text(
                                          ' product',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: defaultcolor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 20,
                        right: 8,
                        left: 8,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[300]),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey),
                            child: TextButton(
                              onPressed: () {
                                ShowPaymentMethod();
                              },
                              child: FittedBox(
                                  child: Text(
                                'Confirm',
                                style: TextStyle(fontSize: 30),
                              )),
                            ),
                          ),
                        ))
                  ],
                ),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
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
                    if (model['discount'] != 0)
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
                          '${model['price']} جنيه',
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
                        if (model['discount'] != 0)
                          Text(
                            '${model['old_price']}',
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

  double sammarytotalPrice() {
    for (int i = 0; i < salse.length; i++) {
      sumPrice = sumPrice + salse[i]['price'].toDouble();
    }
    return sumPrice;
  }

  dynamic ShowPaymentMethod() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              alignment: Alignment.center,
              backgroundColor: Colors.tealAccent,
              title: Column(
                children: [
                  Container(
                    child: Text(
                      'Please Choose Your Payment Way:',
                    ),
                  ),
                ],
              ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isVisa = true;
                        navigatto(context, RequiredInfoScreen());
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 18,
                        right: 10,
                      ),
                      child: Container(
                        width: 70,
                        height: 70,
                        color: Colors.green,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            FittedBox(
                              child: Image.asset(
                                'assets/images/visa.png',
                                width: 60,
                                height: 70,
                              ),
                            ),
                            Container(
                              color: Colors.teal.withOpacity(0.8),
                              width: 60,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'VISA',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isVisa = false;
                        navigatto(context, RequiredInfoScreen());
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 18,
                        right: 10,
                      ),
                      child: Container(
                        width: 70,
                        height: 70,
                        color: Colors.green,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            FittedBox(
                              child: Image.asset(
                                'assets/images/dolar.png',
                                width: 60,
                                fit: BoxFit.cover,
                                height: 70,
                              ),
                            ),
                            Container(
                              color: Colors.teal.withOpacity(0.8),
                              width: 60,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'CASH',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('Cancel'),
                ),
              ],
            ));
  }

  dynamic showCancelprocess() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              alignment: Alignment.center,
              backgroundColor: Colors.tealAccent,
              title: Column(
                children: [
                  Container(
                    child: Text(
                      'Are you sure that you want to cancel the process:',
                    ),
                  ),
                ],
              ),
              content: FittedBox(
                child: Text(
                  'You will clear every thing you had done',
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('Backe'),
                ),
                TextButton(
                  onPressed: () {
                    salse = [];
                    salseid = [];
                    navigateAndfinish(context, MyHomePage());
                  },
                  child: Text('Continue'),
                ),
              ],
            ));
  }
}
