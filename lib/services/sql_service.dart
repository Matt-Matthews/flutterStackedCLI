import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:stackedtest/models/person.dart';

class SqlService {
  Future<void> testHive() async {
    // var path = Directory.current.path;
    await Hive.initFlutter();
    Hive.registerAdapter(PersonAdapter());

    var box = await Hive.openBox('testBox');

    var person = Person(
      name: 'Dave',
      age: 22,
      friends: ['Linda', 'Marc', 'Anne'],
    );

    await box.put('dave', person);

    // print(box.get('dave'));
  }
}
