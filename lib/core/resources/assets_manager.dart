const String imagePath = 'assets/images';
const String iconsPath = 'assets/icons';
const String svgPath = 'assets/svg_images';

abstract class PngAssets {
  static const String splashScreen = '$imagePath/splash_screen.png';
  static const String carouselSlider1 = '$imagePath/CarouselSlider1.png';
  static const String carouselSlider2 = '$imagePath/CarouselSlider2.png';
  static const String carouselSlider3 = '$imagePath/CarouselSlider3.png';
}

class SvgAssets{
  static const String routeLogo = '$svgPath/route.svg';
}

abstract class IconsAssets {
  static const String products = '$iconsPath/ic_category.png';
  static const String home = '$iconsPath/ic_home.png';
  static const String profile = '$iconsPath/ic_profile.png';
  static const String withList = '$iconsPath/ic_wish_list.png';
}