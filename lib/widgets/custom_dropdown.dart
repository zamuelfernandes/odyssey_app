// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class CustomDropDown extends StatefulWidget {
  TextEditingController? controller;

  final List<String> dropOptions;

  final Function(String) setter;

  final bool elevation;

  final TextStyle textStyle;

  final Widget prefixIcon;

  CustomDropDown({
    Key? key,
    this.controller,
    this.elevation = true,
    this.textStyle = const TextStyle(
      color: AppColors.blue,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    this.prefixIcon = const SizedBox(width: 0),
    this.dropOptions = const ['Select a OPC', 'OPC1', 'OPC2', 'OPC3'],
    required this.setter,
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String dropOption = '';

  @override
  void initState() {
    dropOption = widget.dropOptions.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: widget.elevation ? 5 : 0,
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.black38,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: DropdownButton(
        borderRadius: BorderRadius.circular(25),
        padding: const EdgeInsets.only(left: 15),
        icon: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.purple,
          ),
          margin: const EdgeInsets.only(top: 5, bottom: 5, right: 10),
          child: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
        ),
        iconSize: 30,
        style: widget.textStyle,
        value: dropOption,
        isExpanded: true,
        underline: Container(),
        items: widget.dropOptions
            .map(
              (opcao) => DropdownMenuItem(
                value: opcao,
                child: Text(opcao),
              ),
            )
            .toList(),
        onChanged: (String? escolha) {
          setState(() {
            dropOption = escolha!;
            widget.controller?.text = escolha;
            widget.setter(escolha);
          });
        },
      ),
    );
  }
}
