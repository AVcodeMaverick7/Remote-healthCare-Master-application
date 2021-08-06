import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:proceedit_dyhealth/dummy.dart';
import 'package:proceedit_dyhealth/emergency_contacts.dart';
import 'package:proceedit_dyhealth/mpconstants.dart';
import 'package:proceedit_dyhealth/gradient_text.dart';
import 'package:proceedit_dyhealth/ind_components/bmi_calc/input_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:proceedit_dyhealth/ind_components/notes/view/note_list.dart';
import 'package:proceedit_dyhealth/other_apps.dart';
import 'package:proceedit_dyhealth/saved_info.dart';
import 'package:proceedit_dyhealth/reminders.dart';
import 'package:proceedit_dyhealth/user_profile.dart';
import 'package:proceedit_dyhealth/ind_components/heartattack_risk/views/input_screen.dart';

// import 'package:proceedit_dyhealth/ind_components/news_viewer/src/screens/news_list.dart';
// import 'package:proceedit_dyhealth/ind_components/news_viewer/src/blocs/stories/stories_provider.dart';
// import 'package:proceedit_dyhealth/ind_components/news_viewer/src/screens/news_detail.dart';
// import 'package:proceedit_dyhealth/ind_components/news_viewer/src/screens/login_screen.dart';
// import 'package:proceedit_dyhealth/ind_components/news_viewer/src/blocs/comments/comments_provider.dart';
// import 'package:proceedit_dyhealth/ind_components/news_viewer/src/app.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('   Remote HealthCare +'),
        backgroundColor: Colors.redAccent,
        leading: Transform.scale(
          scale: 3.1,
          child: Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Image.asset(
              'images/logo.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          backgroundColor: Colors.white,
          color: Colors.redAccent,
          // buttonBackgroundColor: Colors.redAccent,
          height: 55,
          items: [
            Icon(Icons.add, size: 30),
            Icon(Icons.favorite, size: 30),
            Icon(Icons.contacts, size: 30),
            Icon(Icons.add_alert, size: 30),
            Icon(Icons.person,size: 30,
            )
          ],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
          if (_page==0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => OtherApps()));
          }
          else if (_page==1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SavedInfo()));
          } else if (_page==2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Contacts()));
          }
            else if (_page==3) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Reminders()));
          } else if (_page==4) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));
          }
        },
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/background.png'),fit: BoxFit.fill)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.0,
              ),
              GradientText('HealthCare Apps',gradient: kGradientText),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.only(left: 8.0),
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InputScreen(),
                              ));
                        },
                        child: Container(
                          height: 120.0,
                          width: 170.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/bmifit.png'),
                              fit: BoxFit.fill,),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyForm(),
                              ));
                        },
                        child: Container(
                          height: 120.0,
                          width: 170.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/harp.png'),
                              fit: BoxFit.fill,),
                            borderRadius: BorderRadius.circular(10.0),
                          ),

                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.only(left: 8.0),
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=> NoteList(),
                          ),);
                        },
                        child: Container(
                          height: 120.0,
                          width: 170.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/notesfit.png'),
                              fit: BoxFit.fill,),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: (){
                          print('Tapped');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Dummy(),
                              ));
                        },
                        child: Container(
                          height: 120.0,
                          width: 170.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/secretsfit.png'),
                              fit: BoxFit.fill,),
                            borderRadius: BorderRadius.circular(10.0),
                          ),

                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.only(left: 8.0),
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: (){
                          print('Tapped');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Dummy(),
                              ));
                        },
                        child: Container(
                          height: 120.0,
                          width: 170.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/weighttrack.png'),
                              fit: BoxFit.fill,),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: (){
                          print('Tapped');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Dummy(),
                              ));
                        },
                        child: Container(
                          height: 120.0,
                          width: 170.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/geolocator.png'),
                              fit: BoxFit.fill,),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],),
        ),
      ),
    );
  }
}