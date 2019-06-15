import 'package:flutter/material.dart';

const kLargeIconSize = 50.0;

const kShadowColor = Color(0x88000000);

const kSuperLargeTextStyle = TextStyle(
  fontSize: 140.0,
  fontWeight: FontWeight.w700,
  shadows: [
    Shadow(
      color: kShadowColor,
      blurRadius: 20.0,
      offset: Offset(1.0, 1.0),
    )
  ],
);

const kLargeEmojiTextStyle = TextStyle(
  fontSize: 80.0,
  shadows: [
    Shadow(
      color: kShadowColor,
      blurRadius: 10.0,
      offset: Offset(1.0, 1.0),
    )
  ],
);

const kLargeFontTextStyle = TextStyle(
  fontSize: 55.0,
  shadows: [
    Shadow(
      color: kShadowColor,
      blurRadius: 15.0,
      offset: Offset(1.0, 1.0),
    )
  ],
);

const kLargeTextPaddingRightAligned = EdgeInsets.fromLTRB(
  70.0,
  0.0,
  5.0,
  15.0,
);

const kDisableLargeTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Colors.grey,
);
