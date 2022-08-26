
import 'package:techchallenge/appSharedPreference.dart';

import 'Constant.dart';

class InitialData{
  static String name = '';
  static String email = '';
  static init() async{
    name = await AppSharedPreference.getInfo(SharedPreferenceKey.name);
    email = await AppSharedPreference.getInfo(SharedPreferenceKey.email);
  }
}