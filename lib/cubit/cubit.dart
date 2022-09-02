
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
//import 'package:geocoder/geocoder.dart';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/models/Getuserinfo.dart';
import 'package:plantsshop/models/LognModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantsshop/models/Modelgoogle.dart';
import 'package:plantsshop/models/mypostsmodel.dart';
import 'package:plantsshop/models/productsmodel.dart';
import 'package:plantsshop/models/seedsmodel.dart';
import 'package:plantsshop/screens/QR%20scan.dart';
import 'package:plantsshop/screens/disscussform.dart';
import 'package:plantsshop/screens/homescreen.dart';
import 'package:plantsshop/screens/notification.dart';
import 'package:plantsshop/screens/profile.dart';
import 'package:plantsshop/screens/splash.dart';
import 'package:plantsshop/shared/cache.dart';
import 'package:plantsshop/shared/components.dart';
import 'package:plantsshop/shared/dio.dart';
import 'package:plantsshop/shared/endpoints.dart';
import 'package:plantsshop/shared/locationhelper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
//late String sucessmess;
  int y=9;
  String s="hh";
    var loginModel;
   var  lm;
   var edituser;
  late Modelgoogle googlemodel;
  int? len;
   List<dynamic> searcheditems =[];

int  numofsearchresult=0;//number

  int currentIndex = 2;
  PageController pageController=PageController(initialPage: 2);

  bool isFav=false;

  void changeBottom(int index) {
    currentIndex = index;
    if(index==2)
    {

    }
    if(index==4)
    {
      getUserData(TOKEN);


    }
    if(index==0)
    {
      getMyPosts(TOKEN);
      getUserData(TOKEN);
      print('yessssssssssssssssssssssssssssssssssssssssssssssss');
    }

    emit(AppChangeBottomNavState());
  }

  List<Widget> screens = [
    disscussscreen(),
    QRScanner(),
    homescreen(),
    NotificationScreen(),
    profile(),
  ];
  void update(){
    emit(postaddsucessstate());

  }
  void userLogin({
    required dynamic email,
    required dynamic password,
  })
  {
    emit(ShopLoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data:
      {
        'email': email,
        'password': password,
      },

    ).then((value)
    {

   //  sucessmess=value.data['type'];
      print(value.data['type']);
      print(value.data['data']);
      loginModel=value.data;
      constmodel=value.data;
lm=LognModel.fromJson(value.data);
print (lm.type);
      print (lm.message);
s='gogo';
      print(loginModel);

     // showplantsinfo(token:value.data['data']['accessToken']);
      print(value.data['data']['accessToken']);
     CacheHelper.saveData(key: 'token', value: value.data['data']['accessToken'].toString());

     // loginModel = LognModel.fromJson(value.data);
    //  showproductsinfo(token: value.data['data']['accessToken']);

      emit(ShopLoginSuccessState(loginModel));
      print("loginnnnnnnnnnnnn doneeeeeeeeeeeeeee2");

    }).catchError((error)
    {

      print("zffffffffffffftlogin");
      print(error);
      emit(ShopLoginErrorState(error));
    });
  }




  void postgoogle({
    required dynamic id,
    required dynamic email,
    required dynamic firstname,
    required dynamic lastname,
    required dynamic picture,
  })
  {
    emit(postgoogleLoadingState());

    DioHelper.postData(
      url: GOOGLE,
      data:
      {
      "id": id,
      "email": email,
      "firstName": firstname,
      "lastName": lastname,
      "picture": picture,

      },
    ).then((value)
    {

      print(value.data['type']);
      print("t22222222222222222222222222222222222222");

      googlemodel = Modelgoogle.fromJson(value.data);
      emit(googleSuccessState(googlemodel));
    }).catchError((error)
    {

      print("22222222222222222222222222222222222222222222222zffffffffffffft");
      print(error);
      emit(googleErrorState(error));
    });
  }

void getuserinfo(){
    print(loginModel);
emit(getuserdata());

}





//////////////////////getplants////////////////////////////////////////////////////

 // late plantesmodel  plantes ;
    var  plantes ;

  late     seedsmodel seeds;

 //  late String  plantes ;


  void showplantsinfo({

    required dynamic token,
  })
  {
    emit(ShopplantsLoadingState());

    DioHelper.getData(
      token: token,

      url: GETplants,

    ).then((value)
    {

      print("pppppppppppppppppppppppppppppppppppppppppppppppppppp");
     // sucessmess=value.data['type'];
      print(value.data);

      print(value.data['message']);

      print("tmammmmmmmmmmmmmmmmmmm");

      print(value.data['data'][0]['name']);
      print(value.data['data'][1]['sunLight']);
      plantes = value.data;

   //  plantes = plantesmodel.fromJson(value.data);
      print("assssssssssssssssssssssssssssssssssss");

      print(plantes);
      print("ppppppppppppppppppppppppppppppp999999999999999999999ppppppppppppppppppppp");

     //  emit(ShopplantsSuccessState(plantes));

    }).catchError((error)
    {

      print("zffffffffffffffffffffffffffffffffffffffffffftplants");
      print(error);








    //  emit(ShopplantsErrorState(error()));
    });
  }


//////////////////////getproducts////////////////////////////////////////////////////

  //List<dynamic>  products = [];
var products ;
//  late String  plantes ;


  void showproductsinfo({

    required dynamic? token,
  })
  {
    emit(ShopproductsLoadingState());

    DioHelper.getData(
      token: token,

      url: GETproducts,

    ).then((value)
    {

        //  len = value.data['data'].length;


          // sucessmess=value.data['type'];
          print(value.data);

          print(value.data['message']);

          print("tmammmmmmmmmmmmmmmmmmm");

          print(value.data['data'][0]['name']);
          print(value.data['data'][1]['price']);

          //products = productsmodel.fromJson(value.data);
          //print(products.toString());
          print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
          products = value.data;
          print(products);


          emit(ShoppprodctsSuccessState(products));
          print(
             "ppppppppppppppppppppppppppppppp222222222222222ppppppppppppppppppppp");

    }).catchError((error)

    {

      print("zffffffffffffffffffffffffffffffffffffffffffftproducts");
      print(error);


      emit(ShopproductsErrorState());
    });
  }



//////////////////////search////////////////////////////////////////////////////

  late productsmodel  search ;

//  late String  plantes ;


  void searchproducts({

    required dynamic token,
    required dynamic text
  })
  {
    emit(ShopsearchLoadingState());
    DioHelper.getData(
      token: token,


      url: GETproducts,
      query: {
      }

    ).then((value)
    {
      searcheditems=[];

      // sucessmess=value.data['type'];
   //   print(value.data);

      print(value.data['message']);
      print("gameeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed111111111");
     int num =value.data['data'].length;
     for(int i=0;i<num;i++) {


       if (text == value.data['data'][i]['name']||value.data['data'][i]['name'].contains(text))  { //||it sub string of it
       //  numofsearchresult=numofsearchresult+1;
         searcheditems.add(value.data['data'][i]);
       // print (searcheditems[i]['name']);
         print (searcheditems.length);

         print(value.data['data'][i]);
         print("gameeeeeeeeeeeeeeeeed222222222222222");
       }
     }



   //   search = productsmodel.fromJson(value.data);
     // print(search.toString());

     emit(ShoppsearchSuccessState(searcheditems));

    }).catchError((error)
    {

      print("zffffffffffffffffffffffffffffffffffffffffffftsearch");
      print(error);








      emit(ShopsearchErrorState(error()));
    });
  }



  void showquiz(){

    emit(openquiz());

  }
  void removefromcart(){

    emit(removecartitem ());

  }


 void changrconstmodel (){
    emit(changrconstmodelstate());
 }


/***********************update*/


///////////////////////////

  void userupdate({
 dynamic firstname,
    //dynamic? lastname ,
    required dynamic token,
  })
  {
    emit(ShopupdateLoadingState());

    DioHelper.patchdata(
      url: UPDATE,
       token: token,
      data:
      {
        'firstName':firstname,
        //'firstname':firstname
      },

    ).then((value)
    {

      //  sucessmess=value.data['type'];
      print('wowwwwwwwwwwwwww');
      print(value.data);
      print('woww');
      edituser=value.data;
      print("update doneeeeeeeeeeeeeee");




      emit(ShopupdateSuccessState(edituser));

    }).catchError((error)
    {

      print("zffffffffffffftupdate");
      print(error);
      emit(ShopupdateErrorState(error));
    });
  }


  void useremailupdate({
    //dynamic? lastname ,
    dynamic email,
    required dynamic token,
  })
  {
    emit(ShopupdateemailLoadingState());

    DioHelper.patchdata(
      url: UPDATE,
      token: token,
      data:
      {
        'email': email,
        //'firstname':firstname
      },

    ).then((value)
    {

      //  sucessmess=value.data['type'];
      print(value.data);
      edituser=value.data;
      print("update email doneeeeeeeeeeeeeee");




      emit(ShopupdateemailSuccessState(edituser));

    }).catchError((error)
    {

      print("zffffffffffffftupdate email");
      print(error);
      emit(ShopupdateemailErrorState(error));
    });
  }












///////////createpost
  //File? postImage;
 // File postImage=new File('C:\Users');

  var picker = ImagePicker();

 /* Future<void> getPostImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      print('llllllll//////////////////////////lllllllllllllll');
      print( postImage.path);

      print(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialProfileImagePickedErrorState());
    }
  }*/
  ////////

  File postImg=new File('C:\Users');

  Future<void> getImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    postImg = File(image!.path);
    emit(AppPostImagePickedSuccessState());
  }
  void removePostImage() {
    postImg=File('');
    emit(AppRemovePostImageState());
  }
  Uint8List? bytes;
  String? base64Image;
  final ImagePicker pick = ImagePicker();


  void convertImageToBase64()
  {
    bytes=File(postImg.path).readAsBytesSync();
    base64Image=base64Encode(bytes!);
    print('iamge base 64 here');
    print(base64Image);
  }










  MyPostsModel? myPostsModel;
  void getMyPosts(String token) {
    emit(AppLoadingGetMyPostsState());
    DioHelper.getData(
      url: MY_POSTS,
      token: token,
    ).then((value) {

      print(value.data);
      myPostsModel = MyPostsModel.fromJson(value.data);
      print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11');
      print(myPostsModel?.type);

      emit(AppSuccessGetMyPostsState());
    }).catchError((error) {

        print(error.toString());

      emit(AppErrorGetMyPostsState(error: error.toString()));
    });
  }
  void createPost({
    required String token,
    required String? title,
    required String? description,
    required String? image,
  }) {
    emit(AppCreatePostLoadingState());

    DioHelper.postData(
        token: token,
        url: CREATE_POST,
        data: {
          'title': title,
          'description': description,
          'imageBase64': 'data:image/png;base64,$image',
        }).then((value) {
          print('createpostttttttttttttttttt');
          print(value.data);
      getMyPosts(token);
      emit(AppCreatePostSuccessState());
    })
        .catchError((error) {
print ("errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
      if(error is DioError)
      {
        print('diooooooooooooooerror');
      }
      emit(AppCreatePostErrorState(error: error.toString()));
    });
  }



  Getuserinfo? userModel;
  void getUserData(String token) {
    emit(AppLoadingUserDataState());
    DioHelper.getData(
      url: USER_DATA,
      token: token,
    ).then((value)
    {

      userModel = Getuserinfo.fromJson(value.data);
      print(userModel);
      emit(AppSuccessUserDataState());
    }).catchError((error) {

        print(error.toString());

      emit(AppErrorUserDataState(error: error.toString()));
    });
  }
  ////////////////////google///////////////////////



  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  Future<void> signUpWithGoogle()async{
    try{
      GoogleSignInAccount? googleSignInAccount= await googleSignIn.signIn();
      userRegisterByGoogle(
        firstName: googleSignInAccount?.displayName,
        lastName:googleSignInAccount?.displayName ,
        email:googleSignInAccount!.email ,
        id: googleSignInAccount.id,
      );

    }
    catch(error)
    {
      print('errrrrrrrrrrrror');
      print(error.toString());
    }



  }


  void userRegisterByGoogle({
    required String email,
    required String id,
    String? firstName,
    String? lastName,
    String picture='https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png',

  }) {
    emit(RegisterByGoogleLoadingState());

    DioHelper.postData(
        url: REGISTER_GOOGLE,
        data: {
      'email': email,
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'picture': picture,
    }).then((value) {
             print("///////////////////////////////////////////////");
      loginModel = LognModel.fromJson(value.data);
      emit(RegisterByGoogleSuccessState(loginModel));
    }).catchError((error) {

      if(error is DioError)
      {
        print('sign up with google  dio error ');
      }

print("************************************88");
        print(error.toString());
      print("====================================");

      emit(RegisterByGoogleErrorState(error.toString()));
    });
  }


////////////forgetpass

  void forgetPassword({
    required String email,
  }) {
    emit(ForgetPasswordLoadingState());

    DioHelper.postData(
        url: FORGET_PASSWORD,
        data: {
          'email': email,
        }).then((value) {
      emit(ForgetPasswordSuccessState());
    })
        .catchError((error) {
        print(error.toString());

      if(error is DioError)
      {
        print('dioerror');
      }
      emit(ForgetPasswordErrorState(error.toString()));
    });
  }



/////////////verify


  String? codeText;
  void currentText(value){
    codeText=value;
    emit(ChangeTextSuccessState());
  }
  void verifyOTP({
    required String email,
    String? otp,
  }) {
    emit(VerifyOTPLoadingState());

    DioHelper.postData(
        url: VERIFY,
        data: {
          'email': email,
          'otp': otp,
        }).then((value) {
      emit(VerifyOTPSuccessState(value.data['type']));


    })
        .catchError((error) {
        print(error.toString());

      if(error is DioError)
      {
        print('diooerror');
      }
      emit(VerifyOTPErrorState(error.toString()));
    });
  }

///////////resetpass



  void resetPassword({
    String? email,
    String? otp,
    String? password,
  }) {
    emit(ResetPasswordLoadingState());

    DioHelper.postData(
        url: VERIFY,
        data: {
          'email': email,
          'otp': otp,
          'password': password,
        }).then((value) {
      emit(ResetPasswordSuccessState(value.data['type']));


    })
        .catchError((error) {
        print(error.toString());
      if(error is DioError)
      {
        print('dioerror');
      }
      emit(ResetPasswordErrorState(error.toString()));
    });
  }



 ///////////////////address

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    getCurrentLocation();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    position= await Geolocator.getCurrentPosition();
    return await Geolocator.getCurrentPosition();
  }

  Position? position;

  Future<void> getCurrentLocation() async {
    await LocationHelper.determinePosition();
    position =
    await Geolocator.getLastKnownPosition();
    getAddress(position);
    print('My Lat Log ..........');
    print(position?.longitude);
    print(position?.latitude);
    emit(AppSuccessGetLocationState());
  }

  dynamic address;
  Future<void> getAddress(Position? p) async
  {
    List<Placemark> placemarks = await placemarkFromCoordinates(p!.latitude, p.longitude);
    address=placemarks[0].locality;

  }


  void claimFreeSeeds({
    required String token,
    required String address,
  }) {
    emit(AppLoadingClaimFreeSeedsState());

    DioHelper.postData(
        token: token,
        url: CLAIM_FREE_SEEDS,
        data: {
          'address': address,
        }).then((value) {
      emit(AppSuccessClaimFreeSeedsState(message: value.data['type']));
    })
        .catchError((error) {
        print(error.toString());
      if(error is DioError)
      {

      }
      emit(AppErrorClaimFreeSeedsState(error: error.toString()));
    });
  }

///getplant withid


var productid;
  void showproductidinfo({

    required dynamic? token,
    required dynamic? id,

  })
  {
    print('this is idddddddddddddd');
    print(id);
    emit(ShopproductidLoadingState());

    DioHelper.getData(
      token: token,

      url: GETproductid,
        query: {
          'plantId': id,

        }).then((value)
    {


      print(value.data);


      print("tmammmmmmmmmmmmmmmmmmmid");


      productid = value.data;
      print(productid);


      emit(ShoppprodctidSuccessState(productid));
      print(
          "ppppppppppppppppppppppppppppppp222222222222222pppppppppppppppppppppidddd");

    }).catchError((error)

    {

      print("zffffffffffffffffffffffffffffffffffffffffffftproductsidd");
      print(error);


      emit(ShopproductidErrorState());
    });
  }








}


































