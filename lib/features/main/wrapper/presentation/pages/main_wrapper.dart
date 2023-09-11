import 'package:flutter/material.dart';


import '../../../../../core/constants/dictionary.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key, this.index}) : super(key: key);

  final int? index;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
 

  List<String> pageKeys = [
    CapstoneDictionary.home,
    CapstoneDictionary.profile
  ];
  String _currentPage = CapstoneDictionary.home;
  int _selectedIndex = 0;

  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    CapstoneDictionary.home: GlobalKey<NavigatorState>(),
    CapstoneDictionary.profile: GlobalKey<NavigatorState>(),
  };

  void _selectTab(int index) {
    setState(() {
      _currentPage = pageKeys[index];
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      _selectTab(widget.index!);
    }
    
  }

  @override
  void dispose() {
  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            await _navigatorKeys[_currentPage]?.currentState?.maybePop();
        if (isFirstRouteInCurrentTab!) {
          if (_currentPage != CapstoneDictionary.home) {
            _selectTab(0);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: const [
            // HomePage(
            //   homePageBloc: _homePageBloc,
            // ),
            // PatientListPage(
            //   patientListBloc: _patientListBloc,
            // ),
            // ProfilePage(profileBloc: _profileBloc),
          ],
        ),
        // bottomNavigationBar: MedtechNavbar(
        //   initialActiveIndex: _selectedIndex,
        //   items: const [
        //     MedtechNavbarItem(
        //       label: MedtechDictionary.home,
        //       asset: IconlyBold.home,
        //     ),
        //     MedtechNavbarItem(
        //       label: MedtechDictionary.patientList,
        //       asset: IconlyBold.paper,
        //     ),
        //     MedtechNavbarItem(
        //       label: MedtechDictionary.profile,
        //       asset: IconlyBold.profile,
        //     ),
        //   ],
        //   onTap: _selectTab,
        // ),
      ),
    );
  }
}
