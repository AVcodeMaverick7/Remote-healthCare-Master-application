import 'package:flutter/material.dart';


class SavedInfo extends StatefulWidget {
  @override
  _SavedInfoState createState() => _SavedInfoState();
}

class _SavedInfoState extends State<SavedInfo> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SnackBar snackBar = SnackBar(content: Text('Showing Snackbar'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Saved Information'),
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
                  title: Text('Saved Information'),
                  subtitle: Text('To Be Implemented'),
                ),
                ListTile(
                  leading: Icon(Icons.local_hospital,color: Colors.red.shade900),
                  title: Text('Activity Tracking'),
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
