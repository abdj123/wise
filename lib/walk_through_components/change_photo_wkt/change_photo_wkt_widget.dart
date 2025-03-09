import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'change_photo_wkt_model.dart';
export 'change_photo_wkt_model.dart';

class ChangePhotoWktWidget extends StatefulWidget {
  const ChangePhotoWktWidget({super.key});

  @override
  State<ChangePhotoWktWidget> createState() => _ChangePhotoWktWidgetState();
}

class _ChangePhotoWktWidgetState extends State<ChangePhotoWktWidget> {
  late ChangePhotoWktModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePhotoWktModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent2,
                    borderRadius: BorderRadius.circular(60.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60.0),
                    child: Image.network(
                      '',
                      width: 120.0,
                      height: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'fj1oe0vz' /* Tap to Change Photo */,
                  ),
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Nunito Sans',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'n1q8g2iq' /* Update your profile picture by... */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nunito Sans',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
