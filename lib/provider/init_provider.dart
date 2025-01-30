import 'package:flutter/material.dart';
import 'package:userlogtest/model.dart/usre_log_model.dart';
import 'package:userlogtest/services/service.dart';

class InitProvider with ChangeNotifier{
  List<UserLog> _userlog = [];

  List<UserLog> get userlog => _userlog;

  Future<bool> sendLogs(BuildContext context,String btnPress)async{
    UserService serv = UserService();
    return   await serv.addLogs(context, btnPress);
    // return true;
  }

  void getAllLogs(BuildContext context) async {
    UserService serv = UserService();
    List<UserLog> logs = await serv.getAllLogs(context);
    _userlog = logs;

    notifyListeners();
  }

}