import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SnackBar snackBar = SnackBar(content: Text('Showing Snackbar'));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Emergency Contacts'),
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
                  title: Text('Police Station'),
                  subtitle: Text('100'),
                  trailing: FlatButton(
                    child: Icon(Icons.call, color: Colors.green,),
                    onPressed: () {
                      launch('tel:100');
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.local_hospital,color: Colors.red.shade900),
                  title: Text('Ambulance'),
                  subtitle: Text('108'),
                  trailing: FlatButton(
                    child: Icon(Icons.call, color: Colors.green,),
                    onPressed: () {
                      launch('tel:108');
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.local_taxi,color: Colors.blue.shade900),
                  title: Text('Taxi'),
                  subtitle: Text('+91 45454545'),
                  trailing: FlatButton(
                    child: Icon(Icons.call, color: Colors.green,),
                    onPressed: () {
                      launch('tel://+9145454545');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
