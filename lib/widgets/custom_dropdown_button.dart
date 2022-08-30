// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../utils/constants.dart';

class CustomDropDownButton extends StatefulWidget {
  String selectedItem;
  List<String> items;
  CustomDropDownButton(
      {Key? key, required this.selectedItem, required this.items})
      : super(key: key);

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        //style
        dropdownColor: kSurfaceColor,
        borderRadius: BorderRadius.circular(10),
        iconSize: kIconSize8,
        icon: const Icon(Ionicons.chevron_down, color: kWhiteColor),
        style: kSubtitle1.copyWith(color: kWhiteColor),
        //values
        value: widget.selectedItem,
        items: widget.items
            .map((String item) =>
                DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        //select function
        onChanged: (String? item) =>
            setState(() => widget.selectedItem = item!),
      ),
    );
  }
}
