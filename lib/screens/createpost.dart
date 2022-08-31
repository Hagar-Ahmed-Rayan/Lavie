


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/models/postmodel.dart';
import 'package:plantsshop/screens/curvednavbar.dart';
import 'package:plantsshop/screens/disscussform.dart';
import 'package:plantsshop/screens/navbar.dart';
import 'package:plantsshop/shared/components.dart';
import 'package:plantsshop/shared/endpoints.dart';

class createpost extends StatelessWidget {
  const createpost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    var titleController = TextEditingController();
    var disController = TextEditingController();

    return BlocConsumer<ShopLoginCubit, ShopLoginStates>(

      listener: (context, state) {

       if (state is AppPostImagePickedSuccessState) {
          ShopLoginCubit.get(context).convertImageToBase64();
          print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
        }



      },
      builder: (context, state) {

    return Scaffold(
    appBar: null,
    body:SafeArea(
      child: Center(
        child: Column(
          children: [

             MaterialButton(
              onPressed: (){
                print(('###########'));
             //   ShopLoginCubit.get(context).getPostImage();

                ShopLoginCubit.get(context).getImage();


              },
              child: Text(
                'upload img',
                style: TextStyle(
               //   color: Colors.white,
                ),
              ),
            ),
    defaultFormField(
        controller: titleController,
        type: TextInputType.text,
        label: 'title',
        validate: (dynamic? value) {
          if (value!.isEmpty)
            return 'title can not be null';

        },
    ),
        defaultFormField(
          controller: disController,
          type: TextInputType.text,
          label: 'discription',
          validate: (dynamic? value) {
            if (value!.isEmpty)
              return 'write dis';

          },
        ),
          MaterialButton(
            onPressed: (){


             ShopLoginCubit.get(context).createPost(
                token: TOKEN,
                title: titleController.text,
                description: disController.text,
                image: ShopLoginCubit.get(context).base64Image,
              );
            ShopLoginCubit.get(context). getMyPosts(TOKEN);
     //    var imgpath=     ShopLoginCubit.get(context).postImage;

             //    var onepost= post(imgpath, titleController.text,disController.text);
           //   posts.add(onepost);
              //print('herrrrrrrrrrrrrrrrrrrrrrrrrr');

//navto(context,disscussscreen());


    ShopLoginCubit.get(context).getMyPosts(TOKEN);

navto(context, HomeLayoutScreen());
            },
            // function,
            child: Text(
              'post',
              style: TextStyle(
               // color: Colors.white,
              ),
            ),
          ),

        if(ShopLoginCubit.get(context).postImg != null)
          Flexible(
            child: Stack(


              children: [
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0,),
                    image: DecorationImage(
                      image: FileImage(ShopLoginCubit.get(context).postImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    child: IconButton(
                      onPressed: () {
                        ShopLoginCubit.get(context).removePostImage();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 10,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),


           /* Stack(
              alignment: AlignmentDirectional.center,

              children: [
                Flexible(
                  child: Container(
                    // height: 140.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0,),
                      image: DecorationImage(
                        image: FileImage(ShopLoginCubit.get(context).postImg),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    child: IconButton(
                      onPressed: () {
                        ShopLoginCubit.get(context).removePostImage();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 10,
                      ),
                    ),
                  ),
                ),

              ],
            ),*/


          ],

        ),
      ),
    )

    );
  },
  );
}
}
