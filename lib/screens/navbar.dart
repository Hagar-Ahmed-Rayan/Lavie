
//................
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';


class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLoginCubit, ShopLoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=ShopLoginCubit.get(context);
        return Scaffold(
          body:cubit.screens[cubit.currentIndex],
          bottomNavigationBar:CurvedNavigationBar(
            items:  <Widget>[
              ImageIcon(
                AssetImage("images/lavie.png"),
                color: cubit.currentIndex==0?Colors.white:Colors.black,
              ),
              ImageIcon(
                AssetImage("images/qrcode.png"),
                color: cubit.currentIndex==1?Colors.white:Colors.black,
              ),


              ImageIcon(
                AssetImage("images/rectangle.png"),
                color: cubit.currentIndex==2?Colors.white:Colors.black,
              ),


              Icon(Icons.notification_add_rounded, size: 30,
                color: cubit.currentIndex==3?Colors.white:Colors.black,
              ),


              Icon(Icons.person, size: 30,
                color: cubit.currentIndex==4?Colors.white:Colors.black,
              ),
            ],
            index: cubit.currentIndex,
            height: 60.0,
            color: Colors.green,
            buttonBackgroundColor: Colors.green,
            backgroundColor: Colors.white,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 600),
            onTap: (index) {
              cubit.changeBottom(index);
            },
            letIndexChange: (index) => true,
          ),
        );
      },
    );
  }
}
