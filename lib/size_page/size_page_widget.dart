import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'size_page_model.dart';
export 'size_page_model.dart';

class SizePageWidget extends StatefulWidget {
  const SizePageWidget({Key? key}) : super(key: key);

  @override
  _SizePageWidgetState createState() => _SizePageWidgetState();
}

class _SizePageWidgetState extends State<SizePageWidget> {
  late SizePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SizePageModel());

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
    _model.textController4 ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'oovk1tkr' /* Page Title */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Lexend',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 20.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'aohu8qxl' /* Package Category */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 21.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController1 ??=
                                    FormFieldController<String>(null),
                                options: [
                                  FFLocalizations.of(context).getText(
                                    '1nsjiaeh' /* Document */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'gftd4e6a' /* Electronics */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'h2qdzmq1' /* Glass */,
                                  )
                                ],
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue1 = val),
                                width: 329.0,
                                height: 61.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: FFLocalizations.of(context).getText(
                                  'kz5o9leu' /* Electronics */,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).accent2,
                                borderWidth: 2.0,
                                borderRadius: 20.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 4.0, 12.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'v7kg6xjg' /* Weight */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 21.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController2 ??=
                                            FormFieldController<String>(null),
                                    options: [
                                      FFLocalizations.of(context).getText(
                                        'yq2px4it' /* Option 1 */,
                                      )
                                    ],
                                    onChanged: (val) => setState(
                                        () => _model.dropDownValue2 = val),
                                    width: 68.0,
                                    height: 58.0,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'je3z8aev' /* Kg */,
                                    ),
                                    fillColor:
                                        FlutterFlowTheme.of(context).background,
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0.0,
                                    borderRadius: 0.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 4.0, 12.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 20.0, 16.0),
                                    child: TextFormField(
                                      controller: _model.textController1,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'e4yom70u' /* 0 */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 24.0, 0.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      textAlign: TextAlign.start,
                                      validator: _model.textController1Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ga2thh70' /* Dimension */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 21.0),
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDownValueController3 ??=
                                            FormFieldController<String>(null),
                                        options: [
                                          FFLocalizations.of(context).getText(
                                            'ld3ft9ke' /* In */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            '3qtmeefb' /* Cm */,
                                          )
                                        ],
                                        onChanged: (val) => setState(
                                            () => _model.dropDownValue3 = val),
                                        width: 75.0,
                                        height: 58.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          '4amlam3l' /* Cm */,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .background,
                                        elevation: 2.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0.0,
                                        borderRadius: 0.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 4.0, 12.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 16.0),
                                          child: TextFormField(
                                            controller: _model.textController2,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '1xhwdkxp' /* Insert Height */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent2,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent2,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 24.0, 0.0,
                                                          24.0),
                                            ),
                                            style: TextStyle(),
                                            textAlign: TextAlign.start,
                                            validator: _model
                                                .textController2Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 21.0),
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDownValueController4 ??=
                                            FormFieldController<String>(null),
                                        options: [
                                          FFLocalizations.of(context).getText(
                                            '6t35w1gq' /* Option 1 */,
                                          )
                                        ],
                                        onChanged: (val) => setState(
                                            () => _model.dropDownValue4 = val),
                                        width: 75.0,
                                        height: 58.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          '7b48aa3i' /* Cm */,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .background,
                                        elevation: 2.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0.0,
                                        borderRadius: 0.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 4.0, 12.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 16.0),
                                          child: TextFormField(
                                            controller: _model.textController3,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'i3pwkq57' /* Insert Width */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent2,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent2,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 24.0, 0.0,
                                                          24.0),
                                            ),
                                            style: TextStyle(),
                                            textAlign: TextAlign.start,
                                            validator: _model
                                                .textController3Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 21.0),
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDownValueController5 ??=
                                            FormFieldController<String>(null),
                                        options: [
                                          FFLocalizations.of(context).getText(
                                            'oi3jiv4t' /* Option 1 */,
                                          )
                                        ],
                                        onChanged: (val) => setState(
                                            () => _model.dropDownValue5 = val),
                                        width: 75.0,
                                        height: 58.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'ny82tuj0' /* Cm */,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .background,
                                        elevation: 2.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0.0,
                                        borderRadius: 0.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 4.0, 12.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 16.0),
                                          child: TextFormField(
                                            controller: _model.textController4,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'vcxhfraw' /* Insert Long */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent2,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent2,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 24.0, 0.0,
                                                          24.0),
                                            ),
                                            style: TextStyle(),
                                            textAlign: TextAlign.start,
                                            validator: _model
                                                .textController4Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('PinC');
                  },
                  text: FFLocalizations.of(context).getText(
                    'c1xa7lzs' /* Continue */,
                  ),
                  options: FFButtonOptions(
                    width: 190.0,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Lexend',
                          color: FlutterFlowTheme.of(context).textColor,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
