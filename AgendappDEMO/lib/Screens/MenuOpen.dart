
import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/Talk.dart';
import 'package:flutter_login_page/Screens/Account_Screen/Account_Screen.dart';
import 'package:flutter_login_page/Screens/All_Talks_Screen/AllTalks.dart';
import 'package:flutter_login_page/Screens/Schedule_List_Screen/home.dart';

final List<Talk> _talkList = [
    new Talk("08:00", "09:00", "Have coffe with Sam", "Personal", false),
    new Talk("10:00", "11:00", "Meet with sales", "Work", true),
    new Talk("12:00", "13:00", "Call Tom about appointment", "Work", true),
    new Talk("14:00", "15:00", "Fix onboarding experience", "Work", false),
    new Talk("16:00", "16:00", "Edit API documentation", "Personal", false),
    new Talk("18:00", "17:00", "Setup user focus group", "Personal", true),
  ];


class MenuPage extends StatefulWidget {
  MenuPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MenuPageState createState() => _MenuPageState();
}


class _MenuPageState extends State<MenuPage> {

int _selectedIndex = 0;
String texto = "Schedule";
bool _isVisible = true;

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
    if(index == 0){
      texto = "Schedule";
      _isVisible = true;
    }
    else if(index == 1){
      texto = "Tasks";
      _isVisible = false;
    }
    else if (index == 2){
      texto = "Account";
      _isVisible = false;
    }
  });
}

final List<Widget> _children = [
  MyHomePage(talkList: _talkList),
  MyAllTalksPage(talkList: _talkList),
  MyAccountPage(),
];

Icon sheduleIcon = new Icon (Icons.calendar_today);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          title: Text(
          texto,
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          ),
        backgroundColor: Color(0xFF28316C),  
      ),

      body: _children[_selectedIndex],

      floatingActionButton: Visibility(
        visible: _isVisible,
        child: Container(
          height: 50,
          child: FloatingActionButton(
              child: IconButton(
                icon: sheduleIcon,
                onPressed: () {
                  setState((){
                    if(this.sheduleIcon.icon == Icons.format_list_bulleted)
                      this.sheduleIcon = new Icon(Icons.calendar_today);
                    else
                      this.sheduleIcon = new Icon(Icons.format_list_bulleted);
                  }); 
                },
              ),
              onPressed: () {
                null;
              },       
          ),  
        ),
      ),
        

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.yellow,
            icon: Icon(Icons.access_time),
            title: Text(
              'Schedule',
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.content_copy),
            title: Text(
              'All talks',
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.account_circle),
            title: Text(
              'Account',
            ),
          ),
        ],
      currentIndex: _selectedIndex,
      unselectedItemColor: Color(0xFF28316C),
      selectedItemColor: Color(0xFF28316C),
      selectedIconTheme: IconThemeData(size: 38, color: Color(0xFF28316C)),
      unselectedIconTheme: IconThemeData(size: 25, color: Color(0x9F28316C)),
      onTap: _onItemTapped,
    ),
    );
  }
}