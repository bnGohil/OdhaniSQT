//
// import '../../base.dart';
// import 'loading_view.dart';
// import 'package:flutter/material.dart';
//
//
// class WebViewScreen extends StatefulWidget {
//   String? url;
//   String? title;
//   String? htmlContent;
//
//
//   WebViewScreen({Key? key,this.htmlContent,this.title,this.url}) : super(key: key);
//
//   @override
//   _WebViewScreenState createState() {
//     return _WebViewScreenState();
//   }
// }
//
// class _WebViewScreenState extends State<WebViewScreen> with WidgetsBindingObserver {
//
//   WebViewController? _webViewController;
//   bool isLoading = false;
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       _webViewController = await createWebViewController();
//     });
//
//   }
//
//
//   Future<WebViewController> createWebViewController() async {
//     PlatformWebViewControllerCreationParams params =
//     const PlatformWebViewControllerCreationParams();
//
//     // if (WebViewPlatform.instance is WebKitWebViewPlatform) {
//     //   params = WebKitWebViewControllerCreationParams
//     //       .fromPlatformWebViewControllerCreationParams(
//     //     params,
//     //   );
//     // } else if (WebViewPlatform.instance is AndroidWebViewPlatform) {
//     //   params = AndroidWebViewControllerCreationParams
//     //       .fromPlatformWebViewControllerCreationParams(
//     //     params,
//     //   );
//     // }
//
//     final webViewController = WebViewController.fromPlatformCreationParams(params);
//
//     await webViewController.enableZoom(false);
//
//     await webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
//
//     await webViewController.setNavigationDelegate(NavigationDelegate(
//       onPageStarted: (url) {
//         setState(() {
//           isLoading = true;
//         });
//       },
//       onPageFinished: (url) {
//         setState(() {
//           isLoading = false;
//         });
//       },
//       onWebResourceError: (error) {
//         Toaster.showMessage(context, msg: error.description);
//         setState(() {
//           isLoading = false;
//         });
//       },
//     ));
//
//     await webViewController.setBackgroundColor(kWhiteColor);
//
//     if(widget.htmlContent == null){
//       await webViewController.loadRequest(Uri.parse("${widget.url}"));
//     }else{
//       await webViewController.loadHtmlString(widget.htmlContent ?? "");
//     }
//
//
//
//     return webViewController;
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Scaffold(
//           appBar: AppBar(
//             title:  Text("${widget.title}"),
//             centerTitle: true,
//           ),
//           backgroundColor: kWhiteColor,
//           body: Column(
//             children: [
//               if(_webViewController != null)
//                 Expanded(
//                   child: WebViewWidget(
//                     controller: _webViewController!,
//                   ),
//                 ),
//             ],
//           ),
//         ),
//
//         if(isLoading)
//           const LoadingView()
//       ],
//     );
//   }
// }