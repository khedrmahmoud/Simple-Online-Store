import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_picker/language_picker_cupertino.dart';
import 'package:language_picker/language_picker_dialog.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';
import 'package:language_picker/languages.g.dart';
import 'package:online_store/medules/logineScreen.dart';
import 'package:online_store/shared/components/components.dart';
import 'package:online_store/shared/components/constans/constans.dart';
import 'package:online_store/shared/cubit/cubit.dart';
import 'package:online_store/shared/cubit/states.dart';
import 'package:online_store/shared/styles/colors.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var namecontrol = TextEditingController();

  var emaicontrol = TextEditingController();

  var phonecontrol = TextEditingController();
  dynamic op = 5;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => Appcubit(),
        child: BlocConsumer<Appcubit, States>(listener: (context, state) {
          /*  if (state is Getusersucsess) {
          namecontrol.text = state.model.data.name!;
          emaicontrol.text = state.model.data.email!;
          phonecontrol.text = state.model.data.phone!;
        }*/
        }, builder: (context, state) {
          var cubit = Appcubit.get(context);
          Map<String, dynamic> data = {};
          namecontrol.text = usermodel['name'];
          emaicontrol.text = usermodel['email'];
          phonecontrol.text = usermodel['phone'];
          var formkey = GlobalKey<FormState>();
          return ConditionalBuilder(
            condition: true,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: namecontrol,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'name must not be empty';
                          }
                          return null;
                        },
                        onChanged: (v) {
                          data = {
                            'name': namecontrol.text,
                            "email": emaicontrol.text,
                            'phone': phonecontrol.text,
                          };
                        },
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: emaicontrol,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'email must not be empty';
                          }
                          return null;
                        },
                        onChanged: (v) {
                          data = {
                            'name': namecontrol.text,
                            "email": emaicontrol.text,
                            'phone': phonecontrol.text,
                          };
                        },
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: phonecontrol,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'phone must not be empty';
                          }
                          return null;
                        },
                        onChanged: (v) {
                          data = {
                            'name': namecontrol.text,
                            "email": emaicontrol.text,
                            'phone': phonecontrol.text,
                          };
                        },
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: defaultcolor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.orange.shade500,
                                offset: Offset(3, 3)),
                            BoxShadow(
                                color: Colors.black38, offset: Offset(3, 3)),
                          ],
                        ),
                        child: TextButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                data = {
                                  'name': namecontrol.text,
                                  "email": emaicontrol.text,
                                  'phone': phonecontrol.text,
                                };
                                cubit.updateinfo('update-profile', data,
                                    tokenpublic, context);
                                setState(() {
                                  cubit.updateinfo('update-profile', data,
                                      tokenpublic, context);
                                });
                              }
                            },
                            child: Text(
                              'UPDATE',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: defaultcolor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.orange.shade500,
                                offset: Offset(3, 3)),
                            BoxShadow(
                                color: Colors.black38, offset: Offset(3, 3)),
                          ],
                        ),
                        child: TextButton(
                            onPressed: () {
                              navigateAndfinish(context, Login());
                            },
                            child: Text(
                              'LOGEOUT',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: defaultcolor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.orange.shade500,
                                        offset: Offset(3, 3)),
                                    BoxShadow(
                                        color: Colors.black38,
                                        offset: Offset(3, 3)),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    TextButton(
                                      child: Text(
                                        'Change Language',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _openLanguagePickerDialog();
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                            child: Text(
                              'Language:',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                            child: TextButton(
                              child: Text('${selectedDialogLanguage.name}'),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        }));
  }

// It's sample code of Dialog Item.
  Widget _buildDialogItem(Language language) => Row(
        children: <Widget>[
          Text(language.name),
          SizedBox(width: 8.0),
          Flexible(child: Text("(${language.isoCode})"))
        ],
      );

  void _openLanguagePickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
            child: LanguagePickerDialog(
                titlePadding: EdgeInsets.all(8.0),
                searchCursorColor: Colors.pinkAccent,
                searchInputDecoration: InputDecoration(hintText: 'Search...'),
                isSearchable: true,
                languages: [
                  Languages.english,
                  Languages.arabic,
                ],
                title: Text('Select your language'),
                onValuePicked: (Language language) => setState(() {
                      selectedDialogLanguage = language;
                      print(selectedDialogLanguage.name);
                      print(selectedDialogLanguage.isoCode);
                    }),
                itemBuilder: _buildDialogItem)),
      );
}
