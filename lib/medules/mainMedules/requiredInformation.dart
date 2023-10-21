import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/medules/mainMedules/RecietTransAction.dart';
import 'package:online_store/shared/components/components.dart';
import 'package:online_store/shared/cubit/cubit.dart';
import 'package:online_store/shared/cubit/states.dart';
import 'package:online_store/shared/styles/colors.dart';

class RequiredInfoScreen extends StatefulWidget {
  const RequiredInfoScreen({Key? key}) : super(key: key);

  @override
  _RequiredInfoScreenState createState() => _RequiredInfoScreenState();
}

class _RequiredInfoScreenState extends State<RequiredInfoScreen> {
  var formKey = GlobalKey<FormState>();
  var namecontrol = TextEditingController();
  var emailcontrol = TextEditingController();
  var phonecontrol = TextEditingController();
  var addresscontrol = TextEditingController();
  var cardcontrol = TextEditingController();
  var securitycontrol = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Appcubit(),
      child: BlocConsumer<Appcubit, States>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = Appcubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                titleSpacing: 9,
                automaticallyImplyLeading: false,
                title: Text(
                  'Checkout',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                actions: [
                  TextButton(
                    child: Text('Cancel   '),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  )
                ],
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                  child: Center(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10, top: 8, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Please Complete This Form',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            controller: namecontrol,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your name';
                              }
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                hintText: 'pleas enter your name on card',
                                label: Text('Name On Card'),
                                prefixIcon:
                                    Icon(Icons.drive_file_rename_outline),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            controller: emailcontrol,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your email address';
                              }
                            },
                            decoration: InputDecoration(
                                hintText: 'pleas enter your email',
                                label: Text('Email'),
                                prefixIcon: Icon(Icons.mail),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            controller: phonecontrol,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your phone Number';
                              }
                            },
                            decoration: InputDecoration(
                                hintText: 'pleas enter your Phone',
                                label: Text('Phone'),
                                prefixIcon: Icon(Icons.phone),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            controller: addresscontrol,
                            keyboardType: TextInputType.streetAddress,
                            onFieldSubmitted: (v) {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  CustomerData = {
                                    'name': namecontrol.text,
                                    'email': emailcontrol.text,
                                    'phone': phonecontrol.text,
                                    'address': addresscontrol.text,
                                    if (isVisa == true)
                                      'visaNumber': cardcontrol.text,
                                    if (isVisa == true)
                                      'securityNum': securitycontrol.text,
                                    'recieveDate':
                                        DateTime.now().add(Duration(days: 2)),
                                    'salseNum': salse.length,
                                    'salseTotalprice': sumPrice,
                                  };
                                });
                                navigateAndfinish(context, RecietTransAction());
                              }
                              ;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your address';
                              }
                            },
                            decoration: InputDecoration(
                                hintText: 'pleas enter your address',
                                label: Text('Adress'),
                                prefixIcon: Icon(Icons.location_city),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero)),
                          ),
                        ),
                        if (isVisa == true)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              controller: cardcontrol,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter your card number';
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: 'pleas enter your card number',
                                  label: Text('Card Number'),
                                  prefixIcon: Icon(Icons.credit_card),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero)),
                            ),
                          ),
                        if (isVisa == true)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              controller: securitycontrol,
                              keyboardType: TextInputType.numberWithOptions(),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter your crd security number';
                                }
                              },
                              obscureText: cubit.ispassword,
                              decoration: InputDecoration(
                                  hintText:
                                      'pleas enter your card security number',
                                  label: Text('Card Security Number'),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 11.0),
                                    child: IconButton(
                                      icon: Icon(cubit.suffix),
                                      onPressed: () {
                                        cubit.changepassword();
                                      },
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero)),
                            ),
                          ),
                        SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                          condition: CustomerData.isEmpty,
                          builder: (BuildContext context) => Container(
                            width: double.infinity,
                            color: defaultcolor,
                            child: TextButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      CustomerData = {
                                        'name': namecontrol.text,
                                        'email': emailcontrol.text,
                                        'phone': phonecontrol.text,
                                        'address': addresscontrol.text,
                                        if (isVisa == true)
                                          'visaNumber': cardcontrol.text,
                                        if (isVisa == true)
                                          'securityNum': securitycontrol.text,
                                        'recieveDate': DateTime.now()
                                            .add(Duration(days: 1)),
                                        'Time':
                                            Duration(hours: 12, minutes: 30),
                                        'salseNum': salse.length,
                                        'salseTotalprice': sumPrice,
                                      };
                                    });
                                    navigateAndfinish(
                                        context, RecietTransAction());
                                  }
                                },
                                child: Text(
                                  'SUBMIT',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                          ),
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            );
          }),
    );
  }
}
