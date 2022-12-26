import 'dart:math';

import 'package:thread_app/services/user_services.dart';

class GenerateRandom {
  Random rand = Random();

  Future<String> generateRandomAnonId() async {
    String id = '';
    for(int i = 0; i < 10; i++) {
      id = '';
      for(int j = 0; j < 6; j++) {
        id += rand.nextInt(10).toString();
      }

      bool valid = await UserServices().isIdUnique(id);
      if(valid) {
        break;
      }
    }

    return id;
  }

  String generateRandomImage() {
    return rand.nextInt(10).toString();
  }
}