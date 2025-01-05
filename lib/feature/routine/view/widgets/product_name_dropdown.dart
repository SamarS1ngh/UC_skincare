import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductNameDropdown extends StatefulWidget {
  ProductNameDropdown(
      {super.key, required this.productList, required this.currentOne});
  List<String> productList;
  String currentOne;

  @override
  State<ProductNameDropdown> createState() => _ProductNameDropdownState();
}

class _ProductNameDropdownState extends State<ProductNameDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 300.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            borderRadius: BorderRadius.circular(10),
            isExpanded: true,
            value: widget.currentOne,
            items: widget.productList.map((value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: (value) {
              setState(() {
                widget.currentOne = value!;
              });
            }),
      ),
    );
  }
}
