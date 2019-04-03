import 'package:flutter/material.dart';
import 'package:sample_hr/controllers/home.controller.dart';
import 'package:sample_hr/services/department.service.dart';
import 'package:sample_hr/services/theme.service.dart';
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
      appBar: MainAppBar(context,title: 'Home Page'),
      key: _controller.key,
      drawer: 
      Theme(
        data:ThemeService.getMainTheme(),
        child:getDrawer(),
      ),

      body: ListView(
        children: <Widget>[
          Card(
              margin: EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  Text('Total Number of Departments:',
                  style: Theme.of(context).textTheme.title,),
                  SizedBox(height: 15.0),
                  StreamBuilder(
                    stream: DepartmentService.countStream,
                    builder: (_,snap){
                      if(!snap.hasData) return Text('loading...');
                      return Text(snap.data.toString(), 
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 30.0),
                        textAlign: TextAlign.center,);
                    },
                  ),
                  // Text(_controller.departmentCount?.toString() ?? 'loading..'),
                  SizedBox(height: 15.0),
                ],
              )),
              Text('any data hereany data hereany data hereany data hereany data hereany data hereany data hereany data hereany data hereany data hereany data hereany data hereany data hereany data hereany data here',
              //style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center)
        ],
      ),
    );
  }

  getDrawer() {
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
