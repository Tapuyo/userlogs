import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userlogtest/provider/init_provider.dart';
import 'package:userlogtest/ui/History.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Logs'),
        leading: Icon(Icons.history),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  final userProvider = context.read<InitProvider>();
                  var res =
                      await userProvider.sendLogs(context, 'Button 1 Press');
                },
                child: Text('Button 1'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  final userProvider = context.read<InitProvider>();
                  var res =
                      await userProvider.sendLogs(context, 'Button 2 Press');
                },
                child: Text('Button 2'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  final userProvider = context.read<InitProvider>();
                  var res =
                      await userProvider.sendLogs(context, 'Button 3 Press');
                },
                child: Text('Button 3'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  final userProvider = context.read<InitProvider>();
                  var res =
                      await userProvider.sendLogs(context, 'Button 4r Press');
                },
                child: Text('Button 4'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => History()));
                },
                child: Text('Open Logs'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
