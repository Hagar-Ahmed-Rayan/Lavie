
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/screens/navbar.dart';
import 'package:plantsshop/screens/profile.dart';
import 'package:plantsshop/shared/components.dart';
import 'package:plantsshop/shared/endpoints.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formkeyy = GlobalKey<FormState>();

    var editController = TextEditingController();
    return BlocConsumer<ShopLoginCubit, ShopLoginStates>(

      listener: (context, state) {
        if (state is ShopupdateSuccessState ){
          ShopLoginCubit.get(context).getUserData(TOKEN);
          //ShopLoginCubit.get(context).changrconstmodel();

          print('-------------------------');
          print(ShopLoginCubit.get(context).userModel?.data!.firstName);
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
                  controller: editController,
                  type: TextInputType.text,
                  label: 'firstname',
                  validate: (dynamic? value) {
                    if (value!.isEmpty)
                      return 'name is empty';

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
  print(('name update'));
//constmodel['data']['user']['firstName']=editController.text;

  ShopLoginCubit.get(context).userupdate(
    firstname: editController.text,
    token: TOKEN,
  );

}







                        },
                        // function,
                        child: Text(
                          'update name',
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
    );
  }
}