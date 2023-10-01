import 'dart:io';

import 'package:capstone_project/core/errors/failure.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

Future<Either<Fail, T>> apiCall<T>(Future<T> t) async {
  try {
    final futureCall = await t;
    return Right(futureCall);
  } on SocketException {
    return Left(Fail(message: 'No Internet Connection'));
  } on DioException catch (e) {
    if (e.type == DioExceptionType.unknown) {
      return Left(Fail(message: 'Tidak ada koneksi internet'));
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return Left(
          Fail(message: 'Mohon cek koneksi internet anda dan coba lagi'));
    } else if (e.type == DioExceptionType.cancel) {
      return Left(Fail(message: 'Permintaan dibatalkan'));
    }
    return Left(Fail(message: e.toString()));
  } catch (e) {
    return Left(Fail(message: e.toString()));
  }
}

String fromDioError(DioException dioError) {
  switch (dioError.type) {
    case DioExceptionType.cancel:
      return 'Request to API server was cancelled';
    case DioExceptionType.receiveTimeout:
      return 'Receive timeout in connection with API server';
    case DioExceptionType.sendTimeout:
      return 'Send timeout in connection with API server';
    default:
      return 'Permintaan gagal, silahkan coba lagi atau\nhubungi admin';
  }
}
