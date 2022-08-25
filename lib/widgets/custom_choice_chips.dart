import 'package:flutter/material.dart';

class ChipFilter {
  String label;
  Function onSelected;
  ChipFilter(this.label, this.onSelected);
}

class CustomChoiceChips extends StatefulWidget {
  late int selectedChipIndex;
  final List<ChipFilter> chipsList;
  CustomChoiceChips({
    Key? key,
    required this.selectedChipIndex,
    required this.chipsList,
  }) : super(key: key);

  @override
  State<CustomChoiceChips> createState() => _CustomChoiceChipsState();
}

class _CustomChoiceChipsState extends State<CustomChoiceChips> {
  List<Widget> filterChips() {
    List<Widget> chips = [];
    for (int i = 0; i < widget.chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(right: 12),
        child: ChoiceChip(
          label: Text(widget.chipsList[i].label),
          selected: widget.selectedChipIndex == i,
          onSelected: (bool value) {
            setState(() {
              widget.selectedChipIndex = i;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: filterChips(),
    );
  }
}
