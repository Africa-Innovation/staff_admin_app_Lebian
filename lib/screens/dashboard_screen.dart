 

import 'package:admin_dashboard/screens/Notification_screen.dart';
import 'package:admin_dashboard/screens/city_screen.dart';
import 'package:admin_dashboard/screens/home_screen.dart';
import 'package:admin_dashboard/screens/list_city.dart';
import 'package:admin_dashboard/screens/time_screen.dart';
import 'package:admin_dashboard/screens/update_city.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isExpanded = false;
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
 
        return Scaffold(
          appBar: AppBar(
            title: Text("STAF"),
            backgroundColor: Colors.deepPurple.shade400,
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  selected: _currentIndex == 0,
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                      _pageController.animateToPage(
                        _currentIndex,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      Navigator.pop(context);
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.bar_chart),
                  title: Text("Time"),
                  selected: _currentIndex == 1,
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                      _pageController.animateToPage(
                        _currentIndex,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      Navigator.pop(context);
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.notifications_outlined),
                  title: Text("Notifications"),
                  selected: _currentIndex == 2,
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                      _pageController.animateToPage(
                        _currentIndex,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      Navigator.pop(context);
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.location_city_outlined),
                  title: Text("City"),
                  selected: _currentIndex == 3,
                  onTap: () {
                    setState(() {
                      _currentIndex = 3;
                      _pageController.animateToPage(
                        _currentIndex,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      Navigator.pop(context);
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.location_city_outlined),
                  title: Text(" list City"),
                  selected: _currentIndex == 4,
                  onTap: () {
                    setState(() {
                      _currentIndex = 4;
                      _pageController.animateToPage(
                        _currentIndex,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      Navigator.pop(context);
                    });
                  },
                ),
                
              ],
            ),
          ),
           body: CustomScrollView(
  slivers: <Widget>[
    SliverList(
      delegate: SliverChildListDelegate(
        [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              Container(
                height: 500.0,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  children: [
                    HomeScreen(),
                    ManageTime(),
                    ManageNotification(),
                    ManageCity(),
                    ListCity(),
                   ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ],
),

        );
      },
    );
  }
}
 