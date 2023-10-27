import 'package:flutter/material.dart';

import '../../values/color.dart';

class CustomSearch extends StatefulWidget {
  final Function(String?) onSearch;
  const CustomSearch({
    super.key,
    required this.onSearch,
  });

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  final TextEditingController _searchController = TextEditingController();
  String _lastValue = '';

  @override
  void initState() {
    _searchController.addListener(() {
      setState(() {});
      // if (_searchController.text.trim().isEmpty && _lastValue.isNotEmpty) {
      //   widget.onSearch(null);
      //   _lastValue = '';
      // }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(
          color: borderColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _searchController,
              obscureText: false,
              style: Theme.of(context).textTheme.titleSmall,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                filled: false,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                hintText: 'Search',
              ),
            ),
          ),
          SizedBox(
            width: _searchController.text.trim().isNotEmpty ? 15 : 0,
          ),
          // _searchController.text.trim().isNotEmpty
          //     ? InkWell(
          //         hoverColor: Colors.transparent,
          //         focusColor: Colors.transparent,
          //         splashColor: Colors.transparent,
          //         highlightColor: Colors.transparent,
          //         onTap: () {
          //           _lastValue = _searchController.text.trim();
          //           widget.onSearch(_lastValue);
          //           setState(() {});
          //         },
          //         child: const Icon(
          //           Icons.search,
          //           color: Colors.blue,
          //         ),
          //       )
          //     : const SizedBox(),
          InkWell(
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              _lastValue = _searchController.text.trim();
              widget.onSearch(_lastValue);
              setState(() {});
            },
            child: const Icon(
              Icons.search,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            width: _lastValue.isNotEmpty ? 15 : 0,
          ),
          _lastValue.isNotEmpty
              ? InkWell(
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    _lastValue = '';
                    _searchController.clear();
                    widget.onSearch(null);
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.clear,
                    color: Colors.grey,
                  ),
                )
              : const SizedBox(),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
