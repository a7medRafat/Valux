import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/core/utils/my_Divider.dart';
import 'package:valux/features/order/presentation/widgets/order_quantity.dart';
import '../../../../core/utils/vContainer.dart';
import '../../../cart/data/models/CartModel.dart';
import '../../../cart/presentation/widgets/image.dart';
import '../../../cart/presentation/widgets/name_price.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({super.key, required this.product, required this.counter});

  final Product product;
  final int counter;

  @override
  State<OrderItem> createState() => _CartItemState();
}

class _CartItemState extends State<OrderItem> {
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
                      price: widget.product.price! * widget.counter),
                  const MyDivider(),
                  CartImage(image: widget.product.image!),
                ],
              ),
            ),
          ),
          Align(
              alignment: AlignmentDirectional.bottomStart,
              child: OrderQuantity(quantity: widget.counter.toString())),
        ],
      ),
    );
  }
}
