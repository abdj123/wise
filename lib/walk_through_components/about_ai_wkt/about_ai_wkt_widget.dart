import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'about_ai_wkt_model.dart';
export 'about_ai_wkt_model.dart';

class AboutAiWktWidget extends StatefulWidget {
  const AboutAiWktWidget({super.key});

  @override
  State<AboutAiWktWidget> createState() => _AboutAiWktWidgetState();
}

class _AboutAiWktWidgetState extends State<AboutAiWktWidget> {
  late AboutAiWktModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutAiWktModel());

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
      width: MediaQuery.sizeOf(context).width * 0.5,
      height: MediaQuery.sizeOf(context).height * 0.4,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'fbgyuwvh' /* About page */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nunito Sans',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  '8di8h085' /* Click on the Avatar's profile ... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nunito Sans',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
