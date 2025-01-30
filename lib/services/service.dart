
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:userlogtest/model.dart/usre_log_model.dart';

class UserService{
    Future<bool> addLogs(
      BuildContext context, String btnPress) async {
        
    CollectionReference trans =
         FirebaseFirestore.instance.collection('userlogs');
    return trans.add({
      'btn': btnPress,
      'date': DateTime.now(),
    }).then((value) {
      return true;
    });
  }

  Future<List<UserLog>> getAllLogs(BuildContext context) async {
    List<UserLog> uLogs = [];
    var collection = FirebaseFirestore.instance
        .collection('userlogs');
    var querySnapshots = await collection.get();
    for (var snapshot in querySnapshots.docs) {
      UserLog temp = UserLog(
          btn: snapshot['btn'],
          date: snapshot['date'].toDate());
      uLogs.add(temp);
    }
    return uLogs;
  }
}