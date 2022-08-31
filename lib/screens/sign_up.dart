import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/screens/navbar.dart';
import 'package:plantsshop/shared/components.dart';


class AuthScreen extends StatelessWidget  {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var emailSignUpController = TextEditingController();
    var passwordSignUpController = TextEditingController();
    var confirmPasswordSignUpController = TextEditingController();
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
    return BlocProvider(

      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, states) {


        },
        builder: (context, states) {
          var cubit = ShopLoginCubit.get(context);

          return Scaffold(

            body: SafeArea(
              child: Stack(
                children: [
                  Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(35.0),
                          child: Center(
                            child: Column(
                              children: [
                                const Image(
                                  image: AssetImage('images/lavie.png'),
                                  height: 50,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  //width: double.maxFinite,
                                  height: 500,
                                  child:  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 50,),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: defaultFormField(
                                                  label: 'First Name',
                                                  controller: firstNameController,
                                                  type: TextInputType.name,
                                                  validate:  (String? value){
                                                    if(value!.isEmpty)
                                                    {
                                                      return 'First name must not be empty';
                                                    }
                                                    if(value.length<3)
                                                    {
                                                      return 'Should be more than 3 Characters';
                                                    }
                                                  },
                                              ),
                                            ),
                                            const SizedBox(width: 10,),
                                            Expanded(
                                              child: defaultFormField(controller: lastNameController,
                                                  label: 'Last Name',
                                                  type: TextInputType.name,
                                                  validate: (String? value){
                                                    if(value!.isEmpty)
                                                    {
                                                      return 'last name must not be empty';
                                                    }
                                                    if(value.length<3)
                                                    {
                                                      return 'Should be more than 3 Characters';
                                                    }
                                                  },
                                              ),
                                            ),

                                          ],
                                        ),
                                        const SizedBox(height:
                                        20,),
                                        defaultFormField(
                                          //fontColor: Cubit.get(context).isDark?Colors.white:Colors.black,
                                          controller: emailSignUpController,
                                          type: TextInputType.emailAddress,
                                          label: "Email address",
                                          validate: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'email must be not empty';
                                            }
                                            else if (!value.toString().contains('@') ||
                                                !value.toString().contains('.com')) {
                                              return 'ex: example@mail.com';
                                            } else {
                                              return null;
                                            }



                                          },
                                        //  prefixIcon: IconBroken.Add_User,

                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),

                                        defaultFormField(
                                          //fontColor:Cubit.get(context).isDark?Colors.white:Colors.black,


                                          controller: passwordSignUpController,
                                          type: TextInputType.visiblePassword,
                                          label: "Password",
                                          validate: (value){
                                            RegExp regEx = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");
                                            if(value.isEmpty)
                                            {
                                              return "Password must not be empty";
                                            }
                                            if(value!=confirmPasswordSignUpController.text)
                                            {
                                              return "Password must be same";
                                            }
                                            else if(value.length<8)
                                            {
                                              return 'Should be more than 8 Characters';
                                            }
                                            else if (!value.toString().contains(regEx)) {
                                              return 'Use Numbers and Capital and Small Characters at least 1';
                                            } else {
                                              return null;
                                            }
                                          },
                                        /*  prefixIcon: IconBroken.Unlock,
                                          isPassword: cubit.isPassword2,
                                          suffixIcon: cubit.suffix2, */
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),

                                        defaultFormField(
                                          //fontColor:Cubit.get(context).isDark?Colors.white:Colors.black,

                                          controller: confirmPasswordSignUpController,
                                          type: TextInputType.visiblePassword,
                                          label: "Confirm Password",
                                          validate: (value){
                                            RegExp regEx = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");
                                            if(value.isEmpty)
                                            {
                                              return "Password must not be empty";
                                            }
                                            else if(value!=passwordSignUpController.text)
                                            {
                                              return "Password must be same";
                                            }
                                            else if(value.length<8)
                                            {
                                              return 'Should be more than 8 Characters';
                                            }
                                            else if (!value.toString().contains(regEx)) {
                                              return 'Use Numbers and Capital and Small Characters at least 1';
                                            } else {
                                              return null;
                                            }
                                          },
                                         /* prefixIcon: IconBroken.Unlock,
                                          isPassword: cubit.isPassword2,
                                          suffixIcon: cubit.suffix2,*/
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),


                                        Container(
                                          width: 300,
                                          height: 50.0,
                                          child: MaterialButton(
                                            onPressed: (){




                                               /* ShopLoginCubit.get(context).userLogin(
                                                  email: emailController.text,
                                                  password: passwordController.text,
                                                );*/

                                                navto(context,HomeLayoutScreen());




                                              //            if(ShopLoginCubit.get(context).sucessmess=='Success')


                                            },
                                            // function,
                                            child: Text(
                                              'sign up',
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
                                        const SizedBox(
                                          height: 20,
                                        ),


                                        Row(
                                          children: [
                                            Checkbox(
                                          //    value: cubit.registerIsChecked,
                                              onChanged: (value){
                                                //cubit.registerRememberMe(value);
                                              }, value: false,
                                            ),
                                            const Text(
                                              'Remember me?',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),

                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: 1.0,
                                                color: Colors.green,
                                              ),
                                            ),

                                            const Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8),
                                              child: Text(
                                                'or continue with',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,

                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 1.0,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:  [
                                            InkWell(
                                              onTap:(){
                                                print('yess');
                                                cubit.signUpWithGoogle();
                                              } ,
                                              child: const Image(
                                                image: AssetImage('images/google.png'),

                                              ),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            InkWell(
                                              onTap: (){},
                                              child: const Image(
                                                image: AssetImage('images/facebook.png'),

                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),


                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: SizedBox(
                      child: Image.asset(
                        'images/top.png',
                      ),
                    ),

                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: SizedBox(
                      child: Image.asset(
                        'images/bottom.png',
                      ),
                    ),

                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

