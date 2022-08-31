import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:qwc/index.dart';

class HelperMethods {
  HelperMethods._();

  // create an instance of the class
  static final HelperMethods instance = HelperMethods._();

  // get the uid of the current firebase user
  final String? _uid = userController.currentFirebaseUser?.uid;
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  // fetch user profile from firebase database
  Future<void> fetchUserProfile() async {
    if (userController.currentFirebaseUser != null) {
      // get the user profile from the user reference
      dynamic snapshot = await _databaseReference.child('users/$_uid').get();
      if (snapshot.exists) {
        // debugPrint(snapshot.value.toString());
        // get the user email from the snapshot
        final String? email = snapshot.value?['email'];
        final String? fullName = snapshot.value?['fullname'];
        // create a map of string and dynamic
        final Map<String, dynamic> userMap = {
          'id': _uid,
          'email': email,
          'fullname': fullName,
        };
        userController.updateCurrentUserInfo(UserModel.fromJson(userMap));
        // debugPrint("user data from controller ${userController.currentUserInfo.toJson()}");
      } else {
        debugPrint('No data available.');
      }
    }
  }

  // post data to firebase database
  Future<void> postData(String path, Map<String, dynamic> data) async {
    // set the data to the firebase database
    await _databaseReference.child(path).set(data);
  }

  // update the data
  Future<void> updateData(String path, Map<String, dynamic> data) async {
    // update the data to the firebase database
    await _databaseReference.child(path).update(data);
  }

  // subscribe to the firebase database
  Future<void> subscribeToData(String path) async {
    DatabaseReference dataRef = FirebaseDatabase.instance.ref(path);
    dataRef.onValue.listen((DatabaseEvent event) {
      dynamic data = event.snapshot.value;
      // create a map for the data
      final Map<String, dynamic> dataMap = {
        'Epoch timestamp': data['Epoch timestamp'],
        'turbidity': data['turbidity'],
        'tds': data['tds'],
        'pH': data['pH'],
        'temperature': data['temperature'],
      };
      dataController.updateData(DataModel.fromJson(dataMap));
      // updateStarCount(data);
      // debugPrint('data: ${dataController.data.turbidity}');
    });
  }
}
