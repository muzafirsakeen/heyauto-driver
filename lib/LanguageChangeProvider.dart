import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LanguageChangeProvider with ChangeNotifier{
  Locale _currentlocale = new Locale("en");

  Locale get currentlocale => _currentlocale;

  void changeLocale (String _locale){
    this.._currentlocale = new  Locale(_locale);
    notifyListeners();
  }

}