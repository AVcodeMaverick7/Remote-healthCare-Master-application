import 'package:flutter/material.dart';
import 'package:proceedit_dyhealth/ind_components/heartattack_risk/models/myVariables.dart';

class InfoPanel extends StatefulWidget {
  @override
  _InfoPanelState createState() => _InfoPanelState();
}

class _InfoPanelState extends State<InfoPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: Text('Info Panel'),
      ),
      body: buildinfoListView(context),
    );
  }

  ListView buildinfoListView(BuildContext context) {

    return ListView.builder(
      itemCount: infoPanel.length,
      itemBuilder: (context,index) {
        return Card(
          child: ListTile(
            title: Text(variableCode[index],style: TextStyle(color: Colors.redAccent,
                fontWeight: FontWeight.bold),),
            subtitle: Text(infoPanel[index]),
            leading: Icon(Icons.keyboard_arrow_right_outlined),
            onTap: (){

            },
          ),
        );
      },
    );

  }

}
