import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/style/app_fonts.dart';

class SearchName extends StatelessWidget {
  const SearchName({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: AppFonts.bodyText3.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
