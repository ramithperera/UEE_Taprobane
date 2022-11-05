// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cochchi_buyer_app/custom/boarder_view.dart';
// import 'package:cochchi_buyer_app/custom/gradient_background.dart';
// import 'package:cochchi_buyer_app/custom/home_product_grid_item.dart';
// import 'package:cochchi_buyer_app/http/product_route.dart';
// import 'package:cochchi_buyer_app/model/banner_image.dart';
// import 'package:cochchi_buyer_app/model/home_page_category.dart';
// import 'package:cochchi_buyer_app/model/product.dart';
// import 'package:cochchi_buyer_app/model/product_model_for_details.dart';
// import 'package:cochchi_buyer_app/screens/dashboard/main_page.dart';
// import 'package:cochchi_buyer_app/screens/product/category_screen.dart';
// import 'package:cochchi_buyer_app/screens/product/search_product_screen.dart';
// import 'package:cochchi_buyer_app/screens/product/single_product_view.dart';
// import 'package:cochchi_buyer_app/utils/constants.dart';
// import 'package:cochchi_buyer_app/utils/widget_functions.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:sticky_headers/sticky_headers.dart';

// class HomeScreen extends StatefulWidget {
//   final Function goToCart;
//   const HomeScreen({Key? key, required this.goToCart}) : super(key: key);

//   @override
//   HomeScreenState createState() => HomeScreenState();
// }

// class HomeScreenState extends State<HomeScreen>
//     with AutomaticKeepAliveClientMixin {
//   List<HomepageCategory> homePageProducts = [];
//   List<BannerImage> bannerImages = [];

//   final ScrollController _scrollController = ScrollController();

//   Future<void> setProducts(List<HomepageCategory> list) async {
//     setState(() {
//       homePageProducts = list;
//     });
//     scrollToTop();
//   }

//   final PageController controller = PageController(initialPage: 0);

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Future.delayed(Duration.zero, () async {
//       var banners = await getHomePageBanners(context);
//       setState(() {
//         for (var banner in banners) {
//           if (banner.imageType == 1 || banner.imageType == 8) {
//             bannerImages.add(banner);
//           }
//         }
//         // bannerImages = banners;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: colorBackground,
//       child: Column(
//         children: [
//           Image.asset(
//             'assets/images/header_img.png',
//             fit: BoxFit.contain,
//           ),
//           Container(
//             padding: const EdgeInsets.only(top: 8),
//             color: colorWhite,
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: Image.asset(iconPath + 'categories.png'),
//                   onPressed: () => {
//                     _openCategoryScreen(),
//                   },
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                     height: 38,
//                     padding: const EdgeInsets.only(right: 8),
//                     child: GestureDetector(
//                       onTap: () => _gotoSearch(),
//                       child: BoarderView(
//                           child: TextField(
//                               enabled: false,
//                               decoration: const InputDecoration(
//                                 prefixIcon: Icon(Icons.search),
//                                 hintText: 'Search anything',
//                                 hintStyle: TextStyle(color: colorA5),
//                                 border: InputBorder.none,
//                               ),
//                               style: textThemeDefault.bodyText2),
//                           radius: 5),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Expanded(child: gridHeader()),
//         ],
//       ),
//     );
//   }

//   Widget gridHeader() {
//     return SingleChildScrollView(
//       controller: _scrollController,
//       physics: const BouncingScrollPhysics(),
//       child: Column(
//         children: [
//           Stack(
//             alignment: Alignment.bottomCenter,
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
//                 child: SizedBox(
//                     height: 200.0,
//                     child: Container(
//                       child: Swiper(
//                         itemBuilder: (BuildContext context, int index) {
//                           return ClipRRect(
//                             borderRadius: BorderRadius.circular(5),
//                             child: CachedNetworkImage(
//                               memCacheHeight: 1500,
//                               height: 150,
//                               width: double.infinity,
//                               imageUrl: bannerImages[index].image!,
//                               fit: BoxFit.fill,
//                               placeholder: (context, url) => Image.asset(
//                                   imagePath + 'product_default.png'),
//                               errorWidget: (context, url, error) => Image.asset(
//                                   imagePath + 'product_default.png'),
//                             ),
//                           );
//                         },
//                         autoplayDelay: 5000,
//                         autoplay: true,
//                         itemCount: bannerImages.length,
//                         pagination: SwiperPagination(
//                             margin: EdgeInsets.all(0.0),
//                             builder: SwiperCustomPagination(builder:
//                                 (BuildContext context,
//                                     SwiperPluginConfig config) {
//                               return ConstrainedBox(
//                                 child: Align(
//                                   alignment: Alignment.center,
//                                   child: const DotSwiperPaginationBuilder(
//                                           color: Colors.white,
//                                           activeColor: colorBlue,
//                                           space: 4,
//                                           size: 10.0,
//                                           activeSize: 10.0)
//                                       .build(context, config),
//                                 ),
//                                 constraints:
//                                     const BoxConstraints.expand(height: 20.0),
//                               );
//                             })),
//                         control: const SwiperControl(
//                           iconNext: null,
//                           iconPrevious: null,
//                         ),
//                       ),
//                       // PageView.builder(
//                       //   controller: controller,
//                       //   itemCount: bannerImages.length,
//                       //   itemBuilder: (context, index) {
//                       //     return ClipRRect(
//                       //       borderRadius: BorderRadius.circular(5),
//                       //       child: CachedNetworkImage(
//                       //         memCacheHeight: 1500,
//                       //         height: 150,
//                       //         width: double.infinity,
//                       //         imageUrl: bannerImages[index].image!,
//                       //         fit: BoxFit.fill,
//                       //         placeholder: (context, url) =>
//                       //             Image.asset(imagePath + 'product_default.png'),
//                       //         errorWidget: (context, url, error) =>
//                       //             Image.asset(imagePath + 'product_default.png'),
//                       //       ),
//                       //     );
//                       //   },
//                       // ),
//                     )),
//               ),
//               // Padding(
//               //   padding: const EdgeInsets.all(8.0),
//               //   child: SmoothPageIndicator(
//               //     controller: controller,
//               //     count: bannerImages.isEmpty ? 0 : bannerImages.length,
//               //     onDotClicked: (index) => {
//               //     controller.animateToPage(index,
//               //     duration: const Duration(seconds: 1),
//               //     curve: Curves.easeOutSine)
//               //   },
//               //     effect: const WormEffect(
//               //       dotColor: Colors.white,
//               //       activeDotColor: colorBlue,
//               //       dotHeight: 8,
//               //       dotWidth: 40,
//               //       type: WormType.normal,
//               //       // strokeWidth: 5,
//               //     ),
//               //   ),
//               // )
//             ],
//           ),
//           ListView.builder(
//             cacheExtent: 9999,
//             itemCount: homePageProducts.length,
//             physics: const NeverScrollableScrollPhysics(),
//             primary: false,
//             itemBuilder: (context, index) {
//               return Visibility(
//                 visible: homePageProducts[index].products!.isNotEmpty,
//                 child: StickyHeader(
//                   header: Container(
//                     color: Colors.white,
//                     alignment: Alignment.centerLeft,
//                     child: GradientBackground(
//                       text: homePageProducts[index].name!,
//                       width: double.infinity,
//                       height: 40,
//                       radius: 0,
//                     ),
//                   ),
//                   content: Container(
//                     margin: const EdgeInsets.all(8),
//                     child: StaggeredGridView.countBuilder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: homePageProducts[index].products!.length,
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 4,
//                       mainAxisSpacing: 4,
//                       staggeredTileBuilder: (int index) =>
//                           const StaggeredTile.fit(1),
//                       itemBuilder: (contxt, indx) {
//                         return Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           elevation: 0,
//                           margin: const EdgeInsets.all(2.0),
//                           color: Colors.white,
//                           child: InkWell(
//                               onTap: () => goToProductView(
//                                   homePageProducts[index].products![indx]),
//                               child: HomeProductGridItem(
//                                 product:
//                                     homePageProducts[index].products![indx],
//                                 onWishlistClicked: (product) {
//                                   _addRemoveWishList(product);
//                                 },
//                               )),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               );
//             },
//             shrinkWrap: true,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   // TODO: implement wantKeepAlive
//   bool get wantKeepAlive => true;

//   goToProductView(ProductModelForDetails product) async {
//     var response = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => SingleProductView(
//           productId: product.sId!,
//           cartItemCount: 0,
//         ),
//       ),
//     );
//     if (response != null) {
//       if (response.toString() == 'cart') {
//         widget.goToCart();
//       }
//     }
//   }

//   Future<void> _addRemoveWishList(ProductModelForDetails product) async {
//     int status;
//     if (product.wishlit!) {
//       status = 2;
//     } else {
//       status = 1;
//     }
//     var bool = await addRemoveWishlist(context, product.sId, status);
//     if (bool) {
//       product.wishlit = !product.wishlit!;
//       setState(() {});
//     }
//   }

//   _gotoSearch() async {
//     var response = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const SearchProductScreen(),
//       ),
//     );
//     if (response.toString() == 'cart') {
//       widget.goToCart();
//     }
//   }

//   _openCategoryScreen() async {
//     var response = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const CategoryScreen(),
//       ),
//     );
//     if (response.toString() == 'cart') {
//       widget.goToCart();
//     }
//   }

//   Future<void> scrollToTop() async {
//     _scrollController.animateTo(0,
//         duration: const Duration(milliseconds: 500), curve: Curves.ease);
//   }
// }
