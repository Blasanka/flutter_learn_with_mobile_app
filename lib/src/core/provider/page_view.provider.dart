import 'package:flutter/material.dart';
import 'package:srp_parent_mobile/src/core/localization/localization.constants.dart';
import 'package:srp_parent_mobile/src/core/provider/base.provider.dart';

class PageViewProvider extends BaseProvider {
  int _selectedPage = 0;
  String _pageTitle = "Calendar";
  bool isClicked = false;

  int get selectedPage => _selectedPage;
  set selectedPage(int page) {
    _selectedPage = page;
    notifyListeners();
  }

  void setSelectedPage(context, int page, PageController controller) {
    _selectedPage = page;
    controller.animateToPage(page, duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
    setPageTitle(context, page);
    notifyListeners();
  }

  void setPageTitle(context, int page) {
    switch (page) {
      case 0:
        _pageTitle = getTranslated(context, 'calendarTitle') ?? "";
        break;
      case 1:
        _pageTitle = getTranslated(context, 'noticesTitle') ?? "";
        break;
      case 2:
        _pageTitle = getTranslated(context, 'studentProfileTitle') ?? "";
        break;
      default:
        _pageTitle = getTranslated(context, 'calendarTitle') ?? "";
        break;
    }
    notifyListeners();
  }
  String get pageTitle => _pageTitle;
}