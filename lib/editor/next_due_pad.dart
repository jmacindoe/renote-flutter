import 'package:flutter/material.dart';
import 'package:optional/optional.dart';

final List<int> _options = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  10,
  12,
  13,
  14,
  15,
  20,
  25,
  30,
  35,
  40,
  50,
  100
];

class NextDuePad extends StatelessWidget {
  final Function(int) onSelection;
  final Optional<int> currentValue;

  const NextDuePad({Key key, this.onSelection, @required this.currentValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final options = _getOptions(currentValue);

    return GridView.count(
      crossAxisCount: 5,
      shrinkWrap: true,
      children: options.map(_optionWidget).toList(),
    );
  }

  List<int> _getOptions(Optional<int> currentValue) {
    if (currentValue.isPresent && !_options.contains(currentValue.value)) {
      return List.from(_options)
        ..add(currentValue.value)
        ..sort();
    } else {
      return _options;
    }
  }

  Widget _optionWidget(int option) {
    if (currentValue.isPresent && option == currentValue.value) {
      return Text("Selected: $option");
    } else {
      return RaisedButton(
          onPressed: () => onSelection?.call(option), child: Text("$option"));
    }
  }
}
