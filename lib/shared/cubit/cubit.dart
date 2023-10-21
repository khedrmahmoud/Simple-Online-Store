import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/animation/slider.dart';
import 'package:online_store/layouts/layouts.dart';
import 'package:online_store/medules/prMedules/category.dart';
import 'package:online_store/medules/prMedules/faforits.dart';
import 'package:online_store/medules/prMedules/products.dart';
import 'package:online_store/medules/prMedules/settings.dart';
import 'package:online_store/shared/NETWORK/dio.dart';
import 'package:online_store/shared/components/components.dart';
import 'package:online_store/shared/components/constans/constans.dart';
import 'package:online_store/shared/components/database.dart';
import 'package:online_store/shared/cubit/states.dart';

class Appcubit extends Cubit<States> {
  Appcubit() : super(Initail());
  static Appcubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_off_outlined;
  bool ispassword = true;
  void changepassword() {
    ispassword = !ispassword;
    suffix =
        ispassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(Initail());
  }

  int currentindex = 0;
  List<Widget> bottomscreens = [
    Productssc(),
    Category(),
    Favorits(),
    Settings(),
  ];
  Widget bottomscreen({required int index}) {
    currentindex = index;
    emit(Initail());
    return bottomscreens[index];
  }

  bool isbuttpn = true;
  dynamic userData;
  void dioPostlogin(String url, Map<String, dynamic> data, context) {
    isbuttpn = false;
    DioHelr.postdata(url: url, data: data).then((value) {
      userData = value.data;
      print(userData['status']);
      if (userData['status'].toString() == 'true') {
        navigateAndfinish(context, MyHomePage());
        showtoast(text: userData['message'], state: Toaststates.SUCCESS);
        isbuttpn = true;
      } else {
        showtoast(text: userData['message'], state: Toaststates.ERROR);
        isbuttpn = true;
      }
      tokenpublic = userData['data']['token'] ?? 'default';
      print(tokenpublic.toString());
      usermodel = userData['data'];
      print(usermodel.toString());
      diogetdat();
      emit(Initail());
    }).catchError((e) {
      print(e.toString());
      emit(Initail());
    });
  }

  void updateinfo(
      String url, Map<String, dynamic> data, dynamic token, context) {
    DioHelr.putdata(url: url, data: data, token: token).then((value) {
      userData = value.data;
      print(userData['status']);
      tokenpublic = userData['data']['token'] ?? 'default';
      if (userData['status'].toString() == 'true') {
        showtoast(text: userData['message'], state: Toaststates.SUCCESS);
      } else {
        showtoast(text: userData['message'], state: Toaststates.ERROR);
      }
      print(tokenpublic.toString());
      usermodel = userData['data'];
      print(usermodel.toString());
      diogetdat();
      emit(Initail());
    }).catchError((e) {
      print(e.toString());
      emit(Initail());
    });
  }

  List<String> banner = [];
  bool bannerload = false;
  void diogetdat() {
    bannerload = true;
    emit(Initail());
    DioHelr.get(url: 'banners').then((value) {
      for (int i = 0; i < value.data['data'].length; i++) {
        banner.add(value.data['data'][i]['image']);
        images.add(Image.network(
          banner[i],
          width: double.infinity,
          fit: BoxFit.cover,
        ));
      }
      bannerload = false;
      getCategory();
      emit(Initail());
    }).catchError((e) {
      print(e.toString());
      emit(Initail());
    });
  }

  void getCategory() {
    DioHelr.get(url: 'categories').then((value) {
      cat = value.data['data']['data'];
      print(cat.length);
      emit(Initail());
    });
  }

  bool? fed;
  void getproduct() {
    DioHelr.get(url: 'products', token: tokenpublic).then((value) {
      product = value.data['data']['data'];
      product.forEach((element) {
        favoritsbool.addAll({
          element['id']: element['in_favorites'],
        });
        if (electronicid.contains(element['id'])) {
          if (ElectroncCat.length < 10) ElectroncCat.add(element);
        } else if (sportsid.contains(element['id'])) {
          if (SportCat.length < 3) SportCat.add(element);
        } else if (coronaid.contains(element['id'])) {
          if (CoronaCat.length < 2) CoronaCat.add(element);
        } else {
          if (LightCat.length < 2) LightCat.add(element);
        }
      });
      print(cat.length);
      emit(Initail());
    });
  }

  void getfavorits() {
    DioHelr.get(url: 'favorites', token: tokenpublic).then((value) {
      favorits = value.data['data']['data'];
      print(favorits.length);
      emit(Initail());
    }).catchError((e) {
      print(e.toString());
      emit(Initail());
    });
  }

  void setfavorits(
    int productid,
  ) {
    favoritsbool[productid] = !favoritsbool[productid]!;
    emit(Initail());
    DioHelr.postdata(
            url: 'favorites',
            data: {'product_id': productid},
            token: tokenpublic)
        .then((value) {
      print(value.data['message']);
      if (!value.data['status']) {
        favorits[productid] = !favorits[productid];
      } else {
        getfavorits();
      }
      getfavorits();
      emit(Initail());
    }).catchError((r) {
      favorits[productid] = !favorits[productid];
      emit(Initail());
    });
  }

  bool searchload = false;
  void searchProduct(data) {
    searchload = true;
    emit(Initail());
    DioHelr.postdata(url: 'products/search', data: data).then((value) {
      searchmodel = value.data['data']['data'];
      searchload = false;
      emit(Initail());
    });
  }
}
