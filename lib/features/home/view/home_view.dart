import 'package:block_network_tutorial/features/home/cubit/home_cubit.dart';
import 'package:block_network_tutorial/features/home/service/home_service.dart';
import 'package:block_network_tutorial/product/constant/app_constant.dart';
import 'package:block_network_tutorial/product/network/product_network_manager.dart';
import 'package:block_network_tutorial/product/padding/page_padding.dart';
import 'package:block_network_tutorial/product/utility/image/project_network_image.dart';
import 'package:block_network_tutorial/product/widget/product_card.dart';
import 'package:block_network_tutorial/product/widget/product_dropdown_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/widget/loading_circular.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with ProductNetworkManager {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeService(service)),
      child: Scaffold(
        appBar: AppBar(
          leading: _dropDownProject(),
          actions: [_loadingCenter()],
        ),
        body: _bodyListView(),
      ),
    );
  }

  Widget _dropDownProject() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ProductDropDown(items:state.categories?? []);
      },
    );
  }

  Widget _bodyListView() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView.builder(
            itemCount: state.items?.length ?? kZero.toInt(),
            itemBuilder: (BuildContext context, int index) => ProductCard(
                  model: state.items?[index],
                ));
      },
    );
  }

  Widget _loadingCenter() {
    return BlocSelector<HomeCubit, HomeState, bool>(
      selector: (state) {
        return state.isLoading ?? false;
      },
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: state ? 1 : kZero,
          duration: const Duration(seconds: 1),
          child: const LoadingCenter(),
        );
      },
    );
  }
}

// class _ProductDropDown extends StatelessWidget {
//   const _ProductDropDown({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ProductDropDown(items: items);
//   }
// }
