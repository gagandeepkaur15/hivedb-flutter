import 'package:hive/hive.dart';

part 'modal.g.dart';

@HiveType(typeId: 0)
class Modal extends HiveObject{
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String email;

  @HiveField(2)
  late String mobileNo;
}

