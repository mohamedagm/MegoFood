import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/utils/helper/debouncer.dart';
import 'package:mego_food/core/widgets/app_text_field.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = TextEditingController();
  final Debouncer debouncer = Debouncer(milliseconds: 500);
  List<dynamic> searchResults = [];

  @override
  void initState() {
    searchController.addListener(() {
      debouncer.run(() async {
        // call search API hardcoded
        // ايام الزمن الجميل
        var response = await Dio().get(
          'http://megofood.runasp.net/api/Products/search_product',
          queryParameters: {'keyword': searchController.text},
        );
        searchResults = response.data;
        setState(() {});
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Hero(
                tag: 'search',
                child: Material(
                  child: AppTextField(
                    controller: searchController,
                    hintText: 'search...',
                    prefixIcon: SvgPicture.asset(
                      'assets/icons/Search.svg',
                      colorFilter: ColorFilter.mode(
                        context.exColors.grey400,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),

              // search results will be here
              const SizedBox(height: 20),
              Text('Search results for ${searchController.text}:'),
              Expanded(
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: context.exColors.grey300,
                        child: Image.network(
                          searchResults[index]['imageUrl'] as String,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(searchResults[index]['name'] as String),
                      subtitle: Text(
                        searchResults[index]['description'] as String,
                      ),
                      trailing: Text(
                        '\$${searchResults[index]['price']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
