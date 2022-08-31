import 'package:get/get.dart';

import '../models/data_model.dart';

class DataController extends GetxController {
  static DataController instance = Get.find();
  // create a list of DataModel
  final _data = DataModel().obs;

  // update the data
  void updateData(DataModel data) {
    _data.value = data;
    update();
  }

  // get the data list
  DataModel get data => _data.value;
}
