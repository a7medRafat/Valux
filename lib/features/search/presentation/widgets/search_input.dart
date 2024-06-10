import 'package:flutter/cupertino.dart';
import '../../../../App/injuctoin_container.dart';
import '../../../../core/utils/default_text_field.dart';
import '../../cubit/search_cubit.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return DefaultField(
        onChanged: (String value) {
          setState(() {
            sl<SearchCubit>().search(text: widget.searchController.text);
          });
        },
        controller: widget.searchController,
        hint: 'search product',
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 15.0),
        borderRadius: BorderRadius.circular(20),
        isPassword: false,
        textInputType: TextInputType.text,
        validation: (value) {
          if (value.isEmpty) {
            return 'search required';
          }
        });
  }
}
