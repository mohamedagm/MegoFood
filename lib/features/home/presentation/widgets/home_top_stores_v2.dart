import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class HomeTopStores extends StatelessWidget {
  const HomeTopStores({super.key});

  // Sample data for stores
  final List<Map<String, dynamic>> stores = const [
    {
      'name': 'Pizza Hut',
      'image': 'assets/images/pizza_hut.jpg',
      'rating': 4.8,
      'reviews': 1240,
      'location': 'Gota',
      'distance': '2.5 km',
      'time': '20-30 min',
      'discount': '20% OFF',
      'categories': 'Pizza • Italian',
    },
    {
      'name': 'McDonald\'s',
      'image': 'assets/images/mcdonalds.jpg',
      'rating': 4.6,
      'reviews': 2350,
      'location': 'City Center',
      'distance': '1.2 km',
      'time': '15-20 min',
      'discount': 'Free Delivery',
      'categories': 'Burgers • Fast Food',
    },
    {
      'name': 'Starbucks',
      'image': 'assets/images/starbucks.jpg',
      'rating': 4.9,
      'reviews': 890,
      'location': 'Mall',
      'distance': '0.8 km',
      'time': '10-15 min',
      'discount': null,
      'categories': 'Coffee • Bakery',
    },
    {
      'name': 'KFC',
      'image': 'assets/images/kfc.jpg',
      'rating': 4.5,
      'reviews': 1870,
      'location': 'Downtown',
      'distance': '3.1 km',
      'time': '25-35 min',
      'discount': 'Buy 1 Get 1',
      'categories': 'Fried Chicken • Fast Food',
    },
    {
      'name': 'Sushi Master',
      'image': 'assets/images/sushi.jpg',
      'rating': 4.7,
      'reviews': 560,
      'location': 'Business Bay',
      'distance': '4.2 km',
      'time': '30-40 min',
      'discount': '15% OFF',
      'categories': 'Japanese • Sushi',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final store = stores[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _StoreCard(store: store),
          );
        }, childCount: stores.length),
      ),
    );
  }
}

class _StoreCard extends StatelessWidget {
  final Map<String, dynamic> store;

  const _StoreCard({required this.store});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => GoRouter.of(context).push(AppRoutes.productDetails),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section with Overlay
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      store['image'],
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 160,
                        color: Colors.grey[200],
                        child: const Center(
                          child: Icon(Icons.restaurant, size: 50),
                        ),
                      ),
                    ),
                  ),
                  // Discount Badge
                  if (store['discount'] != null)
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.red[600]!, Colors.red[400]!],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withValues(alpha: 0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          store['discount'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  // Favorite Button
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          // Add to favorites logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${store['name']} added to favorites',
                              ),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: Colors.red,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
              // Content Section
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Store Name and Rating Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            store['name'],
                            style: context.exTextStyles.medium.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: context.exColors.baseBlack,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.green[200]!,
                              width: 0.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 14,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                store['rating'].toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[800],
                                ),
                              ),
                              Text(
                                ' (${store['reviews']})',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    // Categories
                    Text(
                      store['categories'],
                      style: context.exTextStyles.small.copyWith(
                        color: context.exColors.grey500,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Location and Time Row
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: context.exColors.grey400,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          store['location'],
                          style: context.exTextStyles.small.copyWith(
                            color: context.exColors.grey500,
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                            color: context.exColors.grey400,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: context.exColors.grey400,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${store['distance']} • ${store['time']}',
                          style: context.exTextStyles.small.copyWith(
                            color: context.exColors.grey500,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              // View menu action
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                color: context.exColors.primary500,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                            ),
                            child: Text(
                              'View Menu',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: context.exColors.primary500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                context.exColors.primary500,
                                (context.exColors.primary500).withValues(
                                  alpha: 0.8,
                                ),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              GoRouter.of(
                                context,
                              ).push(AppRoutes.productDetails);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 8,
                              ),
                            ),
                            child: const Text(
                              'Order Now',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
