import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/app_settings/app_settings_widget.dart';
import '/walk_through_components/chatwith_wkt/chatwith_wkt_widget.dart';

// Focus widget keys for this walkthrough
final icon7wreqift = GlobalKey();

/// App Setting
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// User button
      TargetFocus(
        keyTarget: icon7wreqift,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => AppSettingsWidget(),
          ),
        ],
      ),

      /// aboutai01
      TargetFocus(
        keyTarget: icon7wreqift,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => ChatwithWktWidget(),
          ),
        ],
      ),
    ];
