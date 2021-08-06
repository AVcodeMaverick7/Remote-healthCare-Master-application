import 'package:flutter/material.dart';


class OtherApps extends StatefulWidget {
  @override
  _OtherAppsState createState() => _OtherAppsState();
}

class _OtherAppsState extends State<OtherApps> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SnackBar snackBar = SnackBar(content: Text('Showing Snackbar'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Other Useful Apps'),
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
                  title: Text('Additional Apps'),
                  subtitle: Text('To Be Implemented'),
                ),
                ListTile(
                  leading: Icon(Icons.local_hospital,color: Colors.red.shade900),
                  title: Text('Favorite Apps'),
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
