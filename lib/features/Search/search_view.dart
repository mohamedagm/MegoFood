import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mego_food/core/services/setup_service.dart';
import 'package:mego_food/features/Search/cubit/search_cubit.dart';
import 'package:mego_food/features/Search/repo/search_repo.dart';
import 'package:mego_food/features/Search/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchCubit(getIt.get<SearchRepo>()),
        child: const SearchViewBody(),
      ),
    );
  }
}
