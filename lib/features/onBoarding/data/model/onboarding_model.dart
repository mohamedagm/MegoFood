class OnboardingModel {
  final String image;
  final String title;
  final String subTitle;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

List<OnboardingModel> onboardingPages = [
  OnboardingModel(
    image: 'assets/images/Chef_cooking_light_mode.svg',
    title: 'Welcome to the\nmost tastiest app',
    subTitle: 'You know, this app is edible meaning you\ncan eat it!',
  ),
  OnboardingModel(
    image: 'assets/images/Delivery_guy_light_mode.svg',
    title: 'We use nitro on\nbicycles for delivery!',
    subTitle:
        'For very fast delivery we use nitro on\nbicycles, kidding, but we’re very fast.',
  ),
  OnboardingModel(
    image: 'assets/images/Birthday_girl_light_mode.svg',
    title: 'We’re the besties\nof birthday peoples',
    subTitle: 'We send cakes to our plus members,\n(only one cake per person)',
  ),
];
