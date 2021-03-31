import 'dart:async';

import 'package:flutter/material.dart';
import 'package:srp_parent_mobile/src/core/constants/dimensions.dart';
import 'package:srp_parent_mobile/src/core/localization/localization.constants.dart';
import 'package:srp_parent_mobile/src/core/presentation/base.view.dart';
import 'package:srp_parent_mobile/src/core/presentation/empty_space.widget.dart';
import 'package:srp_parent_mobile/src/core/provider/view.state.dart';
import 'package:srp_parent_mobile/src/core/route/route.constants.dart';
import 'package:srp_parent_mobile/src/feature/authentication/presentation/providers/auth.provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AnimationController? _loginButtonAnimationController;
  Animation<double>? _loginButtonSizeAnimation;

  bool _isLoading = false;
  bool _completed = false;

  @override
  void initState() {
    _loginButtonAnimationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    _loginButtonSizeAnimation = Tween<double>(begin: 320, end: 54)
        .animate(_loginButtonAnimationController!)
          ..addListener(() {
            setState(() {});
          });
    super.initState();
  }

  @override
  void dispose() {
    _loginButtonAnimationController!.dispose();
    super.dispose();
  }

  void _playLoginAnimation() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await _loginButtonAnimationController!.forward();

      Timer(Duration(milliseconds: 1400), () {
        setState(() {
          _isLoading = false;
          _loginButtonAnimationController!.reverse();
          _completed = true;
        });

        // replace those lines with your logic
        // e.g. navigation to a new page
        Timer(Duration(milliseconds: 1400), () {
          setState(() {
            _completed = false;
          });
        });

        Future.microtask(() => Navigator.pushNamedAndRemoveUntil(context,
            RouteConstants.studentsListScreen, (_) => false));

      });
    } on TickerCanceled {}
  }

  @override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthProvider>(
      onModelReady: (model) => model.isLoggedIn(),
      builder: (context, provider, child) => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(getTranslated(context, 'login') ?? "",
              style: Theme.of(context).textTheme.headline6),
        ),
        body: provider.state == ViewState.Busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : provider.state == ViewState.Error
                ? Center(
                    child: Text(getTranslated(context, 'somethingWrong') ?? ""),
                  )
                : buildForm(context),
      ),
    );
  }

  Form buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.kPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Username",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            EmptySpaceWidget(height: Dimensions.kEmptySpace),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            EmptySpaceWidget(height: Dimensions.kButtonGap),
            GestureDetector(
              onTap: () => _playLoginAnimation(),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: _completed ? 0.0 : 1.0,
                child: Container(
                    width: _loginButtonSizeAnimation!.value,
                    height: 54.0,
                    alignment: FractionalOffset.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius:
                            BorderRadius.all(const Radius.circular(30.0))),
                    child: !_isLoading && !_completed
                        ? Text(
                            getTranslated(context, "login")!.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.8),
                          )
                        : RefreshProgressIndicator(
                            backgroundColor: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
