import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodapp/model/meal.dart';
import 'package:foodapp/view/navBarPages/home.dart';
import 'package:foodapp/view/navBarPages/notifyPage.dart';
import 'package:foodapp/view/navBarPages/profile.dart';
import 'package:foodapp/view/navBarPages/scanPage.dart';
import 'package:foodapp/view/navBarPages/uploadPage.dart';
import 'package:foodapp/view_model/mainProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  Meal? meal;
  int? index;
  HomePage({super.key, this.meal,this.index});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = const[
    Home(),
    UploadPage(),
    ScanPage(),
    NotifyPage(),
    ProfilePage(),
  ];
  Color color = const Color(0xff9FA5C0);
  Color colorSelect = const Color(0xff1FCC79);


  @override
  Widget build(BuildContext context) {
      return SafeArea(
          child: Scaffold(
            body: _pages[_selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              items:  <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Image.asset("assets/icons/home.png",width: 24,height: 24,color: _selectedIndex == 0 ? colorSelect : color,),
                    label: "Home"
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/icons/edit.png",width: 24,height: 24,color: _selectedIndex == 1 ? colorSelect : color,),
                  label: "Upload",
                ),
                BottomNavigationBarItem(
                    icon: Image.asset("assets/icons/scan.png",width: 24,height: 24,color: _selectedIndex == 2 ? colorSelect : color,),
                    label: "Scan"
                ),
                BottomNavigationBarItem(
                    icon: Image.asset("assets/icons/notify.png",width: 24,height: 24,color: _selectedIndex == 3 ? colorSelect : color,),
                    label: "Notification"
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/icons/profile.png",width: 24,height: 24,color: _selectedIndex == 4 ? colorSelect : color,),
                  label: "Profile",
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: const Color(0xff1FCC79),
              unselectedItemColor: const Color(0xff9FA5C0),
              showUnselectedLabels: true,
            ),
          )
      );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    //  color = Color(0xff1FCC79);
    });
  }
}


