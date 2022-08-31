
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/screens/verify.dart';
import 'package:plantsshop/shared/components.dart';


class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<ShopLoginCubit, ShopLoginStates>(
      listener: (context, states) {
        if(states is ForgetPasswordSuccessState)
        {
          navto(context, VerifyOTPScreen(email: emailController.text,));
        }
      },
      builder: (context, states) {
        var cubit = ShopLoginCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            title: const Text('Forget Password'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const Text('Enter Your Email',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),),
                    const SizedBox(height: 15,),
                    defaultFormField(
                      controller: emailController,
                      label: 'Email Address',
                      type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'email must be not empty';
                        }else if (!value.toString().contains('@') ||
                            !value.toString().contains('.com')) {
                          return 'ex: example@mail.com';
                        } else {
                          return null;
                        }

                      },
                    ),
                    const SizedBox(height: 20,),
                    Conditional.single(
                      context: context,
                      conditionBuilder: (BuildContext context) =>
                      states is !ForgetPasswordLoadingState,
                      widgetBuilder: (BuildContext context) =>
                          Container(
                            width: 300,
                            height: 50.0,
                            child: MaterialButton(
                              onPressed: (){
                                print(('###########'));

                                if (formKey.currentState!.validate()) {

                                  ShopLoginCubit.get(context).forgetPassword(email: emailController.text);



                                }




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
