import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'chatwith_wkt_model.dart';
export 'chatwith_wkt_model.dart';

class ChatwithWktWidget extends StatefulWidget {
  const ChatwithWktWidget({super.key});

  @override
  State<ChatwithWktWidget> createState() => _ChatwithWktWidgetState();
}

class _ChatwithWktWidgetState extends State<ChatwithWktWidget> {
  late ChatwithWktModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatwithWktModel());

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
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'ia0c55q1' /* Tap to initiate a conversation... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nunito Sans',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
