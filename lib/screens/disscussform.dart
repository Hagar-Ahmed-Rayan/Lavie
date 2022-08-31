


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/screens/createpost.dart';
import 'package:plantsshop/screens/searchforproducts.dart';
import 'package:plantsshop/shared/components.dart';
import 'package:plantsshop/shared/endpoints.dart';

class disscussscreen extends StatelessWidget {
  const disscussscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchtext=TextEditingController();
    print('11111111111111111111111111111');
    /*ShopLoginCubit.get(context).getMyPosts(TOKEN);
    print( ShopLoginCubit.get(context).myPostsModel?.data);
    ShopLoginCubit.get(context).getUserData(TOKEN);
   print( ShopLoginCubit.get(context).userModel?.data?.firstName);*/


    print('22222222222222222222222222');

    return BlocConsumer<ShopLoginCubit, ShopLoginStates>(


      listener: (context, state) {
//if(state is AppCreatePostSuccessState )
  //ShopLoginCubit.get(context).getMyPosts(TOKEN);
 //else

      },
      builder: (context, state) {

        return Scaffold(
    appBar: AppBar(
      title:        Text('Disscuss Form')

    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 260,
              child: TextFormField(
                controller: searchtext,
                onTap:(){
                  navto(context, productssearch());
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    print("test");
                  }
                },

                onFieldSubmitted: (value) {
                  print(value);

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
          ),
          SizedBox(

            width: 5,
          ),
        /*  Container(
            width: 200,
            height: 40.0,
            child: MaterialButton(
              onPressed: () {

print('donee');

print('donee');

                print( ShopLoginCubit.get(context).myPostsModel?.data![0].title);

print( ShopLoginCubit.get(context).myPostsModel?.data![0].title);
print( ShopLoginCubit.get(context).myPostsModel?.data![0].description);
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
          ),*/









          ShopLoginCubit.get(context).myPostsModel?.data!=null&& ShopLoginCubit.get(context).userModel?.data!=null ?



          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            reverse: true,

            itemBuilder: (context, index) =>
                buildpostItem( ShopLoginCubit.get(context).myPostsModel?.data![index],ShopLoginCubit.get(context).userModel?.data),
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemCount:ShopLoginCubit.get(context).myPostsModel!.data!.length.toInt() ,
          ):

        Center(
        child: CircularProgressIndicator(),
        )


        ],


      ),
    ),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        navto(context, createpost());

      //  ShopLoginCubit.get(context).update();

      },
     // label: const Text('Approve'),
      icon: const Icon(Icons.add),
      backgroundColor: Colors.green,
      label: const Text('add post'),
    ),

    );
  },
  );
}
}
Widget buildpostItem(var post,var user)=>

    Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(
            3
            ,
          ),
          color: Colors.grey[200],
        ),

        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
          children: [
            Row(
children: [
   CircleAvatar(
            radius: 50.0,

            backgroundImage: NetworkImage(
             // 'https://images.pexels.com/photos/36029/aroni-arsa-children-little.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
               // constmodel['data']['user']['imageUrl']
              user.imageUrl


           )
  ),

  Text(
    user.firstName+' '+user.lastName
    //post['title']
      //constmodel['data']['user']['firstName']+' '+constmodel['data']['user']['lastName']
  ),
  SizedBox(
          width: 20,
  ),
  Text(DateTime.now().toString())
],

            ),
            Text(post.title),
            Text(post.description),

          if(post.imageUrl!=null)
          Flexible(

            child: Container(


              child: Image( image:  NetworkImage( baseurl+ post.imageUrl
              ),
                fit: BoxFit.fill,
                width: double.infinity,

              ),
            ),

          /*  child: Container(


              child: Image(image:
              NetworkImage(
                  'https://images.pexels.com/photos/36029/aroni-arsa-children-little.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                //  constmodel['data']['user']['imageUrl']
              fit: BoxFit.fill,
                width: double.infinity,

              ),
            ),*/


          ),
            Row(
              children: [
                Icon(Icons.add),
                Text('1'),
                Text('like'),
                SizedBox(
                  width: 50,
                ),
                Icon(Icons.add),
                Text('1'),
                Text('comment'),

              ],

            )


          ],
  ),
        ),
      ),
    )  ;