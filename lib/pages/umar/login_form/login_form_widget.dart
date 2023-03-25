import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_form_model.dart';
export 'login_form_model.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  late LoginFormModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginFormModel());

    _model.passwordTextFieldController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 124.5,
                    decoration: BoxDecoration(
                      color: Color(0x00FFFFFF),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: Color(0x00FFFFFF),
                      image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: Image.network(
                          'https://i0.wp.com/dowellresearch.uk/wp-content/uploads/2018/07/true-moments-logo-2754999236-1532697552477.png?w=439&ssl=1',
                        ).image,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 33.4,
                    decoration: BoxDecoration(
                      color: Color(0x00FFFFFF),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: TextFormField(
                      controller: _model.passwordTextFieldController,
                      onFieldSubmitted: (_) async {
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                      },
                      autofocus: true,
                      obscureText: !_model.passwordTextFieldVisibility,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: FlutterFlowTheme.of(context).bodyText1,
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF048800),
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF045D00),
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF0000),
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF0000),
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => _model.passwordTextFieldVisibility =
                                !_model.passwordTextFieldVisibility,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            _model.passwordTextFieldVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0x98757575),
                            size: 22.0,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                      validator: _model.passwordTextFieldControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 25.0,
                    decoration: BoxDecoration(
                      color: Color(0x00FFFFFF),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      currentUserLocationValue = await getCurrentUserLocation(
                          defaultLocation: LatLng(0.0, 0.0));
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }
                      _model.apiResulthep = await LoginCall.call(
                        password: _model.passwordTextFieldController.text,
                        time: getCurrentTimestamp.toString(),
                        os: isAndroid ? 'android' : 'ios',
                        location: currentUserLocationValue?.toString(),
                      );
                      if (getJsonField(
                        (_model.apiResulthep?.jsonBody ?? ''),
                        r'''$.userinfo.username''',
                      )) {
                        context.pushNamed(
                          'HomePage',
                          queryParams: {
                            'resopnse': serializeParam(
                              (_model.apiResulthep?.jsonBody ?? ''),
                              ParamType.JSON,
                            ),
                          }.withoutNulls,
                        );

                        setState(() {
                          FFAppState().addToLoggedInUser(getJsonField(
                            (_model.apiResulthep?.jsonBody ?? ''),
                            r'''$.userinfo''',
                          ));
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'cannot login right now',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Colors.black,
                          ),
                        );
                      }

                      setState(() {});
                    },
                    text: 'Login',
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF187B2B),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
