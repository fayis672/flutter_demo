import 'package:get/get.dart';

class HomeController extends GetxController {
  int _dateIndex = 0;
  int get dateIndex => _dateIndex;
  String get dataIndexId => 'dateIndexId';

  int _navIndex = 0;
  int get navIndex => _navIndex;
  String get navIndexId => 'navIndexId';

  changeDateIndex(index) {
    _dateIndex = index;
    update([dataIndexId]);
  }

  changeNavIndex(index) {
    _navIndex = index;
    update([navIndexId]);
  }
}
