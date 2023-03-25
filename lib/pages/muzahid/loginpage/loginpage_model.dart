import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginpageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for usernameTextField widget.
  TextEditingController? usernameTextFieldController;
  String? Function(BuildContext, String?)? usernameTextFieldControllerValidator;
  // State field(s) for passwordTextField widget.
  TextEditingController? passwordTextFieldController;
  late bool passwordTextFieldVisibility;
  String? Function(BuildContext, String?)? passwordTextFieldControllerValidator;
  // Stores action output result for [Backend Call - API (login)] action in Button widget.
  ApiCallResponse? apiResulthep;
  // Stores action output result for [Backend Call - API (roomlist)] action in Button widget.
  ApiCallResponse? apiResult9w8;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordTextFieldVisibility = false;
  }

  void dispose() {
    usernameTextFieldController?.dispose();
    passwordTextFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
