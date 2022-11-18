import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  const DefaultElevatedButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors. black),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context).textTheme.button!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

class DefaultTextForm extends StatelessWidget {
  const DefaultTextForm({
    Key? key,
    required this.textEditingController,
    required this.suffix,
    required this.label,
    required this.validator,
    required this.onChange,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String label;
  final Widget suffix;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      validator: validator,
      keyboardType: TextInputType.number,
      controller: textEditingController,
      decoration: InputDecoration(
        label: Text(
          label,
          style: Theme.of(context).textTheme.caption,
        ),
        contentPadding: const EdgeInsets.all(10),
        errorText: '',
        border: const OutlineInputBorder(),
        suffix: suffix,
      ),
    );
  }
}

class DefaultHeadLine extends StatelessWidget {
  const DefaultHeadLine({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0,top: 10),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
