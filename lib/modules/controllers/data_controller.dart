import 'package:get/get.dart';
import 'package:qwc/index.dart';

class DataController extends GetxController {
  static DataController instance = Get.find();
  // create a list of DataModel
  final _data = DataModel().obs;
  // create an empty list of DataModel
  final List<dynamic> _dataList = [];
  final RxList<SubscriberSeries> _defaultData = RxList([]);
  final _titleOne = "sept 19".obs;
  final _titleTwo = "sept 20".obs;
  final _titleThree = "sept 21".obs;
  final _titleFour = "sept 22".obs;

  // update the data
  void updateData(DataModel data) {
    _data.value = data;
    update();
  }

  // add data to the list
  void addData(DataModel data) {
    // add the data to the list
    _dataList.add(data);
    // select the first data in the list and update the data
    // debugPrint("adding data : ${_dataList.length.toString()}");
    updateData(_dataList.last);
    // sort the data based on the timeStamp
    // _dataList.sort((a, b) => a.epochTime.compareTo(b.epochTime));
  }

  // clear data from the list
  void clearData() {
    _dataList.clear();
    // print the length of the list
    // debugPrint("clearing data : ${_dataList.length.toString()}");
    update();
  }

  // update title
  updateTitle({required int index}) {
    if (index == 1) {
      _titleOne.value = "sept 19";
      _titleTwo.value = "sept 20";
      _titleThree.value = "sept 21";
      _titleFour.value = "sept 22";
    }
    if (index == 2) {
      _titleOne.value = "sept 23";
      _titleTwo.value = "sept 24";
      _titleThree.value = "sept 25";
      _titleFour.value = "sept 26";
    }
    if (index == 3) {
      _titleOne.value = "sept 27";
      _titleTwo.value = "sept 28";
      _titleThree.value = "sept 29";
      _titleFour.value = "sept 30";
    }
  }

  // get the data list
  DataModel get data => _data.value;
  List get dataList => _dataList;
  List<SubscriberSeries> get defaultData => _defaultData;
  String get titleOne => _titleOne.value;
  String get titleTwo => _titleTwo.value;
  String get titleThree => _titleThree.value;
  String get titleFour => _titleFour.value;
}
