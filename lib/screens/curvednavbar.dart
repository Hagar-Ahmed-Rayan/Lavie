


import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/screens/QR%20scan.dart';
import 'package:plantsshop/screens/carditems.dart';
import 'package:plantsshop/screens/disscussform.dart';
import 'package:plantsshop/screens/homescreen.dart';
import 'package:plantsshop/screens/profile.dart';
import 'package:plantsshop/screens/quiz-screen.dart';
import 'package:plantsshop/screens/splash.dart';
import 'package:plantsshop/shared/endpoints.dart';

class curvednav extends StatefulWidget {
  const curvednav({Key? key}) : super(key: key);

  @override
  _curvednavState createState() => _curvednavState();
}
int _selectedIndex = 0;

const List<Widget> homescreens =[
  disscussscreen(),

  QRScanner(),




  homescreen(),

 // profile(),
  quizscreen(),

  profile(),
  //carditems()


];

class _curvednavState extends State<curvednav> {
  @override

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit()..getMyPosts(TOKEN),
      child:
       BlocConsumer<ShopLoginCubit, ShopLoginStates>(

      listener: (context, state) {},
      builder: (context, state) {
    return Scaffold(
    body: Center(
      child: homescreens[_selectedIndex],
    ),

    bottomNavigationBar: CurvedNavigationBar(

      backgroundColor: Colors.green,
      items: <Widget>[
        Image(image: AssetImage('images/leave.png')),
        Image(image: AssetImage('images/qrcode.png')),
        Image.asset('images/rectangle.png',
          //   height: 50,
          color: Colors.black,


        ),


        Icon(Icons.notification_add_rounded, size: 30),
        Icon(Icons.person, size: 30),


      ],


      onTap: _onItemTapped,




    ),



    );
  },
  )
    );
}
}