import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_store/shared/styles/colors.dart';

var tokenpublic = '';

Widget information(context, f1, f2) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      color: Colors.grey,
      height: 75,
      padding: EdgeInsets.only(left: 15, right: 0, top: 12, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '${f1}: ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3,
            padding: EdgeInsets.only(
              top: 5,
            ),
            child: Text(
              '$f2',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: defaultcolor),
            ),
          ),
        ],
      ),
    ),
  );
}

Color LovedColor = Colors.red;
