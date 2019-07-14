import 'package:flutter/material.dart';
import './schedule_visit.dart';
import './invite.dart';
import './setting_screen.dart';

class HomeScreen extends StatelessWidget {
  var cameras;

  HomeScreen(this.cameras);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.access_time)),
                Tab(icon: Icon(Icons.mail)),
                Tab(icon: Icon(Icons.settings)),
              ],
            ),
            title: Text('VMS'),
          ),
          body: TabBarView(
            children: [
              ScheduleVisit(cameras),
              Invite(),
              SettingScreen(cameras),
            ],
          ),
        ));
  }
}
