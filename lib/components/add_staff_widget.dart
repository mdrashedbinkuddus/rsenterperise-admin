import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddStaffWidget extends StatefulWidget {
  const AddStaffWidget({Key key}) : super(key: key);

  @override
  _AddStaffWidgetState createState() => _AddStaffWidgetState();
}

class _AddStaffWidgetState extends State<AddStaffWidget> {
  String dropDownValue;
  TextEditingController confirmPaswordController;
  bool confirmPaswordVisibility;
  TextEditingController emailController;
  TextEditingController nameOfStaffController;
  TextEditingController staffPhoneNumberController;
  TextEditingController paswordController;
  bool paswordVisibility;

  @override
  void initState() {
    super.initState();
    confirmPaswordController = TextEditingController();
    confirmPaswordVisibility = false;
    emailController = TextEditingController();
    nameOfStaffController = TextEditingController();
    staffPhoneNumberController = TextEditingController();
    paswordController = TextEditingController();
    paswordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Staff',
                  style: FlutterFlowTheme.of(context).title2,
                ),
                InkWell(
                  onTap: () async {
                    if (paswordController.text !=
                        confirmPaswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Passwords don\'t match!',
                          ),
                        ),
                      );
                      return;
                    }

                    final user = await createAccountWithEmail(
                      context,
                      emailController.text,
                      paswordController.text,
                    );
                    if (user == null) {
                      return;
                    }

                    final userCreateData = createUserRecordData(
                      displayName: nameOfStaffController.text,
                      rule: dropDownValue,
                      phoneNumber: staffPhoneNumberController.text,
                    );
                    await UserRecord.collection
                        .doc(user.uid)
                        .update(userCreateData);

                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.check_rounded,
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    size: 30,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 20),
              child: TextFormField(
                controller: nameOfStaffController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Name of Staff',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                ),
                style: FlutterFlowTheme.of(context).bodyText1,
                keyboardType: TextInputType.name,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: TextFormField(
                controller: staffPhoneNumberController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Staff Phone Number',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                ),
                style: FlutterFlowTheme.of(context).bodyText1,
                keyboardType: TextInputType.phone,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: TextFormField(
                controller: emailController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                ),
                style: FlutterFlowTheme.of(context).bodyText1,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: TextFormField(
                controller: paswordController,
                obscureText: !paswordVisibility,
                decoration: InputDecoration(
                  labelText: 'Password',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  suffixIcon: InkWell(
                    onTap: () => setState(
                      () => paswordVisibility = !paswordVisibility,
                    ),
                    child: Icon(
                      paswordVisibility
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Color(0xFF757575),
                      size: 22,
                    ),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyText1,
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: TextFormField(
                controller: confirmPaswordController,
                obscureText: !confirmPaswordVisibility,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  suffixIcon: InkWell(
                    onTap: () => setState(
                      () =>
                          confirmPaswordVisibility = !confirmPaswordVisibility,
                    ),
                    child: Icon(
                      confirmPaswordVisibility
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Color(0xFF757575),
                      size: 22,
                    ),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyText1,
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            FlutterFlowDropDown(
              options: ['Accountant', 'General Staff'].toList(),
              onChanged: (val) => setState(() => dropDownValue = val),
              width: 180,
              height: 50,
              textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Source Sans Pro',
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
              hintText: 'Please select...',
              fillColor: Colors.white,
              elevation: 2,
              borderColor: FlutterFlowTheme.of(context).secondaryText,
              borderWidth: 0,
              borderRadius: 5,
              margin: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 4),
              hidesUnderline: true,
            ),
          ],
        ),
      ),
    );
  }
}
