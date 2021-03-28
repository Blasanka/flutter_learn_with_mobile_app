import 'package:flutter/widgets.dart';
import 'package:srp_parent_mobile/src/core/provider/view.state.dart';

class BaseProvider extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}