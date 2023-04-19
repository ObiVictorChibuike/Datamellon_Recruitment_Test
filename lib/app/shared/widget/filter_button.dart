import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return  Align(alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(10), width: 100, margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Filter"),
              Icon(Icons.arrow_drop_down, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
