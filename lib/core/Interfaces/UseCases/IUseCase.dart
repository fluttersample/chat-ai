import 'package:ai_test/core/Dto/Models/Failure.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

abstract class IUseCase<Type, Params> {
  Future<Either<Failure, Type>> handler({Params params});
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
