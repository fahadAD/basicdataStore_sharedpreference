import 'package:flutter/material.dart';
import 'package:practise1/main3.dart';
import 'package:shared_preferences/shared_preferences.dart';
  class Screen1 extends StatefulWidget {
  const Screen1({super.key,});

 @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
    Datamodel _datamodel2=Datamodel(phone: '',email: '',name: '');
    getData()async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      _datamodel2.name=prefs.getString("name_s")??'';
      _datamodel2.email=prefs.getString("email_s")??'';
      _datamodel2.phone=prefs.getString("number_s")??'';
      setState(() {

      });
    }
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
       appBar: AppBar(),
      body: Column(
        children: [

        ListTile(
          leading: Icon(Icons.person_pin),
          title: Text("${_datamodel2.name}",style: TextStyle(fontWeight: FontWeight.bold)),
        ),

          ListTile(
            leading: Icon(Icons.email),
            title: Text("${_datamodel2.email}",style: TextStyle(fontWeight: FontWeight.bold)),
          ),

          ListTile(
            leading: Icon(Icons.call),
            title: Text("${_datamodel2.phone}",style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
