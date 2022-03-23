/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/icons/logo.png');

  /// File path: assets/icons/logo_plain.png
  AssetGenImage get logoPlain =>
      const AssetGenImage('assets/icons/logo_plain.png');

  /// File path: assets/icons/logo_text.png
  AssetGenImage get logoText =>
      const AssetGenImage('assets/icons/logo_text.png');

  /// File path: assets/icons/logo_text_light.png
  AssetGenImage get logoTextLight =>
      const AssetGenImage('assets/icons/logo_text_light.png');
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/onboarding_slide1.png
  AssetGenImage get onboardingSlide1 =>
      const AssetGenImage('assets/images/onboarding_slide1.png');

  /// File path: assets/images/onboarding_slide2.png
  AssetGenImage get onboardingSlide2 =>
      const AssetGenImage('assets/images/onboarding_slide2.png');

  /// File path: assets/images/onboarding_slide3.png
  AssetGenImage get onboardingSlide3 =>
      const AssetGenImage('assets/images/onboarding_slide3.png');
}

class $AssetsSosialGen {
  const $AssetsSosialGen();

  /// File path: assets/sosial/google.png
  AssetGenImage get google => const AssetGenImage('assets/sosial/google.png');
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSosialGen sosial = $AssetsSosialGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
