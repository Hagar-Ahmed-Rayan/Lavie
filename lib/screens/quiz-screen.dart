


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/shared/cache.dart';
import 'package:plantsshop/shared/endpoints.dart';

class quizscreen  extends StatelessWidget {
  const quizscreen({Key? key}) : super(key: key);



 @override
  Widget build(BuildContext context) {


    //DateTime  oldtime ;
   // abs (newtime.day-OLDTIME.day)>=7;
     //(newtime.day-OLDTIME.day).abs()>=7

   return BlocConsumer<ShopLoginCubit, ShopLoginStates>(
   listener: (context, state) {},
   builder: (context, state) {
     ShopLoginCubit.get(context).showquiz();


     DateTime newtime=DateTime.now();//22
     int newdaytime=newtime.minute;
     int  olddaytime= CacheHelper.getData(key: 'oldtime');
     int num=(newdaytime-olddaytime).abs();





     return
     Scaffold(

      appBar: null,
      body: (num>=1)?SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Text('quiz screen'),
              Container(
               width: 150,
               height: 50.0,
               child: MaterialButton(
                 onPressed: (){





                   DateTime    oldtime = DateTime.now();

                     newdaytime=DateTime.now().minute;


                   CacheHelper.saveData(key: 'oldtime', value: oldtime.minute);
                   ShopLoginCubit.get(context).showquiz();

                   /* Navigator.pushAndRemoveUntil(
                     context,
                     MaterialPageRoute(builder: (context) => quizscreen()), // this mainpage is your page to refresh
                         (Route<dynamic> route) => false,
                   );*/

               //    DateTime later = oldtime.add(const Duration(days: 7));//afteer 1 week
                   print(olddaytime);
                   print(newtime);
                   print(('******************************8********************'));
                   print(olddaytime);
                   print(newdaytime);
                   print(num);

                   print(('###############################'));



                 },
                 // function,
                 child: Text(
                   'submit',
                   style: TextStyle(
                     color: Colors.white,
                   ),
                 ),
               ),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(
                   3,
                 ),
                 color: Colors.green,
               ),
     ),
            ],
          ),
        ),
      ) :
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('images/pic.png',
            //   height: 50,
          ),



          SizedBox(
            height: 50,
          ),
          Text('not found'),
        ],
      ),
    /*  Center(
       child: CircularProgressIndicator(),

     )*/

















     /* SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Conditional.single(
  context: context,
  conditionBuilder: (BuildContext context) =>
  //true,
  (num>=2),
  //false,

  //OLDETIME==0||
              //168 hours
  //newtime-OLDTIME>=7,
  widgetBuilder: (BuildContext context) =>                         Container(
        width: 100,
        height: 100.0,
        child: MaterialButton(
          onPressed: (){
 //OLDTIME=DateTime.now();
            DateTime    oldtime = DateTime.now();
newdaytime=DateTime.now().minute;
            DateTime later = oldtime.add(const Duration(days: 7));//afteer 1 week
              print(olddaytime);
              print(newtime);
            CacheHelper.saveData(key: 'oldtime', value: oldtime.minute);
            print(('******************************8********************'));
print(olddaytime);
print(newdaytime);
          print(num);

            print(('###############################'));


          },
          // function,
          child: Text(
            'submit',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            3,
          ),
          color: Colors.green,
        ),
  ),

  fallbackBuilder: (BuildContext context) => Column(
  children: [
      Container(
        width: 100,
        height: 100.0,
        child: MaterialButton(
          onPressed: (){
            //OLDTIME=DateTime.now();
            DateTime    oldtime = DateTime.now();
            newdaytime=DateTime.now().minute;
            DateTime later = oldtime.add(const Duration(days: 7));//afteer 1 week
            print(olddaytime);
            print(newtime);
            CacheHelper.saveData(key: 'oldtime', value: oldtime.minute);
            print(('******************************8********************'));
            print(olddaytime);
            print(newdaytime);
            print(num);

            print(('###############################'));


          },
          // function,
          child: Text(
            'submit',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            3,
          ),
          color: Colors.green,
        ),
      ),
      Image.asset('images/pic.png',
        //   height: 50,
      ),




 Text('not found'),

  ],
  )
  ),
  ],
  ),
        ),
      ),*/
  );

   }

   );
 }
}