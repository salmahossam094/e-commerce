import 'package:e_commerce/features/cat_details/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: const Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) => SearchWidget(
        query: query,
      );

  @override
  Widget buildSuggestions(BuildContext context) => SearchWidget(
        query: query,
      );
}
