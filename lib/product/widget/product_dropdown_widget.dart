import 'package:flutter/material.dart';

class ProductDropDown extends StatefulWidget {
  const ProductDropDown({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<String> items;

  @override
  State<ProductDropDown> createState() => _ProductDropDownState();
}

class _ProductDropDownState extends State<ProductDropDown> {
  String? _selectedValue ;

  @override
  void didUpdateWidget(covariant ProductDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.items!=oldWidget.items&& widget.items.isNotEmpty) {
      _changeValue(widget.items.first);
    }
  }
  void _changeValue(String? data) {
    if (data?.isEmpty ?? true) return;

    setState(() {
      _selectedValue = data!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
       value: _selectedValue,
        items: widget.items
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        onChanged: (String? value) {
          _changeValue(value);
        });
  }
}
