import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_riverpod/constants/constants.dart';
import 'package:sizer/sizer.dart';

import 'home_screen.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C3554),
        leading: IconButton(
            onPressed: () => Navigator.push(
                context, CupertinoPageRoute(builder: (_) => HomeScreen())),
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(""),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "img/404.jpg",
                ),
                fit: BoxFit.cover)),
        height: 105.h,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100.w,
              height: 20.h,
              decoration: BoxDecoration(
                  color: Colors.indigo.withAlpha(300),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                  child: Text(
                "SAYFA BULUNAMADI",
                style: EntireConstants.textStyleWhite28Bold,
              )),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  //color: Colors.indigo.shade300,
                  borderRadius: BorderRadius.circular(25)),
              width: 80.w,
              height: 40.h,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    /* Text(
                      "Sistemde olmayan bir şehir girdiniz",
                      style: EntireConstants.textStyleWhite15Bold,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("lütfen tekrar deneyin",
                        style: EntireConstants.textStyleWhite15Bold) */
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
