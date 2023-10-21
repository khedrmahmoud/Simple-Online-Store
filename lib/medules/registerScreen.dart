import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/shared/cubit/cubit.dart';
import 'package:online_store/shared/cubit/states.dart';
import 'package:online_store/shared/styles/colors.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var namecontrol = TextEditingController();

  var phonecontrol = TextEditingController();

  var emailcontrol = TextEditingController();

  var passwordcontrol = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Appcubit(),
      child: BlocConsumer<Appcubit, States>(listener: (context, state) {
        /* if(state is shopeegistsuccess)
            {
              if(state.registmodel!.status)
              {
                print(state.registmodel!.message);
                print(state.registmodel!.data.token);
                CashHelper.setdata(key: 'token',value: state.registmodel!.data.token).then((value){
                  token=state.registmodel!.data.token!;
                  navigateAndfinish(context, MyHomePage());
                });
                showtoast(state: Toaststates.SUCCESS,text:state.registmodel!.message);
              }
              else
              {
                print(state.registmodel!.message);
                showtoast(state: Toaststates.ERROR,text:state.registmodel!.message);
              }
            }
            else if(state is registerrorstate)
            {
              showtoast(state: Toaststates.ERROR,text:'error');
            }
            */
      }, builder: (context, state) {
        Map<String, dynamic> data = {};
        var cubit = Appcubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'RGISTER',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        'RIGISTER now to prows our shop',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: namecontrol,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your name';
                          }
                        },
                        onChanged: (v) {
                          data = {
                            'name': emailcontrol.text,
                            'email': emailcontrol.text,
                            'password': passwordcontrol.text,
                            'phone': phonecontrol.text,
                          };
                        },
                        onFieldSubmitted: (v) {
                          if (formkey.currentState!.validate()) {
                            data = {
                              'name': namecontrol.text,
                              "email": emailcontrol.text,
                              "password": passwordcontrol.text,
                              'phone': phonecontrol.text,
                            };
                            cubit.dioPostlogin('register', data, context);
                            setState(() {
                              cubit.dioPostlogin('register', data, context);
                            });
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'User Name',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: emailcontrol,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your email address';
                          }
                        },
                        onChanged: (v) {
                          data = {
                            'name': emailcontrol.text,
                            'email': emailcontrol.text,
                            'password': passwordcontrol.text,
                            'phone': phonecontrol.text,
                          };
                        },
                        onFieldSubmitted: (v) {
                          if (formkey.currentState!.validate()) {
                            data = {
                              'name': namecontrol.text,
                              "email": emailcontrol.text,
                              "password": passwordcontrol.text,
                              'phone': phonecontrol.text,
                            };
                            cubit.dioPostlogin('register', data, context);
                            setState(() {
                              cubit.dioPostlogin('register', data, context);
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
                        height: 80,
                        child: TextFormField(
                          controller: passwordcontrol,
                          keyboardType: TextInputType.visiblePassword,
                          /*onFieldSubmitted: (value) {
                            // if(formkey.currentState!.validate())
                            // {
                            //   cubit.userLogin(
                            //       context,
                            //       email: emailcontrol.text,
                            //       password: passwordcontrol.text
                            //   );
                            // }
                          },*/
                          onChanged: (v) {
                            data = {
                              'name': emailcontrol.text,
                              'email': emailcontrol.text,
                              'password': passwordcontrol.text,
                              'phone': phonecontrol.text,
                            };
                          },
                          obscureText: cubit.ispassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          onFieldSubmitted: (v) {
                            if (formkey.currentState!.validate()) {
                              data = {
                                'name': namecontrol.text,
                                "email": emailcontrol.text,
                                "password": passwordcontrol.text,
                                'phone': phonecontrol.text,
                              };
                              cubit.dioPostlogin('register', data, context);
                              setState(() {
                                cubit.dioPostlogin('register', data, context);
                              });
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
                      TextFormField(
                        controller: phonecontrol,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your phone';
                          }
                        },
                        onChanged: (v) {
                          data = {
                            'name': emailcontrol.text,
                            'email': emailcontrol.text,
                            'password': passwordcontrol.text,
                            'phone': phonecontrol.text,
                          };
                        },
                        onFieldSubmitted: (v) {
                          if (formkey.currentState!.validate()) {
                            data = {
                              'name': namecontrol.text,
                              "email": emailcontrol.text,
                              "password": passwordcontrol.text,
                              'phone': phonecontrol.text,
                            };
                            cubit.dioPostlogin('register', data, context);
                            setState(() {
                              cubit.dioPostlogin('register', data, context);
                            });
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone),
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
                                    'name': namecontrol.text,
                                    "email": emailcontrol.text,
                                    "password": passwordcontrol.text,
                                    'phone': phonecontrol.text,
                                  };
                                  cubit.dioPostlogin('register', data, context);
                                  setState(() {
                                    cubit.dioPostlogin(
                                        'register', data, context);
                                  });
                                }
                              },
                              child: Text(
                                'REGISTER',
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
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
