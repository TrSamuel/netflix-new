import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';

class ShimmerLoaderHomePage extends StatelessWidget {
  const ShimmerLoaderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: false,
          expandedHeight: 80,
          backgroundColor: AppColors.transparentBlack,
          leading: Padding(
            padding: const .all(8.0),
            child: Image.asset('assets/logo/netflixlogo.png'),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.download)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(childCount: 2, (context, index) {
            final list = [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Stack(
                  alignment: .bottomCenter,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 500,
                      decoration: BoxDecoration(borderRadius: .circular(15)),
                      child: ClipRRect(
                        borderRadius: .circular(15),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                color: const Color.fromARGB(255, 28, 28, 28),
                              ),
                            ),
                            Positioned.fill(
                              child: Container(decoration: BoxDecoration()),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: .only(bottom: 18),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Padding(
                      padding: .only(left: 8, bottom: 8),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 30,

                        decoration: BoxDecoration(
                          color: const .fromARGB(255, 28, 28, 28),
                          borderRadius: .circular(50),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        scrollDirection: .horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const .all(5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: 100,
                                height: 150,
                                color: const Color.fromARGB(255, 28, 28, 28),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ];

            return list[index];
          }),
        ),
      ],
    );
  }
}
