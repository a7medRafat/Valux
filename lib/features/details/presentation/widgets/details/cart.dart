import 'package:flutter/cupertino.dart';
import 'package:valux/core/extensions/navigation.dart';
import 'package:valux/core/shared_widgets/app_button.dart';
import 'package:valux/core/utils/vContainer.dart';
import 'package:valux/features/cart/presentation/screens/cart_screen.dart';
import '../../../../../config/colors/app_colors.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    super.key,
    required this.function,
    required this.inCart,
  });

  final Function() function;
  final bool inCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: AppButton(
                function: function,
                txtColor: inCart == true
                    ? AppColors.primaryColor
                    : AppColors.scaffoldColor,
                text: inCart == true ? 'Already in Cart' : 'Add To Cart',
                btnColor: inCart == true
                    ? AppColors.scaffoldColor
                    : AppColors.primaryColor),
          ),
          const SizedBox(width: 10),
          VContainer(
            function: () => context.go(page: const CartScreen()),
            borderRadius: BorderRadius.circular(50),
            padding: const EdgeInsets.all(18),
            color: inCart == true
                ? AppColors.primaryColor
                : AppColors.scaffoldColor,
            child: Icon(
              CupertinoIcons.cart,
              color: inCart == true ? AppColors.vWhite : AppColors.vGray,
            ),
          )
        ],
      ),
    );
  }
}
