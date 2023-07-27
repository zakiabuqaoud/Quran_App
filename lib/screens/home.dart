import 'package:flutter/material.dart';
import 'package:tt9_quraan_app/network.dart';

import '../services/asset.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.allAyahs}) : super(key: key);
  final List<dynamic> allAyahs;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Asset asset = Asset();
  int pageNumber = 0;
  int pageInList = 0;
  final PageController _pageController = PageController(initialPage: 0);


  gg() {
    print(widget.allAyahs[1][1]['aya_text_emlaey']);
    print("zaki");
  }

  increasePageInList() {
    pageInList++;
  }

  decreasePageInList() {
    if(pageInList >= 1){
      pageInList--;

    }
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          reverse: true,
          itemCount: 604,
          onPageChanged: (value){
            print(_pageController.page);
            print(value);
            if(value > _pageController.page!){
              increasePageInList();
            }else{
              decreasePageInList();
            }

            // if(pageNumber>value){
            //   increasePageInList();
            // }else{
            //   decreasePageInList();
            //
            // }
          },
          itemBuilder: (context, index) {
            pageNumber = index + 1;

            return Row(
              mainAxisAlignment: pageNumber % 2 == 0
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              textDirection:
                  pageNumber % 2 == 0 ? TextDirection.rtl : TextDirection.ltr,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 1,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: pageNumber % 2 == 0
                          ? const LinearGradient(
                              colors: [
                                Color(0xfff1cda6),
                                Color(0xffffeec6),
                                Color(0xfffdfcfa),
                              ],
                            )
                          : const LinearGradient(
                              colors: [
                                Color(0xfffdfcfa),
                                Color(0xffffeec6),
                                Color(0xfff1cda6),
                              ],
                            ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                for (int i = 0;
                                    i < widget.allAyahs[pageInList].length;
                                    i++) ...{
                                  TextSpan(
                                      text:
                                          ' ${widget.allAyahs[pageInList][i]['aya_text_emlaey']}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'HafsSmart')),
                                }
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(pageNumber.toString())
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
