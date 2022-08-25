import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/costents.dart';
import 'package:netflixapp/presentation/home/widgets/background_card_widget.dart';
import 'package:netflixapp/presentation/home/widgets/main_title_card_widget.dart';
import 'package:netflixapp/presentation/home/widgets/number_widget.dart';
import 'package:netflixapp/presentation/widget/appbar_widget.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);
const homepageImage = [
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ekZobS8isE6mA53RAiGDG93hBxL.jpg',
  'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/KoYWXbnYuS3b0GyQPkbuexlVK9.jpg',
  'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/hJfI6AGrmr4uSHRccfJuSsapvOb.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/rJHC1RUORuUhtfNb4Npclx0xnOf.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/xf9wuDcqlUPWABZNeDKPbZUjWx0.jpg',
  'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/8qHwlezCZzOhq88mnpeqK4asz4n.jpg',
  'https://cdn-images-1.medium.com/max/1200/1*ty4NvNrGg4ReETxqU2N3Og.png',
];

class ScreenHomePage extends StatelessWidget {
  const ScreenHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ValueListenableBuilder(
                valueListenable: scrollNotifier,
                builder: (context, bool value, _) {
                  return NotificationListener<UserScrollNotification>(
                    onNotification: (notification) {
                      final ScrollDirection direction = notification.direction;
                      if (direction == ScrollDirection.reverse) {
                        scrollNotifier.value = false;
                      } else if (direction == ScrollDirection.forward) {
                        scrollNotifier.value = true;
                      }
                      return true;
                    },
                    child: Stack(
                      children: [
                        ListView(
                          children: [
                            const BackgroundcardWidget(),
                            MainTitleCardWidget(
                              title: 'Released in the Past Year',
                              url: homepageImage[0],
                            ),
                            kHeight,
                            MainTitleCardWidget(
                              title: 'Trending Now',
                              url: homepageImage[1],
                            ),
                            const NumberWidget(),
                            MainTitleCardWidget(
                              title: 'Tense Dramas',
                              url: homepageImage[2],
                            ),
                            MainTitleCardWidget(
                              title: 'South Indian cinema',
                              url: homepageImage[3],
                            ),
                          ],
                        ),
                        scrollNotifier.value == true
                            ? AnimatedContainer(
                                duration: const Duration(microseconds: 1000),
                                width: double.infinity,
                                height: 100,
                                color: Colors.black.withOpacity(0.3),
                                child: Column(
                                  children: [
                                    AppbarWidget(
                                      title: Image.network(
                                        homepageImage[6],
                                        width: 70,
                                        height: 70,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: const [
                                        Text(
                                          'TV Shows',
                                          style: textstyle,
                                        ),
                                        Text(
                                          'Movies',
                                          style: textstyle,
                                        ),
                                        Text(
                                          'Categories',
                                          style: textstyle,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                  );
                })),
      ),
    );
  }
}
