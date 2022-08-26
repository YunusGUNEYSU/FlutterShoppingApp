import 'package:bloc/bloc.dart';
import 'package:block_network_tutorial/features/home/model/product_model.dart';
import 'package:block_network_tutorial/features/home/service/home_service.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeService) : super(const HomeState()){
    
    Future.wait(
      [fetchAllItems(),
    fetchAllCategories(),
    ]
    );

    
  }
  final IHomeService homeService;

  Future<void> fetchAllItems() async {
    _changeLoading();
    final response= await homeService.fetchAllProducts();
    emit(state.copyWith(items: response??[]));
    _changeLoading();
  }

Future<void> fetchAllCategories() async {
 final response= await homeService.fetchAllCategories();
emit(state.copyWith(categories: response));
}

  void _changeLoading(){
    emit(state.copyWith(isLoading: !(state.isLoading?? false)));
  }
}
