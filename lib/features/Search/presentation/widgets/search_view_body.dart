import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/utils/helper/debouncer.dart';
import 'package:mego_food/core/widgets/app_text_field.dart';
import 'package:mego_food/features/search/presentation/cubit/search_cubit.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  TextEditingController searchController = TextEditingController();
  final Debouncer debouncer = Debouncer(milliseconds: 600);
  String lastQuery = '';
  void setupSearchListener() {
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final currentQuery = searchController.text;

    if (currentQuery == lastQuery) return;

    lastQuery = currentQuery;

    debouncer.run(() async {
      await context.read<SearchCubit>().searchByKeyword(currentQuery);
    });
  }

  @override
  void initState() {
    setupSearchListener();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          spacing: 20,
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
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccess) {
                  return Text(
                    'Search results for "${searchController.text}"',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else if (state is SearchLoading) {
                  return const Text('Searching...');
                } else if (state is SearchFailure) {
                  if (searchController.text.isNotEmpty) {
                    return Text(state.message);
                  } else {
                    return const SizedBox.shrink();
                  }
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccess) {
                  var searchResults = state.results;
                  return Expanded(
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
                              errorBuilder: (_, __, ___) => Icon(Icons.image),
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
                  );
                } else if (state is SearchLoading) {
                  return Expanded(
                    child: Center(child: const CircularProgressIndicator()),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
