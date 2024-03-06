import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import 'auto_suggestion_textfield.dart';

class CustomAutoSearchTextField<T> extends StatefulWidget {
  final List<SearchFieldListItem<T>>? Function(String)? onSearchTextChanged;
  final InputDecoration? searchInputDecoration;
  final TextStyle? suggestionStyle;
  final TextStyle? searchStyle;
  final FocusNode? focusNode;
  final List<SearchFieldListItem<T>> suggestions;
  final TextEditingController? controller;
  final String? hint;
  final int? maxLine;
  final TextInputAction? textInputAction;
  final String? headerText;
  final Widget? suffixIcon;

  const CustomAutoSearchTextField({super.key, this.onSearchTextChanged, this.hint, this.suggestionStyle, this.searchStyle, this.searchInputDecoration, this.focusNode, this.controller, required this.suggestions, this.suffixIcon, this.headerText, this.maxLine, this.textInputAction});

  @override
  State<CustomAutoSearchTextField> createState() => _CustomAutoSearchTextFieldState();
}

class _CustomAutoSearchTextFieldState extends State<CustomAutoSearchTextField> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.headerText ?? "",style: CustomTextStyle.blackMediumFont16Style.copyWith(fontSize: 18.sp),),
        SizedBox(height: widget.headerText == null ? 0 : 6.sp),
        SearchField(
          controller: widget.controller,
          maxLine: widget.maxLine ?? 1,
          suggestionDirection: SuggestionDirection.flex,
          onSearchTextChanged: widget.onSearchTextChanged ,

          //     ?? (query) {
          //   final filter = suggestions
          //       .where((element) =>
          //       element.toLowerCase().contains(query.toLowerCase()))
          //       .toList();
          //   return filter
          //       .map((e) =>
          //       SearchFieldListItem<String>(e, child: searchChild(e)))
          //       .toList();
          // },
          onTap: () {},

          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null ||
                widget.suggestions.contains(value.trim())
            ) {
              return 'Enter a valid country name';
            }
            return null;
          },
          key: const Key('searchfield'),
          hint: widget.hint ?? 'Search TextField Name',
          itemHeight: 48.sp,
          scrollbarDecoration: ScrollbarDecoration(),
          onTapOutside: (x) {
            widget.focusNode?.unfocus();
          },
          suggestionStyle: widget.suggestionStyle ?? TextStyle(fontSize: 16.sp, color: Colors.white),
          searchStyle:widget.searchStyle ??  TextStyle(fontSize: 16.sp, color: Colors.black),
          textInputAction: widget.textInputAction,
          searchInputDecoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 16.sp, color: Colors.grey),
            isDense: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: const BorderSide(
                width: 1,
                color: kBlackColor,
                style: BorderStyle.solid,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.red,
                style: BorderStyle.solid,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: const BorderSide(
                width: 1,
                color: borderColor,
                style: BorderStyle.solid,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: const BorderSide(
                width: 1,
                color: borderColor,
                style: BorderStyle.solid,
              ),
            ),
            fillColor: Colors.white,
            filled: true,
            contentPadding:  EdgeInsets.symmetric(
                horizontal: 10.sp,vertical: 10.sp
            ),

            suffixIcon: widget.suffixIcon,
            suffixIconConstraints: BoxConstraints(maxHeight: 18.sp)
          ),
          /// ========= suggestion decoration =============
          suggestionsDecoration: SuggestionDecoration(
            color: Colors.black12,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(10.sp),
          ),
          suggestions: widget.suggestions,
              // widget.suggestions
              // .map((e) =>
              // SearchFieldListItem<String>(e , child: searchChild(e)))
              // .toList(),
          focusNode: widget.focusNode,
          suggestionState: Suggestion.expand,
          // onSuggestionTap: (SearchFieldListItem<String> x) {
          //   widget.focusNode?.unfocus();
          // },
        ),
      ],
    );
  }

  Widget searchChild(x) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
    child: Text(x, style: TextStyle(fontSize: 16, color: Colors.black)),
  );
}
