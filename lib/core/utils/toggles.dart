// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../config/colors/app_colors.dart';
//
// class MyToggles extends StatelessWidget {
//   MyToggles({super.key,
//     required this.children,
//     required this.isSelected,
//     required this.currentIndex});
//
//   final List<Widget> children;
//   final List<bool> isSelected;
//   int currentIndex;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<StatsCubit, StatsState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return ToggleButtons(
//             selectedColor: AppColors.mHint,
//             selectedBorderColor: AppColors.selectedContainer,
//             splashColor: AppColors.mBlue,
//             fillColor: AppColors.mBlue,
//             borderColor: AppColors.mBlue,
//             borderRadius: BorderRadius.circular(10),
//             onPressed: (int index) {
//               sl<StatsCubit>().changeTopicIndex(index,isSelected);
//             },
//             isSelected: isSelected,
//             children: children);
//       },
//     );
//   }
// }
