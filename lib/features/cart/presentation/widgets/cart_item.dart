import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/core/utils/my_Divider.dart';
import 'package:valux/features/cart/cubit/carts_cubit.dart';
import '../../../../App/injuctoin_container.dart';
import '../../../../core/utils/vContainer.dart';
import '../../data/models/CartModel.dart';
import 'quantity.dart';
import 'image.dart';
import 'name_price.dart';

class CartItem extends StatefulWidget {
  CartItem({super.key, required this.product, required this.index});

  final Product product;
  final int index;
  int quantity = 1;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return VContainer(
      margin: const EdgeInsets.only(left: 25),
      color: Colors.transparent,
      height: 140.h,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          VContainer(
            color: Colors.white,
            height: 120.h,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NameAndPrice(
                      name: widget.product.name!,
                      price: sl<CartsCubit>().totalPrice(
                          widget.quantity, widget.product.price, widget.index)),
                  const MyDivider(),
                  CartImage(image: widget.product.image!),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Quantity(
              add: () => setState(() {
                widget.quantity++;
              }),
              minus: () {
                if (widget.quantity > 1) {
                  setState(() {
                    widget.quantity--;
                  });
                }
              },
              counter: widget.quantity,
            ),
          ),
        ],
      ),
    );
  }
}
