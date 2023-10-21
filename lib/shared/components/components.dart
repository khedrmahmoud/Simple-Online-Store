import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:language_picker/languages.dart';
import 'package:language_picker/languages.g.dart';
import 'package:online_store/shared/styles/colors.dart';

void navigateAndfinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

void navigatto(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void showtoast({
  required String text,
  required Toaststates state,
}) =>
    Fluttertoast.showToast(
        msg: "${text}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: choose(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum Toaststates { SUCCESS, ERROR, WARNING }

Color choose(Toaststates state) {
  switch (state) {
    case Toaststates.SUCCESS:
      return Colors.green;

    case Toaststates.ERROR:
      return Colors.red;

    default:
      return Colors.amber;
  }
  ;
}

void printfullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

Widget devider() => Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey,
    );

Widget defaultbutton({required String text, required Function function}) =>
    Container(
      width: double.infinity,
      color: defaultcolor,
      child: TextButton(
          onPressed: () {
// if(formkey.currentState!.validate())
// {
//   cubit.userLogin(
//       context,
//       email: emailcontrol.text,
//       password: passwordcontrol.text
//   );
// }
            function;
          },
          child: Text(
            '${text}',
            style: TextStyle(
              color: Colors.white,
            ),
          )),
    );

List<Image> images = [];
List<dynamic> cat = [];
List<dynamic> product = [];
List<dynamic> favorits = [];
Map<int, bool> favoritsbool = {};
dynamic usermodel = {};
List<dynamic> searchmodel = [];
Language selectedDialogLanguage = Languages.english;
List<int> electronicid = [54, 52, 53, 55, 56, 57, 82, 83, 86, 87];

List<int> sportsid = [58, 84, 85];

List<int> coronaid = [
  80,
  81,
];

List<int> lightId = [
  88,
  89,
];

Set<Map<dynamic, dynamic>> ElectroncCat = {};
Set<Map<dynamic, dynamic>> SportCat = {};
Set<Map<dynamic, dynamic>> CoronaCat = {};
Set<Map<dynamic, dynamic>> LightCat = {};

int numberofCat = 0;
String nameofCat = '';

List<Map<dynamic, dynamic>> salse = [];
List<int> salseid = [];
double sumPrice = 0;

bool? isVisa;

Map<String, dynamic> CustomerData = {};
