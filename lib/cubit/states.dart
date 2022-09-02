
import 'package:plantsshop/models/LognModel.dart';
import 'package:plantsshop/models/Modelgoogle.dart';
import 'package:plantsshop/models/plantsmodel.dart';
import 'package:plantsshop/models/productsmodel.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialState extends ShopLoginStates {}
class AppChangeBottomNavState extends ShopLoginStates {}

class ShopLoginLoadingState extends ShopLoginStates {}

class ShopLoginSuccessState extends ShopLoginStates
{
  var loginModel;

  ShopLoginSuccessState(this.loginModel);
}

class ShopLoginErrorState extends ShopLoginStates
{
  final dynamic error;

  ShopLoginErrorState(this.error);
}

class ShopChangePasswordVisibilityState extends ShopLoginStates {}

class postgoogleLoadingState extends ShopLoginStates {}
class googleSuccessState extends ShopLoginStates {
late final Modelgoogle  googlemodel  ;

googleSuccessState(this.googlemodel);
}

class googleErrorState extends ShopLoginStates {

  final dynamic error;

  googleErrorState(this.error);

}
///////////////////plants//////////////////////////////////////////////////


//abstract class ShopplantsStates {}

class ShopInitialState extends ShopLoginStates {}

class ShopplantsLoadingState extends ShopLoginStates {}

class ShopplantsSuccessState extends ShopLoginStates
{
  var   plantsModel;

  ShopplantsSuccessState(this.plantsModel);
}

class ShopplantsErrorState extends ShopLoginStates
{
  final dynamic error;

  ShopplantsErrorState(this.error);
}
//////////////////////////////prodcts









class ShopproductsInitialState extends ShopLoginStates {}

class ShopproductsLoadingState extends ShopLoginStates {}

class ShoppprodctsSuccessState extends ShopLoginStates
{
  var  productmodel;

  ShoppprodctsSuccessState(this.productmodel);

}

class ShopproductsErrorState extends ShopLoginStates
{
 //  var error;

  ShopproductsErrorState();
}
//////////////////////////////search









class ShopsearchInitialState extends ShopLoginStates {}

class ShopsearchLoadingState extends ShopLoginStates {}

class ShoppsearchSuccessState extends ShopLoginStates
{
  List<dynamic> searcheditems;


  ShoppsearchSuccessState(this.searcheditems);

}

class ShopsearchErrorState extends ShopLoginStates
{
  final dynamic error;

  ShopsearchErrorState(this.error);
}
class openquiz extends ShopLoginStates{


}


class removecartitem extends ShopLoginStates{


}
class getuserdata extends ShopLoginStates{


}

class changrconstmodelstate extends ShopLoginStates {

}





//////////////////update











///////////update username

class ShopupdateInitialState extends ShopLoginStates {}

class ShopupdateLoadingState extends ShopLoginStates {}

class ShopupdateSuccessState extends ShopLoginStates
{
  var searcheditems;


  ShopupdateSuccessState(this.searcheditems);

}



class ShopupdateErrorState extends ShopLoginStates
{
  final dynamic error;

  ShopupdateErrorState(this.error);
}
////update email
class ShopupdateemailInitialState extends ShopLoginStates {}

class ShopupdateemailLoadingState extends ShopLoginStates {}

class ShopupdateemailSuccessState extends ShopLoginStates
{
  var searcheditems;


  ShopupdateemailSuccessState(this.searcheditems);

}

class ShopupdateemailErrorState extends ShopLoginStates
{
  final dynamic error;

  ShopupdateemailErrorState(this.error);
}
/////create post


class SocialProfileImagePickedInitialState extends ShopLoginStates {}

class SocialProfileImagePickedLoadingState extends ShopLoginStates {}



class SocialProfileImagePickedSuccessState extends ShopLoginStates{}
class SocialProfileImagePickedErrorState extends ShopLoginStates{}






class AppLoadingGetMyPostsState extends ShopLoginStates  {}

class AppSuccessGetMyPostsState extends ShopLoginStates  {}

class AppErrorGetMyPostsState extends ShopLoginStates  {
  String? error;
  AppErrorGetMyPostsState({this.error});
}




class AppCreatePostLoadingState extends ShopLoginStates {}

class AppCreatePostSuccessState extends ShopLoginStates {}

class AppCreatePostErrorState extends ShopLoginStates {
  String? error;
  AppCreatePostErrorState({this.error});
}

class AppLoadingUserDataState extends ShopLoginStates {}

class AppSuccessUserDataState extends ShopLoginStates {}

class AppErrorUserDataState extends ShopLoginStates {
  String? error;
  AppErrorUserDataState({this.error});
}
/////////////////



class AppRemovePostImageState extends ShopLoginStates {}

class AppPostImagePickedLoadingState extends ShopLoginStates {}

class AppPostImagePickedSuccessState extends ShopLoginStates {}

class AppPostImagePickedErrorState extends ShopLoginStates {
  String? error;

  AppPostImagePickedErrorState({this.error});
}

//////////////////////
class postaddsucessstate extends ShopLoginStates {}

//////////////////google

class RegisterByGoogleLoadingState extends ShopLoginStates{}


class RegisterByGoogleSuccessState extends ShopLoginStates{
  var signinmodel;
  RegisterByGoogleSuccessState(this.signinmodel);

}

class RegisterByGoogleErrorState  extends ShopLoginStates{
  String? error;

  RegisterByGoogleErrorState(this.error);


}

/////////////////forgetpass

 class ForgetPasswordLoadingState extends ShopLoginStates{}

class ForgetPasswordSuccessState extends ShopLoginStates{}
class ForgetPasswordErrorState extends ShopLoginStates{String? error;

ForgetPasswordErrorState(this.error);


}
///////////////verify///

class VerifyOTPLoadingState extends ShopLoginStates {}

class VerifyOTPSuccessState extends ShopLoginStates {
  String message;
  VerifyOTPSuccessState(this.message);
}

class VerifyOTPErrorState extends ShopLoginStates {
  final String error;
  VerifyOTPErrorState(this.error);
}

///////////reset


class ChangeTextSuccessState extends ShopLoginStates {}

class ResetPasswordLoadingState extends ShopLoginStates {}

class ResetPasswordSuccessState extends ShopLoginStates {
  String? message;
  ResetPasswordSuccessState(this.message);

}

class ResetPasswordErrorState extends ShopLoginStates {
  final String error;
  ResetPasswordErrorState(this.error);
}

class ChangePasswordVisibilityState extends ShopLoginStates {}
/////////////////////////////////////////location

class AppSuccessGetLocationState extends ShopLoginStates {}



class AppLoadingClaimFreeSeedsState extends ShopLoginStates {}

class AppSuccessClaimFreeSeedsState extends ShopLoginStates {
  String? message;
  AppSuccessClaimFreeSeedsState( {this.message});
}

class AppErrorClaimFreeSeedsState extends ShopLoginStates {
  String? error;
  AppErrorClaimFreeSeedsState( {this.error});

}
//////////show with product id




class ShopproductidInitialState extends ShopLoginStates {}

class ShopproductidLoadingState extends ShopLoginStates {}

class ShoppprodctidSuccessState extends ShopLoginStates
{
  var  productmodel;

  ShoppprodctidSuccessState(this.productmodel);

}

class ShopproductidErrorState extends ShopLoginStates
{
  //  var error;

  ShopproductidErrorState();
}
