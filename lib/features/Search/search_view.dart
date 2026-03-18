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

  @override
  void initState() {
    searchController.addListener(() {
      debouncer.run(() async {
        // call api to search
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
            ],
          ),
        ),
      ),
    );
  }
}
