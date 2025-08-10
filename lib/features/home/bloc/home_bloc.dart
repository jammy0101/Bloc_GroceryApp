import 'dart:async';
import 'package:bloc_pro/features/home/model/home_product_data_model.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import '../../../data/grocery_data.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event , Emitter<HomeState> emit)async{
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts.map((e) => ProductDataModel(
            id: e['id'],
            name: e['name'],
            price: e['price'],
            description: e['description'],
            imageUrl: e['imageUrl'],
        )).toList(),
    ));
  }
  FutureOr<void> homeProductWishlistButtonClickedEvent(HomeProductWishlistButtonClickedEvent event ,Emitter<HomeState> emit){
    print('Wishlist clicked');
  }

  FutureOr<void>  homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event,Emitter<HomeState> emit){
    print('Cart clicked');
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(HomeWishlistButtonNavigateEvent event,Emitter<HomeState> emit){
    print('Wishlist Navigate clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit){
    print('Cart Navigate clicked');
    emit(HomeNavigateToCartPageActionState());
  }

}
