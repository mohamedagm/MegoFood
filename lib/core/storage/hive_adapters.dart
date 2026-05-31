import 'package:hive_ce/hive.dart';
import 'package:mego_food/features/cart/data/models/cart_item_model.dart';
import 'package:mego_food/features/favorite/data/models/favorite_item_model.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<CartItemModel>(),
  AdapterSpec<FavoriteItemModel>(),
])
class HiveAdapters {}
