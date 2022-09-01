import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/models/LognModel.dart';
import 'package:plantsshop/screens/addressscreen.dart';
import 'package:plantsshop/screens/curvednavbar.dart';
import 'package:plantsshop/screens/forgetpassscreen.dart';
import 'package:plantsshop/screens/navbar.dart';
import 'package:plantsshop/shared/cache.dart';
import 'package:plantsshop/shared/components.dart';
import 'package:plantsshop/screens/splash.dart';
import 'package:plantsshop/shared/endpoints.dart';

class loginscreen extends StatelessWidget {
  const loginscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var formKey = GlobalKey<FormState>();

      var emailController = TextEditingController();
      var passwordController = TextEditingController();


  //  print(ShopLoginCubit.get(context).loginModel!.user!.address!);
    return BlocProvider(
      create: (BuildContext context)=>ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener: (context,state){



          if(state is ShopLoginSuccessState )
          {
            navto(context, const HomeLayoutScreen());


            print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@1");

            print(ShopLoginCubit.get(context).loginModel['data']['user']['address']);
            print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@3");
          /*  if(ShopLoginCubit.get(context).loginModel['data']['user']['address']!=null)
            {


              navto(context, const HomeLayoutScreen());

            }
          else{
            ShopLoginCubit.get(context).determinePosition();
            navto(context,  AddressScreen());
         }*/

          }


    if (state is ShopLoginSuccessState) {
      print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2");

    }

    },
        builder: (context,state){
           return SafeArea(
            child: Center(
              child: Scaffold(


                  appBar:null

                  ,
                  body:
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.asset('images/lavie.png',
                            //   height: 50,


                          ),

                          Image(image: AssetImage('images/branding.png')),

                          Row(

                            children: [



                              defaultTextButton(
                                function: () {
                                  navto(
                                    context,
                                    splashscreen(),
                                  );
                                },
                                text: 'Sign up',

                              ),

                              SizedBox(
                                  width:200
                              ),
                              defaultTextButton(
                                function: () {
                                  navto(
                                    context,
                                    splashscreen(),
                                  );
                                },
                                text: 'log in',
                              ),




                            ],


                          ),




                          Form(
                              key: formKey,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [



                                    defaultFormField(
                                      controller: emailController,
                                      type: TextInputType.emailAddress,
                                      validate: (dynamic? value) {
                                        if (value!.isEmpty) {
                                          return 'please enter your email address';
                                        }
                                      },
                                      label: 'Email Address',
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),


                                    defaultFormField(
                                      controller: passwordController,
                                      type: TextInputType.visiblePassword,
                                      label: 'Password',
                                      validate: (dynamic? value) {
                                        if (value!.isEmpty)
                                          return 'password is too short';

                                      },


                                     /* onSubmit: (value) {
                                        if (formKey.currentState!.validate()) {
            ShopLoginCubit.get(context).userLogin(
            email: emailController.text,
            password: passwordController.text,
            );
            };
                                      },*/
                                    ),
                                  ]
                              )
                          ),
                          //   isPassword: ShopLoginCubit.get(context).isPassword,

                          SizedBox(
                            height: 50.0,
                          ),



                        Container(
                          width: 300,
                          height: 50.0,
                          child: MaterialButton(
                            onPressed: (){

                              if (formKey.currentState!.validate()) {

                                print((emailController.text));
                                print((passwordController.text));

                                ShopLoginCubit.get(context).userLogin(
          email: emailController.text,
          password: passwordController.text,
          );

                           //    navto(context,HomeLayoutScreen());

                           //          navto(context,AddressScreen());

                              }

                              print(('##############'));
         //            if(ShopLoginCubit.get(context).sucessmess=='Success')


                            },
                            // function,
                            child: Text(
                               'log in',
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

                          SizedBox(
                            height: 30,

                          ),


                      Column(
                        children: [

                          GestureDetector
                            ( onTap: (){
                            navto(context, ForgetPasswordScreen());
                          },
                              child:
                              Text(' forget password?')),

                          SizedBox(
                            width: 5,

                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Container(
                                  width: 80,
                                  height: 2.0,
                                  decoration: BoxDecoration(
                                    color: Colors.green,

                                  ),

                                ),
                                SizedBox(
                                  width: 5,

                                ),


                                Text('OR Continue with'),
                                SizedBox(
                                  width: 5,

                                ),

                                Container(
                                  width: 80,
                                  height: 2.0,
                                  decoration: BoxDecoration(
                                    color: Colors.green,

                                  ),

                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,

                          ),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Row(
                              children: [

                                GestureDetector(
                                  onTap: () {

navto(context, splashscreen());
      //    ShopLoginCubit.get(context).showplantsinfo();




                                  }, // Image tapped
                                  child: Image.asset(
                                    'images/facebook.png',
                                    fit: BoxFit.cover, // Fixes border issues
                                   // width: 110.0,
                                    //height: 110.0,
                                  ),
                                ),

                             //   Image.asset('images/fcebook.png',
                                  //   height: 50,


                                SizedBox(
                                  width: 200,

                                ),

                                GestureDetector(
                                  onTap: () {



                                    ShopLoginCubit.get(context).postgoogle(

                                      id: "098",
                                     email:"gogyrayan456@gmail.com",
                                     firstname:"hagar",
                                      lastname:"rayan",
                                        picture:"https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg",
                                    );
                                  }, // Image tapped
                                  child: Image.asset(
                                    'images/google.png',
                                    fit: BoxFit.cover, // Fixes border issues
                                  //  width: 110.0,
                                    //height: 110.0,
                                  ),
                                ),
                            //    Image(image: AssetImage('images/google.png')),


                              ],

                            ),
                          ),

                        ],
                      )


                        ],



                      ),
                    ),
                  )


              ),
            ),
          );

        }

      ),
    );
  }
}
