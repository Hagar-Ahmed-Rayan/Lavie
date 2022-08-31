import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/screens/navbar.dart';
import 'package:plantsshop/shared/components.dart';
import 'package:plantsshop/shared/endpoints.dart';


class AddressScreen extends StatelessWidget {
  AddressScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var addressController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    ShopLoginCubit.get(context).determinePosition();

    return  BlocConsumer<ShopLoginCubit, ShopLoginStates>(
      listener: (context, state) {
        if(state is AppSuccessGetLocationState)
        {
          if(ShopLoginCubit.get(context).address.toString()!='null') {
            addressController.text=ShopLoginCubit.get(context).address.toString();
          }
        }
        if(state is AppSuccessClaimFreeSeedsState){
          if(state.message=='Success') {
            navto(context,  HomeLayoutScreen());
          }
        }
      },
      builder: (context, state) {
        var cubit = ShopLoginCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: formKey,
                child: Center(
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage('images/lavie.png'),
                        height: 150,
                      ),
                      const Text('Get Seeds For Free',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),),
                      const SizedBox(height: 10,),
                      const Text('Enter your Address',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),),
                      const SizedBox(height: 35,),
                      Row(
                        children: [
                          Expanded(
                            child: defaultFormField(
                              controller: addressController,
                              label: 'Address',
                              type: TextInputType.text,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Address must be not empty';
                                } else {
                                  return null;
                                }

                              },
                            ),
                          ),
                          const SizedBox(width: 10,),
                          IconButton(onPressed: (){
                            ShopLoginCubit.get(context).determinePosition();

                            cubit.getCurrentLocation();
                            print("yyyyyyyyyyyyyyyyy");
                            print(cubit.position);
                            cubit.getAddress(cubit.position);
                          }, icon: const Icon(Icons.location_city_outlined),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Conditional.single(
                        context: context,
                        conditionBuilder: (BuildContext context) =>
                        state is !AppLoadingClaimFreeSeedsState,
                        widgetBuilder: (BuildContext context) =>

                            Container(
                              width: 300,
                              height: 50.0,
                              child: MaterialButton(
                                onPressed: (){

                                  if (formKey.currentState!.validate()) {

                                    cubit.claimFreeSeeds(address: addressController.text,token: TOKEN);



                                  }



                                },
                                // function,
                                child: Text(
                                  'send',
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
                      const SizedBox(height: 20,),
                      Container(
                        width: 300,
                        height: 50.0,
                        child: MaterialButton(
                          onPressed: (){

                            if (formKey.currentState!.validate()) {

                              navto(context, const HomeLayoutScreen());



                            }



                          },
                          // function,
                          child: Text(
                            'save for later',
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
          ),

        );
      },
    );
  }
}
