

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantsshop/cubit/plantsstates.dart';
import 'package:plantsshop/models/plantsmodel.dart';
import 'package:plantsshop/models/plantsmodel.dart';
import 'package:plantsshop/shared/dio.dart';
import 'package:plantsshop/shared/endpoints.dart';

/*class ShopLoginCubit extends Cubit<ShopplantsStates> {
  ShopLoginCubit() : super(ShopplantsInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  late String sucessmess;
  late plantesmodel  plantes ;



  void showplantsinfo()
  {
    emit(ShopplantsLoadingState());

    DioHelper.getData(
      url: GETplants,

    ).then((value)
    {

      print("pppppppppppppppppppppppppppppppppppppppppppppppppppp");
      sucessmess=value.data['type'];
      print(value.data['type']);
      print("tmammmmmmmmmmmmmmmmmmm");

      plantes = plantesmodel.fromJson(value.data);
      print(plantes.data);
      emit(ShopplantsSuccessState(plantes));
    }).catchError((error)
    {

      print("zffffffffffffft");
      print(error);
      emit(ShopplantsErrorState(error()));
    });
  }



}
*/
