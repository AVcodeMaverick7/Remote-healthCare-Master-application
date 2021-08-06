import 'package:flutter/material.dart';


class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SnackBar snackBar = SnackBar(content: Text('Showing Snackbar'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Account Information'),
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
                  title: Text('User Profile'),
                  subtitle: Text('To Be Implemented'),
                ),
                ListTile(
                  leading: Icon(Icons.local_hospital,color: Colors.red.shade900),
                  title: Text('Login Details & Activity Tracking'),
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
