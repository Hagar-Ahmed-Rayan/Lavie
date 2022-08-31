
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/screens/login.dart';
import 'package:plantsshop/screens/sign_up.dart';
import 'package:plantsshop/shared/components.dart';


class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({
    Key? key,
    this.email,
    this.otp
  }) : super(key: key);
  String? email;
  String? otp;

  @override
  Widget build(BuildContext context) {
    var passwordController=TextEditingController();
    var passwordController2=TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<ShopLoginCubit, ShopLoginStates>(
      listener: (context, states) {
        if(states is ResetPasswordSuccessState)
        {
          if(states.message=='Success') {
            navto(context, const loginscreen());
          }
        }
      },
      builder: (context, states) {
        var cubit = ShopLoginCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            title: const Text('Reset Password'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const Text('Enter New Password',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),),
                    const SizedBox(
                      height: 20,
                    ),

                    defaultFormField(

                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      label: "Password",
                      validate: (value){
                        RegExp regEx = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");
                        if(value.isEmpty)
                        {
                          return "Password must not be empty";
                        }
                        if(value!=passwordController2.text)
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

                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    defaultFormField(

                      controller: passwordController2,
                      type: TextInputType.visiblePassword,
                      label: "Confirm Password",
                      validate: (value){
                        RegExp regEx = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");
                        if(value.isEmpty)
                        {
                          return "Password must not be empty";
                        }
                        else if(value!=passwordController.text)
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

                    ),


                    const SizedBox(height: 20,),
                    Conditional.single(
                      context: context,
                      conditionBuilder: (BuildContext context) =>
                      states is !ResetPasswordLoadingState,
                      widgetBuilder: (BuildContext context) =>

                          Container(
                            width: 300,
                            height: 50.0,
                            child: MaterialButton(
                              onPressed: (){
                                print(('###########'));

                                if (formKey.currentState!.validate()) {

                                  cubit.resetPassword(
                                    otp: otp,
                                    email: email,
                                    password: passwordController2.text,
                                  );
                                }




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






                      fallbackBuilder: (BuildContext context) =>
                      const Center(child: CircularProgressIndicator()),
                    ),



                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

  }
}
