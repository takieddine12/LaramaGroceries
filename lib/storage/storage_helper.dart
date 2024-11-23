import 'package:get_storage/get_storage.dart';


class StorageHelper {

  static final _box = GetStorage();
  static void setIsShown() => _box.write("isShown", true);
  static bool isShown() => _box.read("isShown") ?? false;

}