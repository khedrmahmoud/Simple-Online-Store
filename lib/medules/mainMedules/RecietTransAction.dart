import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_store/layouts/layouts.dart';
import 'package:online_store/shared/components/components.dart';
import 'package:online_store/shared/components/constans/constans.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screen_capturer/screen_capturer.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_picker/image_picker.dart';

class RecietTransAction extends StatefulWidget {
  const RecietTransAction({Key? key}) : super(key: key);

  @override
  _RecietTransActionState createState() => _RecietTransActionState();
}

class _RecietTransActionState extends State<RecietTransAction> {
  int _counter = 0;
  Uint8List? _imageFile;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Final Reciet',
          style: TextStyle(color: Colors.black),
        ),
        titleSpacing: 6,
        actions: [
          TextButton(
            onPressed: () async {
              final image = await screenshotController.capture();
              if (image == null) return;
              await saveImage(image);
            },
            child: Text(
              'Print',
            ),
          ),
          TextButton(
            onPressed: () {
              navigatto(context, MyHomePage());
              CustomerData = {};
            },
            child: Text(
              'Finish',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Screenshot(
            controller: screenshotController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                information(context, 'name', CustomerData['name']),
                information(context, 'phone', CustomerData['phone']),
                information(context, 'address', CustomerData['address']),
                information(
                    context, 'Recieving Date', CustomerData['recieveDate']),
                information(context, 'Recieving Hour', CustomerData['Time']),
                information(
                    context, 'Total Price', CustomerData['salseTotalprice']),
                information(
                    context, 'Products Number', CustomerData['salseNum']),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '_')
        .replaceAll(':', '_');
    final name = 'screenshot$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['filePath'];
  }

}
