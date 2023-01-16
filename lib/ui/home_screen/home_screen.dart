import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

import '../../api/model/review_model.dart';
import '../../core/MyColor.dart';
import '../../util/loader.dart';
import '../explore_screen/explore_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../review_details/review_detail.dart';
import 'home_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc _bloc;
  bool _isSearching = false;
  final TextEditingController _searchQueryController = TextEditingController();
  String searchQuery = "Search query";
  final _scrollController = ScrollController();
  List<ReviewModel>? reviewList;

  @override
  void initState() {
    _bloc = HomeBloc(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => _bloc,
      // ignore: missing_return
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (BuildContext context, HomeState state) {
          // ignore: missing_return
        },
        // ignore: missing_return
        builder: (BuildContext context, HomeState state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: _appBar(),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: _main(context,state),
            ),
          );
        },
      ),
    );
  }

  Widget _main(BuildContext context, HomeState state) {
    if (state is LoadingState) {
      return Center(child: Loader.circular());
    } else if (state is LoadedState) {
      reviewList = state.reviews;
      return Snap(
        controller: _scrollController.appBar,
        child: Container(
          child: ListView(
            shrinkWrap: true,
            controller: _scrollController,
            children: [
              InkWell(
                onTap: () {
                  // _navigateToAScreen(RestaurantScreen());
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 16, top: 10, bottom: 10, right: 16),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.asset(
                            'assets/imgs/james.jpg',
                            width: 50.0,
                            height: 50,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Write a review.",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                child: ListView.builder(
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemCount: reviewList?.length,
                  // ignore: missing_return
                  itemBuilder: (BuildContext listContext, int index) {
                    return listItem(listContext, index, context);
                    // return listItem(listContext, index, context);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    } /*else if (state is ErrorEvent) {
    }*/ /*else if (state is UnAuthorizeState) {
    }*/ else {
      return Container();
    }
  }

  Widget listItem(BuildContext listContext, int index, BuildContext context) {
    String? des = reviewList![index]?.description.toString();
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReviewDetailScreen(reviewList![index]),
            ));
      },
      // onTap: _navigateToReviewDetailScreen(reviewList[index],context),
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      _navigateToAScreen(const ProfileScreen());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.asset(
                          'assets/imgs/james.jpg',
                          width: 50.0,
                          height: 50,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Wrap(
                      children: [
                        InkWell(
                          onTap: () {
                            _navigateToAScreen(ProfileScreen());
                          },
                          child: Text("${reviewList![index].userModel?.name}",
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: CustomColors.fontDark)),
                        ),
                        const Text(" is reviewing ",
                            style: TextStyle(
                                fontSize: 18, color: CustomColors.fontLight)),
                        items(index),
                        const Text(" at ",
                            style: TextStyle(
                                fontSize: 18, color: CustomColors.fontDark)),
                        Text(
                            "${reviewList![index].reviewedRestaurantModel?.restaurantModel?.name}",
                            style: const TextStyle(
                                fontSize: 18, color: CustomColors.fontDark)),
                        Wrap(
                          children: [
                            const Text(" 4.5",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: CustomColors.fontDark)),
                            Container(
                              margin: const EdgeInsets.only(top: 3),
                              height: 10,
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow[700],
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        (_isOfferAvailable(index))
                            ? Container(
                            height: 20,
                            width: 110,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  end: Alignment(0.0, -1),
                                  begin: Alignment(0.0, 0.6),
                                  colors: <Color>[
                                    Color(0xffFFAE7F),
                                    Color(0xffFF97A1),
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(50))),
                            child: const Text(
                              "Recommended",
                              style: TextStyle(color: Colors.white),
                            ))
                            : Container(),
                        (_isRecommended(index))
                            ? Container(
                            height: 20,
                            width: 60,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Color(0xff6C63FF),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(50))),
                            child: const Text(
                              "Offer",
                              style: TextStyle(color: Colors.white),
                            ))
                            : Container()
                      ],
                    ),
                  ),
                  const SizedBox(
                    child: Icon(
                      Icons.more_vert,
                      color: CustomColors.iconColorOnWhite,
                    ),
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  "${reviewList![index].title}",
                  style: const TextStyle(color: CustomColors.fontDark, fontSize: 15),
                  textAlign: TextAlign.left,
                )),
            Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: (des.length > desLength)
                              ? des.substring(0, desLength)
                              : des,
                          style: const TextStyle(
                              color: CustomColors.fontDark, fontSize: 15)),
                      TextSpan(
                        // recognizer: TapGestureRecognizer()
                        //   ..onTap = () {
                        //     _navigateToReviewDetailScreen();
                        //     print("on resend click");
                        //   },
                        text: (des.length > desLength) ? "...show more" : "",
                        style: const TextStyle(
                            color: CustomColors.fontDark, fontSize: 15),
                      ),
                    ],
                  ),
                )),
            Container(
              margin: const EdgeInsets.only(top: 8),
              height: 250,
              width: size.width,
              child: _imagePager(),
            ),
            // Container(width: size.width,height: 1,color: Colors.black12,),
            Container(
                margin: const EdgeInsets.only(left: 10),
                child: _reactionWidget(index)),
          ],
        ),
      ),
    );
  }

  Widget items(int index) {
    List<ReviewedFoodList>? foodItemList = reviewList![index]?.reviewedFoodList;
    return Wrap(
      children: [
        for (var item in foodItemList!)
          Wrap(
            children: [
              Text("${item.foodItemModel?.name} ",
                  style: const TextStyle(fontSize: 18, color: CustomColors.fontDark)),
              Wrap(
                children: [
                  Text("${item.rating}",
                      style: const TextStyle(
                          fontSize: 18, color: CustomColors.fontDark)),
                  Container(
                    margin: const EdgeInsets.only(top: 3),
                    height: 10,
                    child: Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                      size: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
      ],
    );
  }

  bool _isOfferAvailable(int index) {
    bool isOfferAvailable = false;
    for (var item in reviewList[index]?.reviewedFoodList) {
      if (item.isOffer == 1) {
        isOfferAvailable = true;
        break;
      }
    }
    return isOfferAvailable;
  }

  bool _isRecommended(int index) {
    bool isRecommended = false;
    for (var item in reviewList![index]?.reviewedFoodList) {
      if (item.isRecommended == 1) {
        isRecommended = true;
        break;
      }
    }
    return isRecommended;
  }

  _navigateToAScreen(Widget screenName) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screenName,
        ));
  }

  ScrollAppBar _appBar() {
    return ScrollAppBar(
      brightness: Brightness.light,
      elevation: 2,
      backgroundColor: Colors.white,
      leading: _isSearching
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                // if (_searchQueryController == null ||
                //     _searchQueryController.text.isEmpty) {
                //   Navigator.pop(context);
                //   return;
                // }
                Navigator.pop(context);
                _clearSearchQuery();
              },
            )
          : Container(
              margin: const EdgeInsets.only(left: 10),
              alignment: Alignment.center,
              width: 40,
              height: 40,
              child: InkWell(
                onTap: () {
                  _navigateToProfileScreen();
                },
                child: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColors.iconBgColor,
              ),
            ),
      title: _isSearching
          ? _buildSearchField()
          : Row(
              children: const [
                Spacer(),
                Text(
                  "Home",
                  style: TextStyle(color: Colors.black),
                ),
                Spacer()
              ],
            ),
      actions: _buildActions(),
      controller: _scrollController,
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      InkWell(
        onTap: () {
          _startSearch();
          // showSearch(context: context, delegate: DataSearch(listWords));
        },
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          width: 40,
          height: 40,
          child: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: CustomColors.iconBgColor,
          ),
        ),
      ),
      InkWell(
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          width: 40,
          height: 40,
          child: InkWell(
            onTap: _navigateToFilterScreen,
            child: const Icon(
              Icons.filter_list,
              color: Colors.black,
            ),
          ),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: CustomColors.iconBgColor,
          ),
        ),
      ),
    ];
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  _navigateToFilterScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ExploreFragment(),
        ));
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: "Search Data...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.black87),
      ),
      style: const TextStyle(color: Colors.black87, fontSize: 16.0),
      onChanged: (query) => updateSearchQuery(query),
    );
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
  }

  _navigateToProfileScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ExploreFragment(),
        ));
  }
}
