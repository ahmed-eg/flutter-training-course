import 'package:flutter/material.dart';
import 'package:sample_hr/controllers/home.controller.dart';
import 'package:sample_hr/views/widgets/app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _controller;
  @override
  void initState() {
    _controller = HomeController(this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Home Page'),
      key: _controller.key,
      drawer: getDrawer(),
      body: ListView(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(25.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 15.0,),
                Text('Total Number of Employees:'),
                Text('100'),
                SizedBox(height: 15.0,),
              ],
            )
          )
        ],
      ),
    );
  }

  getDrawer(){
    return Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('User Name'),
              accountEmail: Text('ahmed-eg@live.com'),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              title: Text('Departments'),
              leading: Icon(Icons.developer_board),
              onTap: _controller.onDepartment,
            ),
            ListTile(
              title: Text('Employees'),
              leading: Icon(Icons.people),
              onTap: _controller.onEmployee,
            )
          ],
        ),
      );
  }
}