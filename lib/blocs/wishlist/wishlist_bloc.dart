import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:car_spare/repositories/local_storage/local_storage_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/models/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final LocalStorageRepository _localStorageRepository;

  WishlistBloc({required LocalStorageRepository localStorageRepository})
      : _localStorageRepository = localStorageRepository,
        super(WishlistLoading()) {
    on<StartWishlist>(_onStartWishlist);
    on<AddProductToWishlist>(_onAddProductToWishlist);
    on<RemoveProductFromWishlist>(_onRemoveProductFromWishlist);
  }

  void _onStartWishlist(
    StartWishlist event,
    Emitter<WishlistState> emit,
  ) async {
    emit(WishlistLoading());
    try {
      Box box = await _localStorageRepository.openBox();
      List<Product> products = _localStorageRepository.getWishlist(box);
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(
        WishlistLoaded(
          wishlist: Wishlist(products: products),
        ),
      );
    } catch (_) {
      emit(WishlistError());
    }
  }

  void _onAddProductToWishlist(
    AddProductToWishlist event,
    Emitter<WishlistState> emit,
  ) async {
    if (this.state is WishlistLoaded) {
      try {
        Box box = await _localStorageRepository.openBox();
        _localStorageRepository.addProductToWishlist(box, event.product);

        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products:
                  List.from((this.state as WishlistLoaded).wishlist.products)
                    ..add(event.product),
            ),
          ),
        );
      } on Exception {
        emit(WishlistError());
      }
    }
  }

  void _onRemoveProductFromWishlist(
    RemoveProductFromWishlist event,
    Emitter<WishlistState> emit,
  ) async {
    if (this.state is WishlistLoaded) {
      try {
        Box box = await _localStorageRepository.openBox();
        _localStorageRepository.removeProductFromWishlist(box, event.product);

        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products:
                  List.from((this.state as WishlistLoaded).wishlist.products)
                    ..remove(event.product),
            ),
          ),
        );
      } on Exception {
        emit(WishlistError());
      }
    }
  }
}


// OLD CODE
// class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
//   WishlistBloc() : super(WishlistLoading());

//   @override
//   Stream<WishlistState> mapEventToState(
//     WishlistEvent event,
//   ) async* {
//     if (event is StartWishlist) {
//       yield* _mapStartWishlistToState();
//     } else if (event is AddProductToWishlist) {
//       yield* _mapAddWishlistProductToState(event, state);
//     } else if (event is RemoveProductFromWishlist) {
//       yield* _mapRemoveWishlistProductToState(event, state);
//     }
//   }

//   Stream<WishlistState> _mapStartWishlistToState() async* {
//     yield WishlistLoading();
//     try {
//       await Future<void>.delayed(Duration(seconds: 1));
//       yield const WishlistLoaded();
//     } catch (_) {}
//   }

//   Stream<WishlistState> _mapAddWishlistProductToState(
//     AddProductToWishlist event,
//     WishlistState state,
//   ) async* {
//     if (state is WishlistLoaded) {
//       try {
//         yield WishlistLoaded(
//           wishlist: Wishlist(
//             products: List.from(state.wishlist.products)..add(event.product),
//           ),
//         );
//       } catch (_) {}
//     }
//   }
// }

// Stream<WishlistState> _mapRemoveWishlistProductToState(
//   RemoveProductFromWishlist event,
//   WishlistState state,
// ) async* {
//   if (state is WishlistLoaded) {
//     try {
//       yield WishlistLoaded(
//         wishlist: Wishlist(
//           products: List.from(state.wishlist.products)..remove(event.product),
//         ),
//       );
//     } catch (_) {}
//   }
// }
