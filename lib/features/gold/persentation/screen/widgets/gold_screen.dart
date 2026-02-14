import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:goldy/core/constants/app_colors.dart';
import 'package:goldy/core/constants/app_images.dart';
import 'package:goldy/core/constants/app_strings.dart';
import 'package:goldy/features/gold/data/repo/gold_repo.dart';
import 'package:goldy/features/gold/persentation/cubit/gold_cubit.dart';
import 'package:goldy/features/gold/persentation/cubit/gold_states.dart';
import 'package:goldy/features/gold/persentation/screen/widgets/custom_text.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return GoldCubit(GoldRepo())..getGold();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(166, 238, 197, 48),
          title: Text(
            AppStrings.gold,
            style: TextStyle(
              color: const Color.fromARGB(255, 217, 179, 43),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<GoldCubit, GoldStates>(
          builder: (context, state) {
            print(state);

            if (state is GoldLadingState) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }

            if (state is GoldErrorState) {
              return Center(child: Text(state.errMsg));
            }

            if (state is GoldSuccessState) {
              return Center(
                child: Column(
                  children: [
                    const Gap(200),
                    Image.asset(AppImages.gold, width: 200, height: 250),
                    // Container(
                    //   width: 200,
                    //   height: 180,
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     image: DecorationImage(
                    //       image: AssetImage(AppImages.gold),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          // text: state.goldModels.price.toString(),
                          text:
                              state.goldModels.price?.toString() ?? "No Price",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const Gap(3),
                        const CustomText(
                          text: "EGP",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
