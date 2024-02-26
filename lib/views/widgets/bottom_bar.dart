import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onItemSelected;

  const BottomBar({
    Key? key,
    required this.icons,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          widget.icons.length,
          (index) => _buildItem(index),
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    final isSelected = index == widget.selectedIndex;
    final color = isSelected ? Colors.white : Colors.grey;

    return IconButton(
      onPressed: () => widget.onItemSelected(index),
      icon: Icon(widget.icons[index]),
      color: color,
    );
  }
}
