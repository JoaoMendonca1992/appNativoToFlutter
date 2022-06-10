import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_flutter/pages/initial_page/presenter/controller/theme_controller.dart';
import 'package:module_flutter/pages/investment/home_investiment/presenter/component/get_header_component.dart';
import 'package:module_flutter/pages/investment/home_investiment/presenter/component/get_selection_component.dart';
import 'package:module_flutter/pages/investment/home_investiment/presenter/controller/home_investiment_controller.dart';
import 'package:module_flutter/pages/investment/home_investiment/presenter/state/home_investiment_state.dart';
import 'package:module_flutter/utils/components/app_bar_component.dart';
import 'package:module_flutter/utils/components/loading_component.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeInvestimentPage extends StatefulWidget {
  const HomeInvestimentPage({Key? key}) : super(key: key);

  @override
  _HomeInvestimentPageState createState() => _HomeInvestimentPageState();
}

class _HomeInvestimentPageState extends State<HomeInvestimentPage> {
  ThemeController themeController = Modular.get<ThemeController>();
  HomeInvestimentController homeInvestimentController = Modular.get<HomeInvestimentController>();

  @override
  void initState() {
    super.initState();
    homeInvestimentController.get_home(context);
    homeInvestimentController.setState(LoadingHomeInvestimentsState());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent().getAppBar(context, 'Investimentos'),
      body: ResponsiveSizer(builder: (context, orientation, screenType) {
        return Observer(builder: (context) {
          var state = homeInvestimentController.state;
          if(state is InitialHomeInvestimentState){
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getHeaderComponent(context),
                  ListView.builder(
                      itemCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if(homeInvestimentController.homeInvestimentEntite!.investor!.amount! > 0){
                          return getSelectionWithCreditsComponent(context, index);
                        }else{
                          return getSelectionComponent(context, index);
                        }
                      }),
                ],
              ),
            );
          }else if(state is LoadingHomeInvestimentsState){
            return getLoading();
          }
        return getLoading();
        });
      }),
    );
  }
}
