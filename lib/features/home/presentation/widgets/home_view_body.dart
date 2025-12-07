import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/core/widgets/app_text_field.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  TextEditingController controller = TextEditingController();
  final tabs = [
    'Offers',
    'Burger',
    'Pizza',
    'Donuts',
    'Ice Cream',
    'Soft Drink',
  ];
  int selectedIndex = 0;
  bool showSuggestions = false;
  final FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    searchFocusNode.addListener(() {
      if (!searchFocusNode.hasFocus) {
        setState(() => showSuggestions = false);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              spacing: 16,
              children: [
                //header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi Daniel',
                          style: context.exTextStyles.medium400,
                        ),
                        Text(
                          'What are you carving?',
                          style: context.exTextStyles.large400,
                        ),
                      ],
                    ),
                    CircleAvatar(radius: 24, child: Icon(Icons.person)),
                  ],
                ),
                //search field
                AppTextField(
                  focusNode: searchFocusNode,
                  onTap: () {
                    setState(() => showSuggestions = true);
                  },
                  onChanged: (value) {
                    setState(() => showSuggestions = value.isNotEmpty);
                  },
                  controller: controller,
                  hintText: 'search...',
                  prefixIcon: SvgPicture.asset(
                    'assets/icons/Search.svg',
                    colorFilter: ColorFilter.mode(
                      context.exColors.grey400,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                //offers
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: context.exColors.primary100,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: -40,
                              top: 10,
                              bottom: 10,
                              child: SizedBox(
                                child: Image.asset(
                                  'assets/images/burger_background.png',
                                  height: 150,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Column(
                                    spacing: 12,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '35% OFF on\nBurgers!',
                                        style: context.exTextStyles.heading2,
                                      ),
                                      SizedBox(
                                        width: 125,
                                        height: 32,
                                        child: AppElevatedButton(
                                          buttonType: AppButtonType.primary,
                                          onPressed: () {},
                                          child: Text('Buy now'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5.0,
                                  ),
                                  child: SizedBox(
                                    height: double.infinity,
                                    child: Image.asset(
                                      'assets/images/burger.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                //categories
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemCount: tabs.length,
                    itemBuilder: (context, index) {
                      final isSelected = index == selectedIndex;
                      return ChoiceChip(
                        label: Text(tabs[index]),
                        selected: isSelected,
                        onSelected: (_) {
                          setState(() => selectedIndex = index);
                        },
                        selectedColor: context.exColors.primary100,
                        labelStyle: TextStyle(
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: isSelected
                              ? context.exColors.typography500
                              : context.exColors.typography300,
                        ),
                        side: BorderSide(color: Colors.grey.shade300),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    },
                  ),
                ),
                //products
                Expanded(
                  child: GridView.builder(
                    itemCount: 20,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 220,
                          childAspectRatio: 0.85,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                    itemBuilder: (context, index) {
                      return Card(
                        shadowColor: context.exColors.grey100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                                child: Image.asset(
                                  'assets/images/product.png',
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                'Product Name',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context.exTextStyles.medium,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$12.99',
                                    style: context.exTextStyles.robotoMedium,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: context.exColors.primary100,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(6),
                                    // child: SvgPicture.asset(
                                    //   'assets/icons/add.svg',
                                    //   colorFilter: ColorFilter.mode(
                                    //     context.exColors.primary600,
                                    //     BlendMode.srcIn,
                                    //   ),
                                    // ),
                                    child: Icon(
                                      Icons.add,
                                      color: context.exColors.primary600,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 8),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          if (showSuggestions)
            Positioned.fill(
              child: Container(
                color: const Color(0xA1FFFFFF),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 130, 20, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.exColors.grey0,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: context.exColors.grey200),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          SuggestionItem(text: 'Chocolate boba'),
                          SuggestionItem(text: 'grilled beef burger'),
                          SuggestionItem(text: 'honey bee cake'),
                          SuggestionItem(text: 'classic momos'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class SuggestionItem extends StatelessWidget {
  final String text;
  const SuggestionItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: SvgPicture.asset('assets/icons/Trending.svg'),
      title: Text(text, style: context.exTextStyles.medium400),
      onTap: () {
        // controller.text = text;
        // setState(() => showSuggestions = false);
      },
    );
  }
}
