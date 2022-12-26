import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            searchBar(),
            searchSubmit()
          ],
        ),
        filter(),
      ],
    );
  }

  Expanded searchBar() {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Search a thread',
        ),
      ),
    );
  }

  SizedBox searchSubmit() {
    return SizedBox(
      width: 50,
      height: 50,
      child: IconButton(
        onPressed: () {
          
        },
        icon: const Icon(Icons.search)
      ),
    );
  }

  Row filter() {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (value) {
            
          }
        ),
        const Text('Show only favorites')
      ],
    );
  }
}