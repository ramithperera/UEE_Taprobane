// import 'dart:async';
// import 'dart:collection';
// import 'dart:convert';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cochchi_buyer_app/custom/boarder_view.dart';
// import 'package:cochchi_buyer_app/custom/coupon_list_item.dart';
// import 'package:cochchi_buyer_app/custom/product_attribute_item.dart';
// import 'package:cochchi_buyer_app/custom/product_review_item.dart';
// import 'package:cochchi_buyer_app/custom/related_product_view.dart';
// import 'package:cochchi_buyer_app/http/api.dart';
// import 'package:cochchi_buyer_app/http/order_route.dart';
// import 'package:cochchi_buyer_app/model/coupon.dart';
// import 'package:cochchi_buyer_app/model/order_cart_model.dart';
// import 'package:cochchi_buyer_app/model/overview_response.dart';
// import 'package:cochchi_buyer_app/model/product_model_for_details.dart';
// import 'package:cochchi_buyer_app/model/review_model.dart';
// import 'package:cochchi_buyer_app/screens/order/checkout_page.dart';
// import 'package:cochchi_buyer_app/custom/custom_border_view.dart';
// import 'package:cochchi_buyer_app/custom/custom_progress_bar.dart';
// import 'package:cochchi_buyer_app/custom/header_view.dart';
// import 'package:cochchi_buyer_app/custom/product_inquiry_item.dart';
// import 'package:cochchi_buyer_app/http/product_route.dart';
// import 'package:cochchi_buyer_app/http/profile_route.dart';
// import 'package:cochchi_buyer_app/model/image.dart' as image;
// import 'package:cochchi_buyer_app/model/logged_user.dart';
// import 'package:cochchi_buyer_app/model/product.dart';
// import 'package:cochchi_buyer_app/model/product_delivery_info.dart';
// import 'package:cochchi_buyer_app/model/product_inquiry.dart';
// import 'package:cochchi_buyer_app/model/product_overview.dart';
// import 'package:cochchi_buyer_app/model/profile_detail_model.dart';
// import 'package:cochchi_buyer_app/model/review_count_model.dart';
// import 'package:cochchi_buyer_app/model/simple_product.dart';
// import 'package:cochchi_buyer_app/screens/auth/login_screen.dart';
// import 'package:cochchi_buyer_app/screens/product/ask_question_screen.dart';
// import 'package:cochchi_buyer_app/screens/product/product_rating_view.dart';
// import 'package:cochchi_buyer_app/screens/settings/edit_adderss_screen.dart';
// import 'package:cochchi_buyer_app/utils/constants.dart';
// import 'package:cochchi_buyer_app/utils/widget_functions.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// // ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:share/share.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// // import 'package:webview_flutter/webview_flutter.dart';

// class SingleProductView extends StatefulWidget {
//   final String productId;
//   final int cartItemCount;
//   final Coupon? coupon;

//   const SingleProductView(
//       {Key? key,
//       required this.productId,
//       required this.cartItemCount,
//       this.coupon})
//       : super(key: key);

//   @override
//   _SingleProductViewState createState() => _SingleProductViewState();
// }

// class _SingleProductViewState extends State<SingleProductView> {
//   LoggedUser? logUser;
//   String productId = '';
//   List<image.Image> productImages = [];
//   List<ProductInquiry> inquiryList = [];
//   List<ReviewModel> reviewList = [];
//   List<ProductDeliveryInfo> deliveryInfoList = [];
//   final PageController controller = PageController(initialPage: 0);
//   final PageController couponPageController = PageController(initialPage: 0);
//   int quantity = 1;
//   ProductOverview? productOverview;
//   LoggedUser? loggedUser;
//   ProfileDetailModel? profileDetailModel;

//   String address = "";
//   AddressesWithName? shippingAddress;
//   SimpleProduct? simpleProduct;

//   // final Completer<WebViewController> _controller =
//   // Completer<WebViewController>();
//   double rateOne = 0;
//   double rateTwo = 0;
//   double rateThree = 0;
//   double rateFour = 0;
//   double rateFive = 0;

//   ReviewCountModel? reviewModel;

//   HashMap<String, String> selectedAttributes = HashMap();

//   List<ProductModelForDetails> productList = [];

//   final ScrollController _scrollController = ScrollController();

//   int cartItemCount = 0;

//   List<Coupon> availableCoupons = [];
//   Coupon? coupon;
//   int couponSelectedIndex = -1;

//   double specialPrice = 0;
//   double price = 0;

//   @override
//   void initState() {
//     super.initState();
//     // if (Platform.isAndroid) {
//     //   WebView.platform = SurfaceAndroidWebView();
//     // }
//     Future.delayed(Duration.zero, () async {
//       logUser = await getLoggedUser();
//       setState(() {
//         productId = widget.productId;
//         cartItemCount = widget.cartItemCount;
//       });
//       showLoadingDialog(context);
//       productList = await getProducts(context, '', [], '');
//       hideDialog(context);
//       await setDetails();
//       if (couponSelectedIndex != -1) {
//         couponPageController.animateToPage(couponSelectedIndex,
//             duration: const Duration(seconds: 1), curve: Curves.easeOutSine);
//       }
//       _setProductPrice();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Container(
//         color: colorSpacer,
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 controller: _scrollController,
//                 padding: EdgeInsets.only(bottom: 16),
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     Stack(
//                       children: [
//                         Stack(
//                           alignment: Alignment.bottomCenter,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 4.0, vertical: 4),
//                               child: SizedBox(
//                                   height: 250.0,
//                                   child: PageView.builder(
//                                     controller: controller,
//                                     itemCount: productImages.length,
//                                     itemBuilder: (context, index) {
//                                       return CachedNetworkImage(
//                                         memCacheHeight: 1500,
//                                         height: 150,
//                                         width: double.infinity,
//                                         imageUrl: productImages[index].image!,
//                                         fit: BoxFit.contain,
//                                         placeholder: (context, url) =>
//                                             Image.asset(
//                                                 imagePath + 'cochchi_logo.png'),
//                                         errorWidget: (context, url, error) =>
//                                             Image.asset(
//                                                 imagePath + 'cochchi_logo.png'),
//                                       );
//                                     },
//                                   )),
//                             ),
//                             Visibility(
//                               visible: productImages.length > 1,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: SmoothPageIndicator(
//                                   controller: controller,
//                                   count: productImages.isEmpty
//                                       ? 0
//                                       : productImages.length,
//                                   onDotClicked: (index) => {
//                                     controller.animateToPage(index,
//                                         duration: const Duration(seconds: 1),
//                                         curve: Curves.easeOutSine)
//                                   },
//                                   effect: const WormEffect(
//                                     dotColor: colorD5,
//                                     activeDotColor: colorBlue,
//                                     dotHeight: 8,
//                                     dotWidth: 8,
//                                     type: WormType.normal,
//                                     // strokeWidth: 5,
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             IconButton(
//                               icon: Image.asset(iconPath + 'back_arrow.png'),
//                               onPressed: () => Navigator.pop(context),
//                             ),
//                             Column(
//                               children: [
//                                 Stack(
//                                   children: [
//                                     IconButton(
//                                       icon: Image.asset(iconPath + 'cart.png'),
//                                       onPressed: () => {
//                                         _goToCart(),
//                                       },
//                                     ),
//                                     Visibility(
//                                       visible: cartItemCount > 0,
//                                       child: const Positioned(
//                                         top: 10.0,
//                                         right: 10.0,
//                                         child: Icon(Icons.brightness_1,
//                                             size: 15.0,
//                                             color: Color(0xff4da130)),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 IconButton(
//                                   icon: Image.asset(productOverview == null
//                                       ? iconPath + 'wishlist.png'
//                                       : (!productOverview!.product!.wishlit!
//                                           ? iconPath + 'wishlist.png'
//                                           : iconPath + 'wishlist_filled.png')),
//                                   onPressed: () => {
//                                     _addRemoveWishList(
//                                         productOverview!.product!)
//                                   },
//                                 ),
//                                 IconButton(
//                                   icon: Image.asset(iconPath + 'share.png'),
//                                   onPressed: () => {
//                                     _share(),
//                                   },
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                     Container(
//                       color: colorWhite,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 8.0, vertical: 16),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("Rs." + specialPrice.toStringAsFixed(2),
//                                       style: GoogleFonts.roboto(
//                                           textStyle: const TextStyle(
//                                         color: colorBlue,
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w800,
//                                         fontStyle: FontStyle.normal,
//                                       ))),
//                                   addVerticalSpace(4),
//                                   Visibility(
//                                     visible: productOverview != null &&
//                                         (specialPrice > 0 &&
//                                             price > specialPrice),
//                                     child:
//                                         Text("Rs." + price.toStringAsFixed(2),
//                                             style: GoogleFonts.roboto(
//                                                 textStyle: const TextStyle(
//                                               color: Color(0xff7e7e7e),
//                                               fontWeight: FontWeight.w500,
//                                               fontStyle: FontStyle.normal,
//                                               fontSize: 16.0,
//                                               decoration:
//                                                   TextDecoration.lineThrough,
//                                             )),
//                                             textAlign: TextAlign.left),
//                                   ),
//                                   addVerticalSpace(4),
//                                   Text(
//                                     productOverview == null
//                                         ? ''
//                                         : productOverview!
//                                             .primaryProduct!.productName!,
//                                     style: GoogleFonts.roboto(
//                                         textStyle: const TextStyle(
//                                             color: color33,
//                                             fontWeight: FontWeight.w500,
//                                             fontFamily: "Roboto",
//                                             fontStyle: FontStyle.normal,
//                                             fontSize: 18.0)),
//                                     textAlign: TextAlign.left,
//                                     maxLines: 2,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 RatingBar.builder(
//                                   initialRating: productOverview == null
//                                       ? 0
//                                       : productOverview!.rate!.toDouble(),
//                                   minRating: 0,
//                                   direction: Axis.horizontal,
//                                   allowHalfRating: true,
//                                   unratedColor: colorD5,
//                                   itemCount: 5,
//                                   itemSize: 20.0,
//                                   itemPadding: const EdgeInsets.symmetric(
//                                       horizontal: 0.0),
//                                   itemBuilder: (context, _) => const Icon(
//                                     Icons.star,
//                                     color: colorBlue,
//                                   ),
//                                   updateOnDrag: false,
//                                   ignoreGestures: true,
//                                   onRatingUpdate: (double value) {},
//                                 ),
//                                 addHorizontalSpace(5),
//                                 Text(
//                                     productOverview == null
//                                         ? '0.0'
//                                         : productOverview!.rate!
//                                             .toDouble()
//                                             .toStringAsFixed(1),
//                                     style: const TextStyle(
//                                         color: Color(0xff7e7e7e),
//                                         fontWeight: FontWeight.w400,
//                                         fontFamily: "Roboto",
//                                         fontStyle: FontStyle.normal,
//                                         fontSize: 14.0),
//                                     textAlign: TextAlign.left)
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     addVerticalSpace(4),
//                     Container(
//                       color: colorWhite,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 8.0, vertical: 16),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Image.asset(
//                               iconPath + 'delivery_van.png',
//                               height: 20,
//                             ),
//                             addHorizontalSpace(8),
//                             Expanded(
//                               child: loggedUser != null
//                                   ? Container(
//                                       child: deliveryInfoList.isNotEmpty
//                                           ? Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Text(
//                                                     !productOverview!.product!
//                                                             .isFreeShipping!
//                                                         ? "Delivery Charges : Rs. " +
//                                                             deliveryInfoList[0]
//                                                                 .deliverCharge!
//                                                                 .toDouble()
//                                                                 .toStringAsFixed(
//                                                                     2)
//                                                         : 'Free Shipping',
//                                                     style: const TextStyle(
//                                                         color:
//                                                             Color(0xff333333),
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                         fontFamily: "Roboto",
//                                                         fontStyle:
//                                                             FontStyle.normal,
//                                                         fontSize: 14.0),
//                                                     textAlign: TextAlign.left),
//                                                 addVerticalSpace(4),
//                                                 Text(
//                                                     "Via : " +
//                                                         deliveryInfoList[0]
//                                                             .deliverPartners![0]
//                                                             .deliver!
//                                                             .companyName!,
//                                                     style: const TextStyle(
//                                                         color:
//                                                             Color(0xff6a6a6a),
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                         fontFamily: "Roboto",
//                                                         fontStyle:
//                                                             FontStyle.normal,
//                                                         fontSize: 12.0),
//                                                     textAlign: TextAlign.left)
//                                               ],
//                                             )
//                                           : const Text(
//                                               "Delivery Charges : Rs.0.00 ",
//                                               style: TextStyle(
//                                                   color: Color(0xff333333),
//                                                   fontWeight: FontWeight.w400,
//                                                   fontFamily: "Roboto",
//                                                   fontStyle: FontStyle.normal,
//                                                   fontSize: 14.0),
//                                               textAlign: TextAlign.left))
//                                   : const Text("Login For Delivery Charges ",
//                                       style: TextStyle(
//                                           color: Color(0xff333333),
//                                           fontWeight: FontWeight.w400,
//                                           fontFamily: "Roboto",
//                                           fontStyle: FontStyle.normal,
//                                           fontSize: 14.0),
//                                       textAlign: TextAlign.left),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     addVerticalSpace(4),
//                     Container(
//                       color: colorWhite,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 8.0, vertical: 16),
//                         child: Column(
//                           children: [
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Image.asset(
//                                   iconPath + 'location.png',
//                                   width: 30,
//                                   height: 20,
//                                 ),
//                                 addHorizontalSpace(8),
//                                 Expanded(
//                                   child: address.isNotEmpty
//                                       ? Text(address,
//                                           style: const TextStyle(
//                                               color: Color(0xff333333),
//                                               fontWeight: FontWeight.w400,
//                                               fontFamily: "Roboto",
//                                               fontStyle: FontStyle.normal,
//                                               fontSize: 14.0),
//                                           textAlign: TextAlign.left)
//                                       : const Text('Login to get address',
//                                           style: TextStyle(
//                                               color: Color(0xff333333),
//                                               fontWeight: FontWeight.w400,
//                                               fontFamily: "Roboto",
//                                               fontStyle: FontStyle.normal,
//                                               fontSize: 14.0),
//                                           textAlign: TextAlign.left),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () => {
//                                     if (loggedUser == null)
//                                       {
//                                         _login(),
//                                       }
//                                     else if (address.contains("Add"))
//                                       _goToAddressScreen([])
//                                     else
//                                       _goToAddressScreen(profileDetailModel!
//                                           .addressesWithName!),
//                                   },
//                                   child: Text(
//                                       loggedUser == null
//                                           ? 'Login'
//                                           : address.contains("Add")
//                                               ? 'Add'
//                                               : 'Change',
//                                       style: const TextStyle(
//                                           color: Color(0xff7e7e7e),
//                                           fontWeight: FontWeight.w400,
//                                           fontFamily: "Roboto",
//                                           fontStyle: FontStyle.normal,
//                                           fontSize: 12.0),
//                                       textAlign: TextAlign.left),
//                                 )
//                               ],
//                             ),
//                             Visibility(
//                                 visible: shippingAddress != null &&
//                                     deliveryInfoList.isEmpty,
//                                 child: Container(
//                                   width: double.infinity,
//                                   decoration: const BoxDecoration(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(5)),
//                                     color: colorFc9e,
//                                   ),
//                                   margin: const EdgeInsets.only(top: 8),
//                                   padding: const EdgeInsets.all(8),
//                                   child: Text(
//                                     'Delivery not available to this address.Please change address',
//                                     style: GoogleFonts.roboto(
//                                         textStyle: const TextStyle(
//                                             color: colorWhite,
//                                             fontWeight: FontWeight.w500,
//                                             fontFamily: "Roboto",
//                                             fontStyle: FontStyle.normal,
//                                             fontSize: 14.0)),
//                                   ),
//                                 ))
//                           ],
//                         ),
//                       ),
//                     ),
//                     addVerticalSpace(4),
//                     Visibility(
//                         visible: (simpleProduct != null &&
//                                 simpleProduct!.quantity! > 0) &&
//                             availableCoupons.isNotEmpty,
//                         child: Column(
//                           children: [
//                             addVerticalSpace(4),
//                             Column(
//                               children: [
//                                 const HeaderView(
//                                     iconName: '', title: 'Coupons'),
//                                 Container(
//                                   height: 110,
//                                   color: colorWhite,
//                                   child: PageView.builder(
//                                     controller: couponPageController,
//                                     itemCount: availableCoupons.length,
//                                     itemBuilder: (context, index) {
//                                       return Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 8.0),
//                                         child: CouponListItem(
//                                             onGetOrUseTap: (coupon) {
//                                               _userOrRemoveCoupon(coupon);
//                                             },
//                                             buttonText: availableCoupons[index]
//                                                     .received!
//                                                 ? 'Received'
//                                                 : 'Use It',
//                                             coupon: availableCoupons[index]),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                                 SmoothPageIndicator(
//                                   controller: couponPageController,
//                                   count: availableCoupons.length,
//                                   onDotClicked: (index) => {
//                                     couponPageController.animateToPage(index,
//                                         duration: const Duration(seconds: 1),
//                                         curve: Curves.easeOutSine)
//                                   },
//                                   effect: const WormEffect(
//                                     dotColor: colorD5,
//                                     activeDotColor: colorBlue,
//                                     dotHeight: 8,
//                                     dotWidth: 8,
//                                     type: WormType.normal,
//                                     // strokeWidth: 5,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         )),
//                     Container(
//                       color: colorWhite,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 8.0, vertical: 16),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Image.asset(
//                               iconPath + 'specification.png',
//                               width: 30,
//                               height: 20,
//                             ),
//                             addHorizontalSpace(8),
//                             Expanded(
//                               child: // No.12 ,  New Lane, Colombo 05
//                                   Text(
//                                       simpleProduct != null &&
//                                               simpleProduct!.quantity! > 0
//                                           ? "Quantity"
//                                           : 'Out of stock',
//                                       style: TextStyle(
//                                           color: simpleProduct != null &&
//                                                   simpleProduct!.quantity! > 0
//                                               ? color33
//                                               : colorRed,
//                                           fontWeight: FontWeight.w400,
//                                           fontFamily: "Roboto",
//                                           fontStyle: FontStyle.normal,
//                                           fontSize: 14.0),
//                                       textAlign: TextAlign.left),
//                             ),
//                             Visibility(
//                               visible: simpleProduct != null &&
//                                   simpleProduct!.quantity! > 0,
//                               child: Row(
//                                 children: [
//                                   CustomBoarderView(
//                                     child: const Center(
//                                       child: Text(
//                                         "-",
//                                         style: TextStyle(fontSize: 20.0),
//                                       ),
//                                     ),
//                                     radius: 5,
//                                     borderColor: colorBlue,
//                                     backgroundColor: Colors.transparent,
//                                     onTap: () {
//                                       _changeQty(-1);
//                                     },
//                                     width: 40,
//                                     height: 40,
//                                   ),
//                                   // 1
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 8.0),
//                                     child: Text(quantity.toString(),
//                                         style: GoogleFonts.roboto(
//                                             textStyle: const TextStyle(
//                                                 color: Color(0xff333333),
//                                                 fontWeight: FontWeight.w400,
//                                                 fontFamily: "Roboto",
//                                                 fontStyle: FontStyle.normal,
//                                                 fontSize: 16.0)),
//                                         textAlign: TextAlign.left),
//                                   ),
//                                   CustomBoarderView(
//                                     child: const Center(
//                                       child: Text(
//                                         "+",
//                                         style: TextStyle(fontSize: 20.0),
//                                       ),
//                                     ),
//                                     radius: 5,
//                                     borderColor: colorBlue,
//                                     backgroundColor: Colors.transparent,
//                                     onTap: () {
//                                       _changeQty(1);
//                                     },
//                                     width: 40,
//                                     height: 40,
//                                   )
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     addVerticalSpace(4),
//                     Column(
//                       children: [
//                         const HeaderView(
//                             iconName: 'star.png', title: 'Product Overview'),
//                         if (productOverview != null)
//                           Container(
//                             padding: EdgeInsets.all(8),
//                             color: colorWhite,
//                             child: Html(
//                               data: productOverview!.product!.description!,
//                             ),
//                           )
//                         else
//                           addVerticalSpace(0)
//                       ],
//                     ),
//                     addVerticalSpace(4),
//                     GestureDetector(
//                       onTap: () {
//                         if (reviewList.isNotEmpty) {
//                           _ratingReviewDetails();
//                         }
//                       },
//                       child: Column(
//                         children: [
//                           const HeaderView(
//                               iconName: 'star.png', title: 'Ratings & Reviews'),
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 16, vertical: 8),
//                             color: colorWhite,
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       RichText(
//                                           text: TextSpan(children: [
//                                         TextSpan(
//                                             style: const TextStyle(
//                                                 color: Color(0xff333333),
//                                                 fontWeight: FontWeight.w400,
//                                                 fontFamily: "Roboto",
//                                                 fontStyle: FontStyle.normal,
//                                                 fontSize: 24.0),
//                                             text: productOverview == null
//                                                 ? '0/'
//                                                 : productOverview!.rate!
//                                                         .toDouble()
//                                                         .toStringAsFixed(1) +
//                                                     '/'),
//                                         const TextSpan(
//                                             style: TextStyle(
//                                                 color: Color(0xff333333),
//                                                 fontWeight: FontWeight.w400,
//                                                 fontFamily: "Roboto",
//                                                 fontStyle: FontStyle.normal,
//                                                 fontSize: 14.0),
//                                             text: "5")
//                                       ])),
//                                       addVerticalSpace(4),
//                                       Text(
//                                           reviewModel == null ||
//                                                   reviewModel!.reviewsCount ==
//                                                       null
//                                               ? "0 Ratings | 0 Reviews"
//                                               : "0 Ratings | " +
//                                                   reviewModel!.reviewsCount!
//                                                       .toString() +
//                                                   " Reviews",
//                                           style: const TextStyle(
//                                               color: Color(0xff6a6a6a),
//                                               fontWeight: FontWeight.w400,
//                                               fontFamily: "Roboto",
//                                               fontStyle: FontStyle.normal,
//                                               fontSize: 10.0),
//                                           textAlign: TextAlign.left),
//                                       addVerticalSpace(4),
//                                       RatingBar.builder(
//                                         initialRating: productOverview == null
//                                             ? 0
//                                             : productOverview!.rate!.toDouble(),
//                                         minRating: 0,
//                                         direction: Axis.horizontal,
//                                         allowHalfRating: true,
//                                         unratedColor: colorD5,
//                                         itemCount: 5,
//                                         itemSize: 20.0,
//                                         itemBuilder: (context, _) => const Icon(
//                                           Icons.star,
//                                           color: colorBlue,
//                                         ),
//                                         updateOnDrag: false,
//                                         ignoreGestures: true,
//                                         onRatingUpdate: (double value) {},
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         children: [
//                                           const Text("5",
//                                               style: TextStyle(
//                                                   color: Color(0xff000000),
//                                                   fontWeight: FontWeight.w400,
//                                                   fontFamily: "Roboto",
//                                                   fontStyle: FontStyle.normal,
//                                                   fontSize: 12.0),
//                                               textAlign: TextAlign.left),
//                                           addHorizontalSpace(8),
//                                           Expanded(
//                                               child: CustomProgressBar(
//                                                   max: rateFive == 0
//                                                       ? 1
//                                                       : rateFive * 10,
//                                                   current: rateFive))
//                                         ],
//                                       ),
//                                       Row(
//                                         children: [
//                                           const Text("4",
//                                               style: TextStyle(
//                                                   color: Color(0xff000000),
//                                                   fontWeight: FontWeight.w400,
//                                                   fontFamily: "Roboto",
//                                                   fontStyle: FontStyle.normal,
//                                                   fontSize: 12.0),
//                                               textAlign: TextAlign.left),
//                                           addHorizontalSpace(8),
//                                           Expanded(
//                                               child: CustomProgressBar(
//                                                   max: rateFour == 0
//                                                       ? 1
//                                                       : rateFour * 10,
//                                                   current: rateFour))
//                                         ],
//                                       ),
//                                       Row(
//                                         children: [
//                                           const Text("3",
//                                               style: TextStyle(
//                                                   color: Color(0xff000000),
//                                                   fontWeight: FontWeight.w400,
//                                                   fontFamily: "Roboto",
//                                                   fontStyle: FontStyle.normal,
//                                                   fontSize: 12.0),
//                                               textAlign: TextAlign.left),
//                                           addHorizontalSpace(8),
//                                           Expanded(
//                                               child: CustomProgressBar(
//                                                   max: rateThree == 0
//                                                       ? 1
//                                                       : rateThree * 10,
//                                                   current: rateThree))
//                                         ],
//                                       ),
//                                       Row(
//                                         children: [
//                                           const Text("2",
//                                               style: TextStyle(
//                                                   color: Color(0xff000000),
//                                                   fontWeight: FontWeight.w400,
//                                                   fontFamily: "Roboto",
//                                                   fontStyle: FontStyle.normal,
//                                                   fontSize: 12.0),
//                                               textAlign: TextAlign.left),
//                                           addHorizontalSpace(8),
//                                           Expanded(
//                                               child: CustomProgressBar(
//                                                   max: rateTwo == 0
//                                                       ? 1
//                                                       : rateTwo * 0,
//                                                   current: rateTwo))
//                                         ],
//                                       ),
//                                       Row(
//                                         children: [
//                                           const Text("1",
//                                               style: TextStyle(
//                                                   color: Color(0xff000000),
//                                                   fontWeight: FontWeight.w400,
//                                                   fontFamily: "Roboto",
//                                                   fontStyle: FontStyle.normal,
//                                                   fontSize: 12.0),
//                                               textAlign: TextAlign.left),
//                                           addHorizontalSpace(8),
//                                           Expanded(
//                                               child: CustomProgressBar(
//                                                   max: rateOne == 0
//                                                       ? 1
//                                                       : rateOne * 10,
//                                                   current: rateOne))
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Visibility(
//                             visible: reviewList.isNotEmpty,
//                             child: ListView.builder(
//                               shrinkWrap: true,
//                               physics: const NeverScrollableScrollPhysics(),
//                               itemCount: reviewList.length,
//                               itemBuilder: (context, position) {
//                                 return ProductReviewItem(
//                                     reviewModel: reviewList[position]);
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     addVerticalSpace(4),
//                     Column(
//                       children: [
//                         const HeaderView(
//                             iconName: 'inquires.png',
//                             title: 'Product Inquires'),
//                         inquiryList.isNotEmpty
//                             ? Container(
//                                 color: colorWhite,
//                                 child: Column(
//                                   children: [
//                                     ListView.builder(
//                                       shrinkWrap: true,
//                                       physics:
//                                           const NeverScrollableScrollPhysics(),
//                                       itemCount: inquiryList.length,
//                                       itemBuilder: (context, position) {
//                                         return ProductInquiryItem(
//                                             productInquiry:
//                                                 inquiryList[position]);
//                                       },
//                                     ),
//                                     addVerticalSpace(6),
//                                     GestureDetector(
//                                         onTap: () {
//                                           _productInquireyView();
//                                         },
//                                         child: const Text(
//                                           "Ask Questions",
//                                           style: TextStyle(
//                                               color: colorBlue,
//                                               fontWeight: FontWeight.w400,
//                                               fontFamily: "Roboto",
//                                               fontStyle: FontStyle.normal,
//                                               fontSize: 16.0),
//                                           textAlign: TextAlign.center,
//                                         )),
//                                     addVerticalSpace(12),
//                                   ],
//                                 ),
//                               )
//                             : Visibility(
//                                 visible: productOverview != null,
//                                 child: Container(
//                                   color: colorWhite,
//                                   width: double.infinity,
//                                   padding: EdgeInsets.all(8),
//                                   child: Column(
//                                     children: [
//                                       Text(
//                                           loggedUser != null
//                                               ? "There are no questions yet.\n"
//                                                   "Ask the seller now and their answer will be show here"
//                                               : 'Login to view product inquiries',
//                                           style: const TextStyle(
//                                               color: Color(0xff2e2e2e),
//                                               fontWeight: FontWeight.w400,
//                                               fontFamily: "Roboto",
//                                               fontStyle: FontStyle.normal,
//                                               fontSize: 14.0),
//                                           textAlign: TextAlign.center),
//                                       addVerticalSpace(6),
//                                       GestureDetector(
//                                           onTap: () {
//                                             if (loggedUser != null) {
//                                               _productInquireyView();
//                                             } else {
//                                               _login();
//                                             }
//                                           },
//                                           child: Text(
//                                             loggedUser != null
//                                                 ? "Ask Questions"
//                                                 : 'Login',
//                                             style: const TextStyle(
//                                                 color: colorBlue,
//                                                 fontWeight: FontWeight.w400,
//                                                 fontFamily: "Roboto",
//                                                 fontStyle: FontStyle.normal,
//                                                 fontSize: 16.0),
//                                             textAlign: TextAlign.center,
//                                           ))
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                       ],
//                     ),
//                     addVerticalSpace(4),
//                     Column(
//                       children: [
//                         const HeaderView(iconName: 'store.png', title: 'Store'),
//                         Container(
//                           color: colorWhite,
//                           padding: EdgeInsets.all(8),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                       productOverview == null
//                                           ? ''
//                                           : productOverview!
//                                               .product!.store!.storeName!,
//                                       style: GoogleFonts.roboto(
//                                           textStyle: const TextStyle(
//                                         color: colorBlack,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w800,
//                                         fontStyle: FontStyle.normal,
//                                       )),
//                                       textAlign: TextAlign.left),
//                                   addHorizontalSpace(16),
//                                   BoarderView(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(4.0),
//                                       child: Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           Image.asset(
//                                             iconPath + 'ic_check_circle.png',
//                                             width: 15,
//                                           ),
//                                           addHorizontalSpace(8),
//                                           // Verified
//                                           const Text("Verified",
//                                               style: TextStyle(
//                                                   color: Color(0xff333333),
//                                                   fontWeight: FontWeight.w400,
//                                                   fontFamily: "Roboto",
//                                                   fontStyle: FontStyle.normal,
//                                                   fontSize: 12.0),
//                                               textAlign: TextAlign.left)
//                                         ],
//                                       ),
//                                     ),
//                                     radius: 5,
//                                     borderColor: colorRed,
//                                   )
//                                 ],
//                               ),
//                               addVerticalSpace(8),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   RatingBar.builder(
//                                     initialRating: productOverview == null
//                                         ? 0
//                                         : productOverview!.rate!.toDouble(),
//                                     minRating: 0,
//                                     direction: Axis.horizontal,
//                                     allowHalfRating: false,
//                                     unratedColor: colorD5,
//                                     itemCount: 5,
//                                     itemSize: 20.0,
//                                     itemPadding: const EdgeInsets.symmetric(
//                                         horizontal: 0.0),
//                                     itemBuilder: (context, _) => const Icon(
//                                       Icons.star,
//                                       color: colorBlue,
//                                     ),
//                                     updateOnDrag: false,
//                                     ignoreGestures: true,
//                                     onRatingUpdate: (double value) {},
//                                   ),
//                                   addHorizontalSpace(5),
//                                   Text(
//                                       productOverview == null
//                                           ? '0.0'
//                                           : productOverview!.rate!
//                                               .toDouble()
//                                               .toStringAsFixed(1),
//                                       style: const TextStyle(
//                                           color: Color(0xff7e7e7e),
//                                           fontWeight: FontWeight.w400,
//                                           fontFamily: "Roboto",
//                                           fontStyle: FontStyle.normal,
//                                           fontSize: 14.0),
//                                       textAlign: TextAlign.left)
//                                 ],
//                               ),
//                               addVerticalSpace(8),
//                               Text(
//                                   reviewModel == null
//                                       ? "0 Product Reviews"
//                                       : reviewModel!.reviewsCount.toString() +
//                                           " Product Reviews",
//                                   style: const TextStyle(
//                                       color: Color(0xff6a6a6a),
//                                       fontWeight: FontWeight.w400,
//                                       fontFamily: "Roboto",
//                                       fontStyle: FontStyle.normal,
//                                       fontSize: 10.0),
//                                   textAlign: TextAlign.left)
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     addVerticalSpace(4),
//                     Container(
//                       width: double.infinity,
//                       color: colorWhite,
//                       padding: EdgeInsets.all(8),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text("Related Products",
//                               style: GoogleFonts.roboto(
//                                   textStyle: const TextStyle(
//                                 color: color33,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 fontStyle: FontStyle.normal,
//                               )),
//                               textAlign: TextAlign.left),
//                           addVerticalSpace(16),
//                           RelatedProductView(
//                             productList: productList,
//                             onSelect: (selectedProduct) {
//                               if (productId != selectedProduct.sId) {
//                                 setState(() {
//                                   productId = selectedProduct.sId;
//                                 });
//                                 setDetails();
//                               }
//                             },
//                             onWishlistClick: (product) {
//                               _addRemoveWishList(product);
//                             },
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Visibility(
//               visible: simpleProduct != null && simpleProduct!.quantity! > 0,
//               child: Container(
//                 color: colorWhite,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: RaisedButton(
//                         color: Colors.white,
//                         onPressed: () {
//                           addToCart();
//                         },
//                         child: Container(
//                           height: 50,
//                           child: // Add to Cart
//                               const Center(
//                             child: Text("Add to Cart",
//                                 style: TextStyle(
//                                     color: colorBlue,
//                                     fontWeight: FontWeight.w400,
//                                     fontFamily: "Roboto",
//                                     fontStyle: FontStyle.normal,
//                                     fontSize: 16.0),
//                                 textAlign: TextAlign.left),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: RaisedButton(
//                         color: colorBlue,
//                         onPressed: () {
//                           // if (simpleProduct != null &&
//                           //     simpleProduct!.quantity! > quantity) {
//                           buyNow();
//                           // }
//                         },
//                         child: Container(
//                             height: 50,
//                             child: // Buy Now
//                                 const Center(
//                               child: Text("Buy Now",
//                                   style: TextStyle(
//                                       color: Color(0xffffffff),
//                                       fontWeight: FontWeight.w400,
//                                       fontFamily: "Roboto",
//                                       fontStyle: FontStyle.normal,
//                                       fontSize: 16.0),
//                                   textAlign: TextAlign.left),
//                             )),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     ));
//   }

//   _changeQty(int i) async {
//     if (i < 1 && quantity == 1) return;
//     if (i == 1 && quantity == productOverview!.product!.maxLimit) {
//       showToastMessage('Maximum order quantity limit : ' +
//           productOverview!.product!.maxLimit.toString());
//       return;
//     }

//     if (i == 1 && quantity == productOverview!.primaryProduct!.quantity) {
//       showToastMessage('Maximum stock quantity reached!');
//       return;
//     }
//     setState(() {
//       quantity = quantity + i;
//     });
//     showLoadingDialog(context);
//     _getDeliveryCharges();
//     hideDialog(context);
//   }

//   buyNow() async {
//     if (loggedUser == null) {
//       _login();
//       return;
//     }
//     if (shippingAddress == null) {
//       showToastMessage('Please enter address before checkout.');
//       return;
//     }
//     if (deliveryInfoList.isEmpty) {
//       showToastMessage(
//           'Delivery not available to this address.Please change address and try');
//       return;
//     }
//     if (productOverview == null || simpleProduct == null) {
//       showToastMessage('Failed to checkout.Try again..');
//       return;
//     }

//     if (simpleProduct!.attributes!.length > 1) {
//       openBottomSheet();
//     } else {
//       goToCheckout();
//     }
//   }

//   goToCheckout() async {
//     if (shippingAddress == null) {
//       showToastMessage('Please enter address before checkout.');
//       return;
//     }

//     if (deliveryInfoList.isEmpty) {
//       showToastMessage(
//           'Delivery not available to this address.Please change address and try');
//       return;
//     }
//     OrderCartModel cartModel = OrderCartModel();
//     cartModel.simpleProduct = simpleProduct;
//     cartModel.overviewResponse = productOverview!.product!;
//     cartModel.selectedQty = quantity;
//     if (coupon != null) {
//       cartModel.coupon = coupon;
//     }

//     List<OrderCartModel> productList = [cartModel];
//     var response = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CheckoutPage(
//           productList: productList,
//           profileDetailModel: profileDetailModel!,
//           deliveryInfo: deliveryInfoList,
//           shippingAddress: shippingAddress!,
//         ),
//       ),
//     );
//     if (response != null) {
//       if (coupon != null) {
//         Navigator.pop(context, true);
//       } else {
//         Navigator.pop(context);
//       }
//     }
//   }

//   Future<void> _login() async {
//     var response = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const LoginScreen(
//           loginFor: 'checkout',
//         ),
//       ),
//     );
//     if (response != null && response) {
//       loggedUser = await getLoggedUser();
//       await _getProfileDetails();
//       setState(() {});
//     }
//   }

//   Future<void> _addRemoveWishList(OverviewResponse product) async {
//     if (loggedUser == null) {
//       _login();
//       return;
//     }
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

//   openBottomSheet() {
//     showModalBottomSheet<void>(
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(20),
//           ),
//         ),
//         isScrollControlled: true,
//         context: context,
//         builder: (BuildContext context) {
//           return StatefulBuilder(builder: (context, setState) {
//             return Container(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Row(
//                       children: [
//                         // Samsung Galaxy M30
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(simpleProduct!.productName!,
//                                   style: GoogleFonts.roboto(
//                                       textStyle: const TextStyle(
//                                     color: color33,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w400,
//                                     fontStyle: FontStyle.normal,
//                                   )),
//                                   textAlign: TextAlign.left),
//                               addVerticalSpace(8),
//                               Text(
//                                 "Rs. " + specialPrice.toStringAsFixed(2),
//                                 style: GoogleFonts.roboto(
//                                     textStyle: const TextStyle(
//                                   color: colorBlue,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500,
//                                   fontStyle: FontStyle.normal,
//                                 )),
//                               ),
//                               addVerticalSpace(8),
//                               // Quantity
//                               Text("Quantity",
//                                   style: GoogleFonts.roboto(
//                                       textStyle: const TextStyle(
//                                     color: color33,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400,
//                                     fontStyle: FontStyle.normal,
//                                   )),
//                                   textAlign: TextAlign.left),
//                               addVerticalSpace(8),
//                               Row(
//                                 children: [
//                                   CustomBoarderView(
//                                     child: const Center(
//                                       child: Text(
//                                         "-",
//                                         style: TextStyle(fontSize: 20.0),
//                                       ),
//                                     ),
//                                     radius: 5,
//                                     borderColor: colorBlue,
//                                     backgroundColor: Colors.transparent,
//                                     onTap: () {
//                                       _changeQty(-1);
//                                       setState(() {});
//                                     },
//                                     width: 30,
//                                     height: 30,
//                                   ),
//                                   // 1
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 8.0),
//                                     child: Text(quantity.toString(),
//                                         style: GoogleFonts.roboto(
//                                             textStyle: const TextStyle(
//                                                 color: Color(0xff333333),
//                                                 fontWeight: FontWeight.w400,
//                                                 fontFamily: "Roboto",
//                                                 fontStyle: FontStyle.normal,
//                                                 fontSize: 16.0)),
//                                         textAlign: TextAlign.left),
//                                   ),
//                                   CustomBoarderView(
//                                     child: const Center(
//                                       child: Text(
//                                         "+",
//                                         style: TextStyle(fontSize: 20.0),
//                                       ),
//                                     ),
//                                     radius: 5,
//                                     borderColor: colorBlue,
//                                     backgroundColor: Colors.transparent,
//                                     onTap: () {
//                                       _changeQty(1);
//                                       setState(() {});
//                                     },
//                                     width: 30,
//                                     height: 30,
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         addHorizontalSpace(16),
//                         Expanded(
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(5),
//                             child: CachedNetworkImage(
//                               memCacheHeight: 1500,
//                               height: 150,
//                               width: double.infinity,
//                               imageUrl: simpleProduct!.images![0].image!,
//                               fit: BoxFit.fill,
//                               placeholder: (context, url) => Image.asset(
//                                   imagePath + 'product_default.png'),
//                               errorWidget: (context, url, error) => Image.asset(
//                                   imagePath + 'product_default.png'),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: simpleProduct!.attributes!.length,
//                       itemBuilder: (context, position) {
//                         return ProductAttributeItem(
//                           attribute:
//                               productOverview!.availableAttribute![position],
//                           onSelectAttribute: (selectedAttribute) => {
//                             if (selectedAttributes.containsKey(productOverview!
//                                 .availableAttribute![position].sId))
//                               {
//                                 selectedAttributes.remove(productOverview!
//                                     .availableAttribute![position].sId)
//                               },
//                             productOverview!
//                                 .availableAttribute![position].attributeValues!
//                                 .forEach((element) {
//                               element.isSelect = false;
//                             }),
//                             selectedAttribute.isSelect =
//                                 !selectedAttribute.isSelect!,
//                             if (selectedAttribute.isSelect)
//                               {
//                                 selectedAttributes.putIfAbsent(
//                                     productOverview!
//                                         .availableAttribute![position].sId!,
//                                     () => selectedAttribute.sId!),
//                               },
//                             setState(() {}),
//                             _getSimpleProductByAttribute(productOverview!)
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                   addVerticalSpace(8),
//                   Container(
//                     color: colorWhite,
//                     height: 50,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: RaisedButton(
//                             color: Colors.white,
//                             onPressed: () {
//                               _saveCart();
//                             },
//                             child: Container(
//                               height: 50,
//                               child: // Add to Cart
//                                   const Center(
//                                 child: Text("Add to Cart",
//                                     style: TextStyle(
//                                         color: colorBlue,
//                                         fontWeight: FontWeight.w400,
//                                         fontFamily: "Roboto",
//                                         fontStyle: FontStyle.normal,
//                                         fontSize: 16.0),
//                                     textAlign: TextAlign.left),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: RaisedButton(
//                             color: colorBlue,
//                             onPressed: () {
//                               if (simpleProduct != null &&
//                                   simpleProduct!.quantity! > quantity) {
//                                 hideDialog(context);
//                                 goToCheckout();
//                               }
//                             },
//                             child: Container(
//                                 height: 50,
//                                 child: // Buy Now
//                                     const Center(
//                                   child: Text("Buy Now",
//                                       style: TextStyle(
//                                           color: Color(0xffffffff),
//                                           fontWeight: FontWeight.w400,
//                                           fontFamily: "Roboto",
//                                           fontStyle: FontStyle.normal,
//                                           fontSize: 16.0),
//                                       textAlign: TextAlign.left),
//                                 )),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           });
//         });
//   }

//   _getSimpleProductByAttribute(ProductOverview productOverviewRes) async {
//     var objArray = [];
//     var obj;
//     selectedAttributes.forEach((key, value) {
//       obj = {"attribute_id": key, "attribute_value_id": value};
//       objArray.add(obj);
//     });
//     var object = jsonEncode(<String, dynamic>{
//       "product_id": productOverviewRes.product!.sId!,
//       "attributes": objArray
//     });
//     if (object.isNotEmpty) {
//       simpleProduct = await getSimpleProductByAttribute(context, object);
//       setState(() {});
//     }
//   }

//   _goToAddressScreen(List<AddressesWithName> addressList) async {
//     var response = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => EditAddressScreen(
//           addressList: addressList,
//           action: 'add',
//         ),
//       ),
//     );
//     if (response != null && response) {
//       _getProfileDetails();
//     }
//   }

//   Future<void> _getDeliveryCharges() async {
//     if (shippingAddress != null && !productOverview!.product!.isFreeShipping!) {
//       var body = {
//         "product_id": productId,
//         "simple_product_id": simpleProduct!.sId!,
//         "qty": quantity,
//         "city": logUser!.cityName!,
//         "zone": logUser!.zone!,
//       };
//       deliveryInfoList = await getProductDeliveryInfo(context, [body]);
//       setState(() {});
//     }
//   }

//   _getProfileDetails() async {
//     var profile = await getProfileDetails(context);
//     if (profile != null) {
//       for (var address in profile.addressesWithName!) {
//         if (address.isShippingAddress!) {
//           shippingAddress = address;
//         }
//       }
//       setState(() {
//         profileDetailModel = profile;
//         address = shippingAddress != null
//             ? shippingAddress!.addressLine1! +
//                 "," +
//                 shippingAddress!.addressLine2! +
//                 "," +
//                 shippingAddress!.city!.cityName! +
//                 "," +
//                 shippingAddress!.region!.regionName! +
//                 "," +
//                 shippingAddress!.province!.provinceName! +
//                 "," +
//                 shippingAddress!.country!.countryName!
//             : "Add your delivery address";
//       });
//       _getDeliveryCharges();
//     }
//   }

//   Future<void> setDetails() async {
//     showLoadingDialog(context);
//     productImages = [];
//     inquiryList = [];
//     reviewList = [];
//     deliveryInfoList = [];
//     quantity = 1;
//     productOverview = null;
//     simpleProduct = null;
//     couponSelectedIndex = -1;
//     price = 0;
//     specialPrice = 0;
//     coupon = null;

//     // final Completer<WebViewController> _controller =
//     // Completer<WebViewController>();
//     rateOne = 0;
//     rateTwo = 0;
//     rateThree = 0;
//     rateFour = 0;
//     rateFive = 0;

//     reviewModel = null;

//     selectedAttributes = HashMap();

//     _scrollController.animateTo(0,
//         duration: const Duration(milliseconds: 1000), curve: Curves.ease);
//     coupon = widget.coupon;
//     loggedUser = await getLoggedUser();
//     ProductOverview? productOverviewRes =
//         await getProductOverview(context, productId);
//     if (productOverviewRes == null) {
//       hideDialog(context);
//       showToastMessage('Failed to get product details!');
//       return;
//     }

//     int index = -1;
//     if (productOverviewRes.availableCoupons != null &&
//         productOverviewRes.availableCoupons!.isNotEmpty) {
//       availableCoupons = productOverviewRes.availableCoupons!;
//       if (coupon != null) {
//         for (var availableCoupon in productOverviewRes.availableCoupons!) {
//           if (availableCoupon.sId! == coupon!.sId) {
//             availableCoupon.received = true;
//             index++;
//             break;
//           }
//           index++;
//         }
//         setState(() {
//           couponSelectedIndex = index;
//         });
//       }
//     }

//     if (productOverviewRes.availableAttribute!.isNotEmpty) {
//       Attribute availableAttribute = productOverviewRes.availableAttribute![0];
//       availableAttribute.attributeValues![0].isSelect = true;
//       selectedAttributes.putIfAbsent(availableAttribute.sId!,
//           () => availableAttribute.attributeValues![0].sId!);
//       _getSimpleProductByAttribute(productOverviewRes);
//     }
//     var list = await getProductInquiries(context, productId);
//     var reviewlist = await getProductAllReviews(context, productId);
//     var _reviewModel = await getProductReviews(context, productId);
//     if (_reviewModel != null && _reviewModel.eachRateCount != null) {
//       for (var rate in _reviewModel.eachRateCount!) {
//         switch (rate.iId) {
//           case 1:
//             rateOne = rate.totalRate!.toDouble();
//             break;
//           case 2:
//             rateTwo = rate.totalRate!.toDouble();
//             break;
//           case 3:
//             rateThree = rate.totalRate!.toDouble();
//             break;
//           case 4:
//             rateFour = rate.totalRate!.toDouble();
//             break;
//           case 5:
//             rateFive = rate.totalRate!.toDouble();
//             break;
//         }
//       }
//     }
//     _getProfileDetails();
//     setState(() {
//       productImages = simpleProduct!.images!;
//       productOverview = productOverviewRes;
//       inquiryList = list.length > 5 ? list.take(5).toList() : list;
//       reviewList =
//           reviewlist.length > 5 ? reviewlist.take(5).toList() : reviewlist;
//       reviewModel = _reviewModel;
//     });
//     if (loggedUser != null) {
//       _getDeliveryCharges();
//     }
//     hideDialog(context);
//   }

//   addToCart() async {
//     if (loggedUser == null) {
//       _login();
//       return;
//     }
//     if (productOverview == null) {
//       showToastMessage('Failed to proceed.Try again..');
//       return;
//     }
//     if (simpleProduct == null) {
//       showToastMessage('Failed to proceed.Try again..');
//       return;
//     }

//     if (simpleProduct!.attributes!.length > 1) {
//       openBottomSheet();
//     } else {
//       _saveCart();
//     }
//   }

//   _saveCart() async {
//     hideDialog(context);
//     try {
//       var body = jsonEncode(<String, dynamic>{
//         "selected_qty": quantity.toString(),
//         "selected": false,
//         "overview_response": productOverview,
//         "simple_product": simpleProduct,
//         "coupon": coupon
//       });
//       bool isSaved = await saveCart(context, body);
//       if (isSaved) {
//         showToastMessage('Item added to cart');
//         setState(() {
//           cartItemCount++;
//         });
//       } else {
//         showToastMessage('Failed to save cart!');
//       }
//     } catch (error) {
//       print(error);
//     }
//   }

//   void _setProductPrice() {
//     specialPrice = (productOverview == null
//         ? 0
//         : (productOverview!.primaryProduct!.specialPrice! > 0
//                 ? productOverview!.primaryProduct!.specialPrice!
//                 : productOverview!.primaryProduct!.price!)
//             .toDouble());

//     price = (productOverview == null
//         ? 0
//         : productOverview!.primaryProduct!.price!.toDouble());

//     if (coupon != null) {
//       double couponDiscount = 0;
//       if (coupon!.amountType! == 1) {
//         couponDiscount = (specialPrice * coupon!.amount!.toDouble()) / 100;
//       } else {
//         couponDiscount = coupon!.amount!.toDouble();
//       }
//       price = specialPrice;
//       specialPrice = specialPrice - couponDiscount;
//     }
//     setState(() {});
//   }

//   void _userOrRemoveCoupon(Coupon _coupon) {
//     if (coupon != null && coupon!.sId! != _coupon.sId) {
//       for (var model in availableCoupons) {
//         model.received = false;
//       }
//     }
//     if (_coupon.received!) {
//       coupon = null;
//       _coupon.received = false;
//     } else {
//       coupon = _coupon;
//       _coupon.received = true;
//     }
//     _setProductPrice();
//   }

//   _goToCart() {
//     if (loggedUser == null) {
//       _login();
//       return;
//     }
//     Navigator.pop(context, 'cart');
//   }

//   _share() async {
//     final RenderBox box = context.findRenderObject() as RenderBox;
//     http: //124.43.130.172:3091/product?pid=6111075359b8b7595c3b31eb
//     await Share.share(
//         productOverview!.product!.productName! +
//             '\n' +
//             Api.siteUrl +
//             'product?pid=' +
//             productOverview!.product!.sId!,
//         sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
//   }

//   Future<void> _productInquireyView() async {
//     bool? response = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => AskProductQuestion(
//           productId: productOverview!.product!.sId!,
//         ),
//       ),
//     );
//     if (response != null && response) {
//       var productInquiries = await getProductInquiries(context, productId);
//       setState(() {
//         inquiryList = productInquiries.length > 5
//             ? productInquiries.take(5).toList()
//             : productInquiries;
//       });
//     }
//   }

//   void _ratingReviewDetails() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ProductRatingScreen(
//           productId: productOverview!.product!.sId!,
//           reviewCountModel: reviewModel!,
//         ),
//       ),
//     );
//   }
// }
