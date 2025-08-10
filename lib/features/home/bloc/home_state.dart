part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

// I have make this here for the Action
abstract class HomeActionState extends HomeState{}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}

class HomeLoadedSuccessState extends HomeState{
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({
    required this.products,
});
}

class HomeErrorState extends HomeState{}

//Navigation is the Action State
class HomeNavigateToWishlistPageActionState extends HomeActionState{}
//Navigation is the Action State
class HomeNavigateToCartPageActionState extends HomeActionState{}
