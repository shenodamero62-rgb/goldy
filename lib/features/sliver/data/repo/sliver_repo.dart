import 'package:dartz/dartz.dart';
import 'package:goldy/core/networking/api_constants.dart';
import 'package:goldy/core/networking/dio_helper.dart';
import 'package:goldy/features/sliver/data/models/sliver_models.dart';

class SliverRepo {
  Future<Either<String, SliverModels>> getSliver() async {
    try {
      final res = await DioHelper.getData(endPoint: ApiConstants.sliverEndPoint);
    print("API Response: ${res.data}");
      return right(SliverModels.fromJosn(res.data as Map<String, dynamic>));
    } catch (e) {
      return left(e.toString());
    }
  }
}
