import 'package:flutter/material.dart';


class Reminders extends StatefulWidget {
  @override
  _RemindersState createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SnackBar snackBar = SnackBar(content: Text('Showing Snackbar'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Reminders/Alerts'),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            tooltip: 'Show Snackbar',
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person, color: Colors.yellow.shade900,),
                  title: Text(' Active Reminders'),
                  subtitle: Text('To Be Implemented'),
                ),
                ListTile(
                  leading: Icon(Icons.local_hospital,color: Colors.red.shade900),
                  title: Text('Alerts'),
                  subtitle: Text('To Be Implemented'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
