import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practise1/main3.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main2.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
GlobalKey<FormState> _form=GlobalKey<FormState>();
 // Datamodel _datamodel1=Datamodel(name: '',email: '',phone: '');

TextEditingController nameController=TextEditingController();
TextEditingController emailController=TextEditingController();
TextEditingController numberController=TextEditingController();
getData()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  nameController.text=prefs.getString("name_s")??'';
  emailController.text=prefs.getString("email_s")??'';
  numberController.text=prefs.getString("number_s")??'';
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
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Screen1(),));
      },child: Icon(Icons.arrow_forward),),
      body: Form(
        key: _form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

             TextFormField(
               controller: nameController,
               // onChanged: (value) {
               //   _datamodel1.name=value;
               // },
               validator: (value) {
                 if(value?.isEmpty?? false){
                   return "Name Required";
                 }return null;
               },
             ),

          TextFormField(
            controller: emailController,
            // onChanged: (value) {
            //   _datamodel1.email=value;
            // },
            validator: (value) {
              if(value?.isEmpty?? false){
                return "Email Required";
              }return null;
            },
          ),
            TextFormField(
              controller: numberController,
              // onChanged: (value) {
              //   _datamodel1.phone=value;
              // },
              validator: (value) {
                if(value?.isEmpty?? false){
                  return "Number Required";
                }return null;
              },
            ),
            ElevatedButton(onPressed: () async{
              final SharedPreferences prefs = await SharedPreferences.getInstance();

            if(_form.currentState?.validate()??false){
              prefs.setString("name_s", "${nameController.text}");
              prefs.setString("email_s", "${emailController.text}");
              prefs.setString("number_s", "${numberController.text}");

              Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => Screen1(),
                  ));
            }

            }, child: Text("press"))

          ],
        ),
      ),
     );
  }
}
