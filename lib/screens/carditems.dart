


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/screens/homescreen.dart';
import 'package:plantsshop/shared/endpoints.dart';

class carditems extends StatelessWidget {
  const carditems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<ShopLoginCubit, ShopLoginStates>(
    listener: (context, state) {},
    builder: (context, state) {
    ShopLoginCubit.get(context).removefromcart();
    return addtocarditems.length==0? SafeArea(
      child: Scaffold(
        appBar: null,
        
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/pic.png',
              //   height: 50,
            ),


          ],
        ),
      ),
    ): Scaffold(
      appBar: AppBar(
        title: const Text('MY Cart'),
      ),
      body:  SingleChildScrollView(
      child:Column(
        children: [

      /*    Container(
   color: Colors.red,
   child: MaterialButton(
onPressed: ()
                {
                  print("هااااااااHHHHHHHHHHHHHHHااااااااااااااااجر");
                  print(addtocarditems);
                  print(addtocarditems[0]['name']);
                  print(addtocarditems[0]['price']);

                  print( addtocarditems.length);
                },
          ),
 ),*/
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => buildCartItem(addtocarditems[index],addtocarditems,context),
            separatorBuilder: (context, index) => SizedBox(
              height: 5.0,
            ),
            itemCount: addtocarditems.length,
          ),


        ],

      ),),


    );

    }

    );
  }
}
buildCartItem(var item,List<dynamic>addtocarditems,BuildContext context)=>
    Center(
      child: Padding(

        padding: const EdgeInsets.all(20.0),
        child: Material(
          elevation: 20,

          child: Container(


            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(
                5,
              ),
              color: Colors.grey[200],

            ),
            width: 300,
            height: 120,
            child: Row(
              children: [

                   /* Container(
   color: Colors.red,
   child: MaterialButton(
onPressed: ()
                  {
                    print("هااااااااHHHHHHHHHHHHHHHااااااااااااااااجر");
                    print(item);

                    print(item['name']);

                  },
            ),
 ),*/


                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image(image: NetworkImage(
                   //    'https://images.pexels.com/photos/36029/aroni-arsa-children-little.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
                baseurl+item['imageUrl'],
                ),
                ),
      ),
              //  SizedBox(width: 5,),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['name'],

                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:FontWeight.bold ,
                          ),


                        ),

                        SizedBox(height: 3,),

                        Text(item['price'].toString()+'  '+'EGP',
                          style: TextStyle(
                           color: Colors.green
                          ),


                        ),
                        SizedBox(height: 5,),

                        Row(
                          children: [
                            Text('1'),
                            SizedBox(width: 100,),

                            GestureDetector(

                              onTap: (){
                                addtocarditems.remove(item);
                                ShopLoginCubit.get(context).removefromcart();

                                print("kkkkkkkkk");
                              },
                              child: Icon(Icons.delete,
                                color: Colors.green,

                              ),
                            )

                          ],
                        )

                      ],
                    ),
                  ),
                )

              ],

            ),
          ),
        ),
      ),
    );
