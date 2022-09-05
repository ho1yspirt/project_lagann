import 'package:flutter/material.dart';

class ChipFilter {
  String label;
  Function onSelected;
  Widget? icon;
  ChipFilter(this.label, this.onSelected, {this.icon});
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
          label: Row(
            children: [
              Text(widget.chipsList[i].label),
              widget.chipsList[i].icon ?? const SizedBox.shrink(),
            ],
          ),
          selected: widget.selectedChipIndex == i,
          onSelected: (value) {
            widget.chipsList[i].onSelected();
            setState(
              () {
                widget.selectedChipIndex = i;
              },
            );
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: filterChips(),
        ),
      ),
    );
  }
}
