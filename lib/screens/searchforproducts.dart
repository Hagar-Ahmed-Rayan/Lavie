



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/screens/homescreen.dart';
import 'package:plantsshop/shared/components.dart';
import 'package:plantsshop/shared/endpoints.dart';

class productssearch extends StatelessWidget {
  const productssearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchtext = TextEditingController();
    List<String> searchedstrings =[];

    return BlocConsumer<ShopLoginCubit, ShopLoginStates>(
    listener: (context, state) {},
        builder: (context, state) {
      //if ShopLoginCubit.get(context).searcheditems.len==0

    return Scaffold(
      appBar: null,
      body:

      SafeArea(

        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: TextFormField(
                  controller: searchtext,

                  validator: (value) {
                    if (value!.isEmpty) {
                      print("test");
                    }
                  },

                  onFieldSubmitted: (value) {
                    print(value);
searchedstrings.add(value);
print(searchedstrings);
                    print("lllllllllllllllllllllllllllllllllllllllllllllllllllllllength");

                    print( ShopLoginCubit.get(context).searcheditems);
                    ShopLoginCubit.get(context)
                        .searchproducts(
                      token: TOKEN,
                      text: searchtext.text,
                    );
                       searchtext.clear();


                    /* for(int i=0;i<ShopLoginCubit.get(context).searcheditems.length;i++) {
                                              print(ShopLoginCubit
                                                  .get(context)
                                                  .searcheditems[i]);
                                              print(TOKEN);
                                              print(
                                                  "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkak");
                                            }*/
                    /*len = ShopLoginCubit
                                                .get(context)
                                                .len;*/
                  },
                  decoration: InputDecoration(

                    prefixIcon: Icon(Icons.search,
                      color: Colors.grey,

                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                    //  focusedBorder: ,
                    //  focusColor: Colors.blue,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            15),
                        borderSide: BorderSide.none),
                    hintText: 'Search',
                  ),
                ),


              ),
              ShopLoginCubit.get(context).searcheditems.length==0?Center(
                child: CircularProgressIndicator(),
              ): itemsearchedproducts(ShopLoginCubit.get(context).searcheditems),

          ],
          ),
        ),
      ),


    );

  }

    );
  }
}


Widget  itemsearchedproducts( List<dynamic> model) =>

    Expanded(
      /*   Container(
color: Colors.red,


                width: 150,
                //height: 30,
                child: MaterialButton(
                    onPressed: () {
                      print("+++=++++*************************************++++++++++");
                      print(model);
                      print(model['data'][1]['name']);

                    }
                )









            ),*/


      child: Container(
        width: double.infinity,
        child: GridView.count(crossAxisCount: 2,
          children: List.generate(model.length, (index) =>
              gridindex(model[index]),

          ),

        ),
      ),
    );











Widget gridindex(dynamic item) =>

    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          /* boxShadow: [
            BoxShadow(
             // color: Colors.white,
            blurRadius: 3.0,
          ),
        ],*/
          borderRadius: BorderRadius.circular(
            3,
          ),
          color: Colors.grey[100],
        ),


        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              /*Container(
   color: Colors.red,
   child: MaterialButton(
onPressed: ()
                {
                  print("هااااااااHHHHHHHHHHHHHHHااااااااااااااااجر");
                  print(baseurl+item['imageUrl']);
                },
          ),
 ),*/

              Expanded(
                child: Row(
                  children: [
                    Image(image: NetworkImage(
                      //     'https://images.pexels.com/photos/36029/aroni-arsa-children-little.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
                      baseurl+item['imageUrl'],
                    ),
                    ),
                    SizedBox(width: 50,),
                    Text('1'),

                  ],
                ),
              ),
              SizedBox(height: 5,),

              Text(item['name'],
                style: TextStyle(
                  fontSize: 15,
                  fontWeight:FontWeight.bold ,
                ),

              ),
              SizedBox(height: 5,),

              Row(
                  children: [
                    Text(item['price'].toString() ),
                    Text(' EGP'),
                  ]
              ),
              SizedBox(height: 5,),

              Container(
                width: 200,
                height: 40.0,
                child: MaterialButton(
                  onPressed: () {
                    print(('###########'));
                  },
                  // function,
                  child: Text(
                    'Add To Card',
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
    );



