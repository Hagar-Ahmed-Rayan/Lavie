import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/models/modelcart.dart';
import 'package:plantsshop/shared/components.dart';
import 'package:plantsshop/shared/sqflite/cartdatabase.dart';
import 'package:plantsshop/shared/sqflite/counter.dart';
import 'package:plantsshop/shared/sqflite/notfound.dart';
import 'package:plantsshop/shared/style.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  SqlHelper.initDB();
  ShopLoginCubit.get(context).getAllCartProducts();
    return BlocConsumer<ShopLoginCubit, ShopLoginStates>(

    listener: (context, state) {},
    builder: (context, state) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: AppTextStyle.appBarText(),

        ),
        backgroundColor: Colors.green,
      ),
      body:  Padding(
            padding: const EdgeInsets.all(26.0),
            child: state is CartGetProductsLoadingState
                ? const CircularProgressIndicator.adaptive()
                : (state is CartGetProductsErrorState) ||ShopLoginCubit.get(context).cartproducts.isEmpty
                ? const NotFoundResultView()
                : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => CartItem(
                      cartModel:
      ShopLoginCubit.get(context).cartproducts[index],
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 25,
                    ),
                    itemCount: ShopLoginCubit.get(context).cartproducts.length,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: AppTextStyle.bodyText(),
                      ),
                      Text(
                        "${ShopLoginCubit.get(context).price} EGP",
                        style: AppTextStyle.subTitle().copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                DefaultButton(
                  onPress: () {},
                  text: "Checkout",
                ),
              ],
            ),
      ),
          );
        },
      );
  }
}


class CartItem extends StatelessWidget {
  final CartModel cartModel;
  const CartItem({
    Key? key,
    required this.cartModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          15,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage(
                  cartModel.imageUrl),
                 //   'https://img.freepik.com/free-psd/green-houseplant-mockup-psd-banner_53876-137827.jpg?w=1380&t=st=1661300452~exp=1661301052~hmac=322e9c03e18a19226627fdef7d290c7a27832075e8154e459b75b9355042e882'),
                fit: BoxFit.cover,
                height: 90,
                width: 130,
              ),
            ),
          ),
          SizedBox(
            width: 2,
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartModel.name,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                 //   overflow: TextOverflow.ellipsis,
                //  softWrap: true,
                  style: AppTextStyle.bodyText().copyWith(fontSize: 12),
                ),
                Text(
                  '${cartModel.price} EGP',
                  textAlign: TextAlign.start,
                  style: AppTextStyle.bodyText().copyWith(
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CountQuantityWidget(
                      oTapFunc: () {
                        int q = cartModel.quantity;
                        q++;
                        ShopLoginCubit.get(context)
                            .updateProductQuantity(q, cartModel.id);
                      },
                      isIncrement: true,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      cartModel.quantity.toString(),
                      style: AppTextStyle.subTitle(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CountQuantityWidget(
                      oTapFunc: () {
                        int q = cartModel.quantity;
                        if (q > 1) {
                          q--;
                          ShopLoginCubit.get(context)
                              .updateProductQuantity(q, cartModel.id);
                        }
                      },
                      isIncrement: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),

          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () {
                ShopLoginCubit.get(context).removeProduct(cartModel);
                ShopLoginCubit.get(context).getAllCartProducts();

              },
              icon: const Icon(
                Icons.delete,
                color: Colors.green,
              ),
            ),
          )

        ],
      ),
    );
  }
}
