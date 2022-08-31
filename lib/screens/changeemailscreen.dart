
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/screens/navbar.dart';
import 'package:plantsshop/screens/profile.dart';
import 'package:plantsshop/shared/components.dart';
import 'package:plantsshop/shared/endpoints.dart';

class changeemail extends StatelessWidget {
  const changeemail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formkeyy = GlobalKey<FormState>();

    var editControlleremail = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(

        listener: (context, state) {

          if (state is ShopupdateemailSuccessState ){
            ShopLoginCubit.get(context).getUserData(TOKEN);
            //ShopLoginCubit.get(context).changrconstmodel();

            print('-------------------------');
            print(ShopLoginCubit.get(context).userModel?.data!.email);
            print('-------------------------');

            // print(ShopLoginCubit.get(context).loginModel.data.firstName);
            print('-------------------------');

            //ShopLoginCubit.get(context).getUserData(TOKEN);

            navto(context, HomeLayoutScreen());



          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              //backgroundColor: Colors.green,
              appBar: (null),
              body: Form(
                key: formkeyy,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      defaultFormField(
                        controller: editControlleremail,
                        type: TextInputType.emailAddress,
                        label: 'email',
                        validate: (dynamic? value) {
                          if (value!.isEmpty)
                            return 'email is empty';

                        },
                      ),

                      SizedBox(
                        height: 50.0,
                      ),



                      Container(
                        width: 300,
                        height: 50.0,
                        child: MaterialButton(
                          onPressed: (){

                            if(formkeyy.currentState!.validate()) {
                              print(('updateeeeeeee email'));
                          //    constmodel['data']['user']['email']=editControlleremail.text;

                              ShopLoginCubit.get(context).useremailupdate(
                                email: editControlleremail.text,
                                token: TOKEN,
                              );
                          //    ShopLoginCubit.get(context).changrconstmodel();

                            }







                          },
                          // function,
                          child: Text(
                            'update email',
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
              ),


            ),
          );
        },
      ),


    );
  }
}