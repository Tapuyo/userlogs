import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:userlogtest/model.dart/usre_log_model.dart';
import 'package:userlogtest/provider/init_provider.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callTransactions();
  }

  callTransactions() {
    final userProvider = context.read<InitProvider>();
    userProvider.getAllLogs(context);
  }
  
   @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
       
          child: Column(
            children: [
              Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios,color: Colors.black,),
                        Text(
                          'History',
                          style: TextStyle(fontSize: 26, color: Colors.black),
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ),
             
              //Show all transaction
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: transactions(),
              )
            ],
          ),
        ),
      ),
     
    );
  }


 Widget transactions() {
    final userProvider = context.watch<InitProvider>();
    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
      
        itemCount: userProvider.userlog.length,
        itemBuilder: (context, i) {
          UserLog uLog = userProvider.userlog[i];
          
          return Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ClipRect(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(uLog.btn,
                              style: TextStyle(color: Colors.black)),
                          Text(DateFormat.yMEd().add_jms().format(uLog.date),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 10))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

