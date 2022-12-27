import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/filter_thread.dart';
import '../providers/search_query.dart';
import '../utils/constants.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController _controllerQuery = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        SearchQuery searchQuery = context.watch<SearchQuery>();
        FilterThread filterThread = context.watch<FilterThread>();
        

        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            searchBar(searchQuery),
            filter(filterThread),
          ],
        );
      }
    );
  }

  Widget searchBar(SearchQuery searchQuery) {
    return TextField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[.0-9a-zA-Z]")),
        ],
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Search a thread',
        ),
        onChanged: (value) {
          searchQuery.changeQuery(value);
        },
        controller: _controllerQuery,
    );
  }

  Row filter(FilterThread filterThread) {
    return Row(
      children: [
        Checkbox(
          value: filterThread.filterFav,
          onChanged: (value) {
            filterThread.changeFilterFav(value!);
          }
        ),
        const Text('Show only favorites')
      ],
    );
  }
}