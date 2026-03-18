import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/utils/functions/custom_snack_bar.dart';
import 'package:mego_food/core/utils/helper/debouncer.dart';
import 'package:mego_food/core/widgets/app_text_field.dart';
import 'package:mego_food/features/Search/cubit/search_cubit.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  TextEditingController searchController = TextEditingController();
  final Debouncer debouncer = Debouncer(milliseconds: 600);
  List<dynamic> searchResults = [];

  @override
  void initState() {
    searchController.addListener(() {
      debouncer.run(() async {
        if (searchController.text.isNotEmpty) {
          await context.read<SearchCubit>().searchByKeyword(
            searchController.text,
          );
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchSuccess) {
          searchResults = state.results;
        } else if (state is SearchFailure) {
          customSnackbar(context, state.message, SnackbarType.error);
          searchResults = [];
        }
      },
      builder: (context, state) {
        return SafeArea(
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
                Text(
                  'Search results for "${searchController.text}"',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundColor: context.exColors.grey300,
                          child: Image.network(
                            searchResults[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(searchResults[index].name),
                        subtitle: Text(searchResults[index].description),
                        trailing: Text(
                          '\$${searchResults[index].price}',
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
        );
      },
    );
  }
}
