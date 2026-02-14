import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:goldy/core/constants/app_images.dart';
import 'package:goldy/core/constants/app_strings.dart';
import 'package:goldy/features/gold/persentation/screen/widgets/custom_text.dart';
import 'package:goldy/features/sliver/data/repo/sliver_repo.dart';
import 'package:goldy/features/sliver/persentation/cubit/sliver_cubit.dart';
import 'package:goldy/features/sliver/persentation/cubit/sliver_states.dart';

class SliverScreen extends StatelessWidget {
  const SliverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SliverCubit(SliverRepo())..getSliver();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(166, 48, 124, 238),
          title: Text(
            AppStrings.sliver,
            style: TextStyle(
              color: const Color.fromARGB(255, 65, 90, 139),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<SliverCubit, SliverStates>(
          builder: (context, state) {
            print(state);

            if (state is SliverLadingState) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }

            if (state is SliverErrorState) {
              return Center(child: Text(state.errMsg));
            }

            if (state is SliverSuccessState) {
              return Center(
                child: Column(
                  children: [
                    const Gap(200),
                    Image.asset(AppImages.sliver, width: 200, height: 250),
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
                              state.sliverModels.price?.toString() ?? "No Price",
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
