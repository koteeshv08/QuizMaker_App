import 'package:flutter/material.dart';

class OptionTile extends StatefulWidget {
  final String option, description, correctAnswer, optionSelected;

  const OptionTile(
      {Key key,
      @required this.option,
      @required this.description,
      @required this.correctAnswer,
      @required this.optionSelected})
      : super(key: key);

  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
                color: (widget.description == widget.optionSelected)
                    ? widget.optionSelected == widget.correctAnswer
                        ? Colors.green.withOpacity(0.7)
                        : Colors.red.withOpacity(0.7)
                    : Colors.white,
                border: Border.all(
                    color: (widget.description == widget.optionSelected)
                        ? widget.optionSelected == widget.correctAnswer
                            ? Colors.green.withOpacity(0.7)
                            : Colors.red.withOpacity(0.7)
                        : Colors.grey,
                    width: 1.5),
                borderRadius: BorderRadius.circular(30)),
            alignment: Alignment.center,
            child: Text(
              "${widget.option}",
              style: TextStyle(
                  color: (widget.optionSelected == widget.description)
                      ? widget.correctAnswer == widget.optionSelected
                          ? Colors.white
                          : Colors.white
                      : Colors.grey),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            "${widget.description}",
            style: TextStyle(fontSize: 14, color: Colors.black54),
          )
        ],
      ),
    );
  }
}
