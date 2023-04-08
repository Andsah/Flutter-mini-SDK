import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class QuantityBar extends StatefulWidget {
  const QuantityBar(
      {super.key, required this.callback, this.min = 0, this.max = 1000});

  final int min;
  final int max;
  final Function callback;

  @override
  State<StatefulWidget> createState() => QuantityBarState();
}

class QuantityBarState extends State<QuantityBar> {
  int quantity = 1;
  late final int min;
  late final int max;

  @override
  void initState() {
    super.initState();
    min = widget.min;
    max = widget.max;
  }

  void setQuantity(int amount) {
    setState(() {
      if (min < amount && amount < max) {
        quantity = amount;
        quantityController.text = quantity.toString();
      }
    });
    widget.callback(quantity);
  }

  TextEditingController quantityController = TextEditingController(text: "1");

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(40)),
      child: Row(children: [
        ElevatedButton(
          onPressed: () {
            setQuantity(quantity + 1);
          },
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(10),
              foregroundColor: Colors.grey.shade400,
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent),
          child: const Icon(Icons.add),
        ),
        VerticalDivider(
          indent: 6,
          endIndent: 6,
          thickness: 1.5,
          width: 2,
          color: Colors.grey.shade300,
        ),
        SizedBox(
            width: 60,
            child: TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                style: GoogleFonts.sourceCodePro(
                    fontSize: 20,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w500),
                controller: quantityController,
                onChanged: (value) {
                  int? num = int.tryParse(value);
                  num ??= 1;
                  setQuantity(num);
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(3),
                  FilteringTextInputFormatter.digitsOnly
                ])),
        VerticalDivider(
          indent: 6,
          endIndent: 6,
          thickness: 1.5,
          width: 2,
          color: Colors.grey.shade300,
        ),
        ElevatedButton(
          onPressed: () {
            setQuantity(quantity - 1);
          },
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(10),
              foregroundColor: Colors.grey.shade400,
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent),
          child: const Icon(Icons.remove),
        ),
      ]),
    );
  }
}
