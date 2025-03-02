import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/walk_through_components/change_photo_wkt/change_photo_wkt_widget.dart';

// Focus widget keys for this walkthrough
final columnFjbktzc9 = GlobalKey();

/// Change Photo
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// show photo steps
      TargetFocus(
        keyTarget: columnFjbktzc9,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => ChangePhotoWktWidget(),
          ),
        ],
      ),
    ];
