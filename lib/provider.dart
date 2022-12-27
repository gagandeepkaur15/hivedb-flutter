import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './modal.dart';

class Storage extends ChangeNotifier {
  late Modal data;
  final box = Hive.box<Modal>('modal');

  List<Modal> get value {
    return box.values.toList();
  }

  void addData(name, email, mobileNo) {
    final modal = Modal()
      ..name = name
      ..email = email
      ..mobileNo = mobileNo;
    final res = box.put('key', modal);
    res.whenComplete(
      () => box.values.forEach(
        (element) {
          print(element.name + " " + element.email + " " + element.mobileNo);
        },
      ),
    );
    notifyListeners();
  }

  void updateData(Modal modal, name, email, mobileNo) {
    modal.name = name;
    modal.email = email;
    modal.mobileNo = mobileNo;
    modal.save();
    notifyListeners();
  }

  void removeData(Modal modal) {
    modal.delete();
    notifyListeners();
  }
}
