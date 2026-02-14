import 'package:dartz/dartz.dart';
import 'package:goldy/core/networking/api_constants.dart';
import 'package:goldy/core/networking/dio_helper.dart';
import 'package:goldy/features/gold/data/models/gold_models.dart';

class GoldRepo {
  Future<Either<String, GoldModels>> getGold() async {
    try {
      final res = await DioHelper.getData(endPoint: ApiConstants.goldEndPoint);
    print("API Response: ${res.data}");
      return right(GoldModels.fromJosn(res.data as Map<String, dynamic>));
    } catch (e) {
      return left(e.toString());
    }
  }

  Future getSliver() async {}
}
