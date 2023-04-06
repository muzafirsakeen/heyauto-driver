import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../contacts.dart';
import '../dashboard.dart';
import '../drawer_header.dart';
import '../events.dart';
// import '../location/driverlocation.dart';
import '../notes.dart';
import '../notifications.dart';
import '../profile.dart';
import '../send_feedback.dart';
import '../settings.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;
  bool isSwitched = false;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = GHomePage();
    } else if (currentPage == DrawerSections.profile) {
      container = Profile();
    } else if (currentPage == DrawerSections.events) {
      container = EventsPage();
    } else if (currentPage == DrawerSections.notes) {
      container = NotesPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationsPage();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = ContactsPage();
    } else if (currentPage == DrawerSections.contact) {
      container = SendFeedbackPage();
    }
    return Scaffold(

      drawer: new Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyHeaderDrawer(),
              MyDrawerList(),
            ],
          ),
        ),
      ),






      appBar: AppBar(
        backgroundColor: Color(0xffffffff),

        // backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.wrap_text_outlined,color: Color(0xFF424141),),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      actions: [

        Container(
          padding: EdgeInsets.all(10),
          child: FlutterSwitch(
            width: 80.0,
            height: 30.0,
            valueFontSize: 10.0,
            toggleSize: 25.0,
            value: status,
            borderRadius: 30.0,
            padding: 8.0,
            showOnOff: true,

            onToggle: (val) {
              setState(() {
                status = val;


              });
            },
          ),
        ),
        Divider()
      ],
      ),

      body:

      container,

    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Home", Icons.home_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Profile", Icons.people_alt_outlined,
              currentPage == DrawerSections.profile ? true : false),
          menuItem(3, "Trip History", Icons.local_taxi_outlined,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "SOS", Icons.sos_outlined,
              currentPage == DrawerSections.notes ? true : false),
          Divider(),
          menuItem(5, "Choose Language", Icons.language,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Vehicle Details", Icons.electric_rickshaw_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          Divider(),
          menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections. contact ? true : false),
          menuItem(8, "Logout", Icons.logout,
              currentPage == DrawerSections.send_feedback ? true : false),

        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.profile;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.contact
              ;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  send_feedback,
  events,
  notes,
  settings,
  notifications,
  profile,
  contact,

}