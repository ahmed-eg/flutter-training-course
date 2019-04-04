import 'package:flutter/material.dart';
import 'package:sample_hr/controllers/home.controller.dart';
import 'package:sample_hr/services/app_localizations.dart';
import 'package:sample_hr/services/department.service.dart';
import 'package:sample_hr/services/theme.service.dart';
import 'package:sample_hr/views/widgets/app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  HomeController _controller;
  @override
  void initState() {
    _controller = HomeController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(context,title: AppLocale.translate(context, 'Home Page')
      ,actions: <Widget>[
        IconButton(icon:Icon(Icons.refresh), onPressed: _controller.onRefresh)
      ],),
      key: _controller.key,
      drawer: 
      Theme(
        data:ThemeService.getMainTheme(),
        child:getDrawer(),
      ),

      body: ListView(
        children: <Widget>[
          SizedBox(height: _controller.size1),
          dashboardCard('Total Number of Departments:',StreamBuilder(
                    stream: DepartmentService.countStream,
                    builder: (_,snap){
                      if(!snap.hasData) return Text('loading...');
                      return Text(snap.data.toString(), 
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 30.0),
                        textAlign: TextAlign.center,);
                    },
                  )),
          SizedBox(height: _controller.size2),
          dashboardCard('Total Number of Employees:',Text('100')),
          SizedBox(height: _controller.size3),
          dashboardCard('Total Number of Groups:',Text('300')),
          SizedBox(height: _controller.size4),
          dashboardCard('Total Number of XXX:',Text('0')),
              //Text('any data hereany data hereany data hereany data hereany data hereany data hereany data hereany data hereany data hereany data hereany data hereany data hereany data hereany data hereany data here',
              //style: Theme.of(context).textTheme.title,
              //textAlign: TextAlign.center)
        ],
      ),
    );
  }

  dashboardCard(String title,Widget body){
    return Card(
              margin: EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(AppLocale.translate(context,title),
                  style: Theme.of(context).textTheme.title,),
                  SizedBox(height: 15.0),
                  body,
                  // Text(_controller.departmentCount?.toString() ?? 'loading..'),
                  SizedBox(height: 15.0),
                ],
              ));
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
