import 'package:flutter/material.dart';
import '../utils/ui_data.dart';


class CommonScaffold extends StatelessWidget {
  final appTitle;
  final automaticallyImplyLeading;
  final brightness;
  final leading;
  final tabar;
  final appbarcolor;
  final bool appbarImage;
  final extendBodyBehindAppBar;
  final TextStyle? appbarstyle;
  final Color? backarrow;
  final Widget? bodyData;
  final showFAB;
  final showDrawer;
  final showClipdrawer;
  final showAppBar;
  final String? backGroundImage;
  final Color? backgroundcolor;
  final actionFirstIcon;
  final actionSecondIcon;
  final scaffoldKey;
  final showBottomNav;
  final floatingIcon;
  final centerDocked;
  final elevation;
  final enableHeader;
  final String headerTitle;
  final String headerSubTitle;
  final headerName;
  final topButton;
  final qrCallback;
  final String headerImage;
  final actionFirstIconCallBack;
  final actionSecondIconCallBack;
  final appBarSearch;
  final appBarSearchShow;
  final appBarAction;

  CommonScaffold({
    this.backgroundcolor,
    this.appTitle,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.brightness,
    this.appbarstyle,
    this.appbarImage = false,
    this.tabar = false,
    this.appbarcolor,
    this.extendBodyBehindAppBar = false,
    this.backarrow,
    this.bodyData,
    this.showFAB = false,
    this.showDrawer = false,
    this.showClipdrawer = false,
    this.showAppBar = false,
    this.backGroundImage,
    this.actionFirstIcon = false,
    this.actionSecondIcon = false,
    this.scaffoldKey,
    this.showBottomNav = false,
    this.centerDocked = false,
    this.floatingIcon ,
    this.elevation = 4.0,
    this.enableHeader = false,
    this.headerName = false,
    this.headerTitle = '',
    this.headerSubTitle = '',
    this.topButton = 'menu',
    this.qrCallback,
    this.headerImage = '',
    this.actionFirstIconCallBack,
    this.actionSecondIconCallBack,
    this.appBarSearch,
    this.appBarSearchShow = false,
    this.appBarAction,
  });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: scaffoldKey,
      backgroundColor: backgroundcolor,
      appBar: showAppBar
          ? AppBar(
              iconTheme: IconThemeData(
                color: backarrow ?? const Color(0xffF9F9F9),
              ),
              elevation: elevation,
              automaticallyImplyLeading: automaticallyImplyLeading,
              systemOverlayStyle: brightness,
              leading: leading,
              backgroundColor: appbarcolor,
              title: appbarImage == true
                  ? Image.asset(
                      UIDataImage.splash,
                      width: 100.0,
                      height: 50.0,
                    )
                  : Text(
                      appTitle,
                      style: appbarstyle ?? UIDataTextStyles.kSignInHeading,
                    ),
              actions: appBarAction,
              centerTitle: true,
            )
          : null,
 
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          decoration: BoxDecoration(
            color:
                backgroundcolor ?? const Color(0xffffffff),
        
          ),
       
          width: (MediaQuery.of(context).size.width.ceil()).toDouble(),
          height: (MediaQuery.of(context).size.height.ceil()).toDouble(),
          child: bodyData,
        );
      }),
     
    );
  }
}
