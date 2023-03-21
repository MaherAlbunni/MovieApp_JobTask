import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../error/failure.dart';

class AppBaseController extends GetxController with StateMixin{
  final isLoadingGlobal = false.obs;
  String? connectionError;

  void startLoading({RxBool? isLoading}) {
    if (isLoading != null) {
      isLoading(true);
    }
    isLoadingGlobal(true);
    change(isLoadingGlobal(true), status: RxStatus.loading());
    update();
  }

  void stopLoading({RxBool? isLoading}) {
    if (isLoading != null) {
      isLoading(false);
    }
    isLoadingGlobal(false);
    change(isLoadingGlobal(false), status: RxStatus.success());
    update();
  }

  Future<Either<Failure, T>> futureWrapper<T>(
      Future<Either<Failure, T>> Function() block, {
        bool useLoader = true,
        RxBool? loadingValue,
        VoidCallback? onEveryError,
      }) {
    connectionError = null;
    if (useLoader) {
      loadingValue ??= RxBool(true);
      startLoading(isLoading: loadingValue);
    }
    return Future(() => block().whenComplete(() {
      if (useLoader) {
        loadingValue ??= RxBool(false);
        stopLoading(isLoading: loadingValue);
      }
    }));
  }

  void handleError(Failure failure,
      {void Function(Failure failure)? exceptionHandler}) {
    if (exceptionHandler != null) {
      exceptionHandler.call(failure);
    }
    // if (failure is NetworkFailure) {
    //   Get.to(() => const NoInternetScreen());
    // }
    if (failure is ServerFailure) {
      Get.showSnackbar(GetSnackBar(
        message: failure.message,
        duration: const Duration(milliseconds: 5000),
      ));
    } else {
      Get.back();
      Get.showSnackbar(GetSnackBar(
        message: failure.message,
        duration: const Duration(milliseconds: 5000),
      ));
    }
  }
}