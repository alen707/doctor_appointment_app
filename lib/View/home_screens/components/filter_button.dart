import 'package:flutter/material.dart';

class FilterButen extends StatefulWidget {
  final String title;
  final int index;
  final VoidCallback ontap;
  final int selectedindex;
  const FilterButen({
    super.key,
    required this.title,
    required this.index,
    required this.ontap,
    required this.selectedindex,
  });

  @override
  State<FilterButen> createState() => _FilterButenState();
}

class _FilterButenState extends State<FilterButen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: Colors.black, width: 1),
          backgroundColor: widget.selectedindex == widget.index
              ? Colors.black
              : Colors.white,
        ),
        onPressed: widget.ontap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 14,
              color: widget.selectedindex == widget.index
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
