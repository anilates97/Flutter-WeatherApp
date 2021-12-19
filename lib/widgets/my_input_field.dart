import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weatherapp_with_riverpod/constants/constants.dart';
import 'package:flutter_weatherapp_with_riverpod/screens/weather_screen.dart';

import '../shared_preferences.dart';

class MyInput extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  String? sehir;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Function onSaved;
  MyInput({Key? key, required this.onSaved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String prefsehir = MyWeatherPreferences.getCityName() ?? '';
    return Form(
      key: _formKey,
      child: TextFormField(
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return "Şehir alanı boş bırakılamaz";
          }
        },
        controller: textEditingController,
        maxLength: 25,
        onSaved: onSaved as void Function(String?),
        style: const TextStyle(fontSize: 14),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintStyle: EntireConstants.textColorIndigo14,
            errorStyle: EntireConstants.errorStyleTextColor,
            contentPadding: const EdgeInsets.all(20),
            suffixIcon: GestureDetector(
                onTap: () async {
                  sehir = textEditingController.text;
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(context, CupertinoPageRoute(builder: (_) {
                      Future.delayed(const Duration(seconds: 2));
                      return WeatherScreen(
                        sehir: sehir,
                      );
                    }));
                  }
                },
                child: const Icon(Icons.search_rounded)),
            counterStyle: EntireConstants.textColorIndogo,
            hintText: "Şehir giriniz",
            filled: true,
            fillColor: Colors.white,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
