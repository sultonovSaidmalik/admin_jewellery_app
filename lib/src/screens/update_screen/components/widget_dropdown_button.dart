import 'package:flutter/material.dart';
import '../../../common/styles/text_style.dart';

class UpdateDropWidget extends StatefulWidget {
  final String value;
  final List<String> values;
  final void Function(String value) onChange;

  const UpdateDropWidget({
    super.key,
    required this.value,
    required this.onChange,
    required this.values,
  });

  @override
  State<UpdateDropWidget> createState() => _UpdateDropWidgetState();
}

class _UpdateDropWidgetState extends State<UpdateDropWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.grey, width: 1)),
      child: Center(
        child: DropdownButton<String>(
          underline: const SizedBox(),
          value: widget.value,
          dropdownColor: Colors.grey.shade900,
          onChanged: (data) {
            if (data != null) {
              widget.onChange(data);
            }
          },
          style: const TextStyle(color: Colors.white),
          selectedItemBuilder: (BuildContext context) {
            return widget.values.map((String value) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  value,
                  style: Styles.textField,
                ),
              );
            }).toList();
          },
          items: widget.values
              .map((e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
