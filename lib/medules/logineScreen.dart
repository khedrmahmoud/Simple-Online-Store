import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/animation/slider.dart';
import 'package:online_store/layouts/layouts.dart';
import 'package:online_store/medules/registerScreen.dart';
import 'package:online_store/shared/components/components.dart';
import 'package:online_store/shared/cubit/cubit.dart';
import 'package:online_store/shared/cubit/states.dart';
import 'package:online_store/shared/styles/colors.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailcontrol = TextEditingController();

  var passwordcontrol = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => Appcubit(),
        child: BlocConsumer<Appcubit, States>(
          listener: (context, state) {},
          builder: ((context, state) {
            String log = 'login';
            var cubit = Appcubit.get(context);
            Map<String, dynamic> data = {
              "email": emailcontrol.text,
              "password": passwordcontrol.text,
            };
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LOGIN',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.black),
                          ),
                          Text(
                            'Login now to prows our shop',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: emailcontrol,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (v) {
                              setState(() {
                                data = {
                                  "email": emailcontrol.text,
                                  "password": passwordcontrol.text,
                                };
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your email address';
                              }
                            },
                            onFieldSubmitted: (value) {
                              if (formkey.currentState!.validate()) {
                                data = {
                                  "email": emailcontrol.text,
                                  "password": passwordcontrol.text,
                                };
                                cubit.dioPostlogin(log, data, context);
                                setState(() {
                                  cubit.dioPostlogin(log, data, context);
                                });
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email_outlined),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            height: 65,
                            child: TextFormField(
                              controller: passwordcontrol,
                              keyboardType: TextInputType.visiblePassword,
                              onChanged: (v) {
                                setState(() {
                                  data = {
                                    "email": emailcontrol.text,
                                    "password": passwordcontrol.text,
                                  };
                                });
                              },
                              onFieldSubmitted: (value) {
                                if (formkey.currentState!.validate()) {
                                  data = {
                                    "email": emailcontrol.text,
                                    "password": passwordcontrol.text,
                                  };
                                  cubit.dioPostlogin(log, data, context);
                                  setState(() {
                                    cubit.dioPostlogin(log, data, context);
                                  });
                                }
                              },
                              obscureText: cubit.ispassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'password is too short';
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock_outlined),
                                suffix: IconButton(
                                  onPressed: () {
                                    cubit.changepassword();
                                  },
                                  icon: Icon(cubit.suffix),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ConditionalBuilder(
                            condition: cubit.isbuttpn,
                            builder: (BuildContext context) => Container(
                              width: double.infinity,
                              color: defaultcolor,
                              child: TextButton(
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      data = {
                                        "email": emailcontrol.text,
                                        "password": passwordcontrol.text,
                                      };
                                      cubit.dioPostlogin(log, data, context);
                                      setState(() {
                                        cubit.dioPostlogin(log, data, context);
                                      });
                                    }
                                  },
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                            fallback: (context) => Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an acount?'),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(SliderRout(page: Register()));
                                  },
                                  child: Text('REGISTER'))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ));
  }
}
