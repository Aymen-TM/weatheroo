import 'package:flutter/material.dart';

class SearchInpute extends StatefulWidget {
  const SearchInpute(
      {Key? key, required this.focusNode, required this.showSearchBar})
      : super(key: key);

  final FocusNode focusNode;
  final VoidCallback showSearchBar;
  @override
  _SearchInputeState createState() => _SearchInputeState();
}

class _SearchInputeState extends State<SearchInpute> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      autofocus: true,
      focusNode: widget.focusNode,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        fillColor: const Color(0xff030317),
        filled: true,
        hintText: 'Enter a City Name',
      ),
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        var temp;
        if (temp == null) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: const Color(0xff030317),
                  title: Text('City not found'),
                  content: Text('Pleas check the city name'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          widget.showSearchBar();
                        },
                        child: Text("Ok"))
                  ],
                );
              });
        }
      },
    );
  }
}
