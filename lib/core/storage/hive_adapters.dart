import 'package:hive_ce/hive.dart';
import 'package:mego_food/features/cart/data/models/cart_item_model.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<CartItemModel>(),
])
class HiveAdapters {}
