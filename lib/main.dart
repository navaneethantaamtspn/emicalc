import 'package:emicalc/cubit/emi_cubit.dart';
import 'package:emicalc/designs/designs.dart';
import 'package:emicalc/ui/dialog.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,

        ),
        debugShowCheckedModeBanner : false,
        home:MyHomePage(),
      );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: 
        SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,

            padding: EdgeInsets.all(20),
            color: Color.fromRGBO(224,243,255, 1),
            child: Column(

              children: [
                design.Txtvolk('Emi Calculator', FontWeight.w600, 38, Colors.black),
                SizedBox(height: 20,),
                Container(
                    height:MediaQuery.of(context).size.height/3 ,
                    child: Image.network('https://cdn.dribbble.com/users/218217/screenshots/3610718/first_scene_blue_800x600_2_dribbble.gif')),
                SizedBox(height: 50,),
                design.Txtvolk('Press The Button To Use Emi Calc..', FontWeight.w400, 28, Color.fromRGBO(7,92,168, 1)),
                SizedBox(height: 60,),
                GestureDetector(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (context) {
                          return
                            dialog();
                        });
                  },
                  child: Container(
                    width: 140,
                    height: 60,
                    decoration: design.boxdec(),
                    child: Center(
                      child: design.Txtvolk('Press', FontWeight.w400, 28, Colors.black),
                    ),

                  ),
                )

              ],
            ),
          ),
        ),

      );

  }
}





