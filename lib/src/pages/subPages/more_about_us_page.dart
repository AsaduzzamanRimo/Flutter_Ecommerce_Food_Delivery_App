part of pages;

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: mainColor,
        leading: GestureDetector(
          onTap: () {
            /* Write listener code here */
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const MainPage()),
                (Route<dynamic> route) => false);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: primaryFontColor, // add custom icons also
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "About Us",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.shoppingCart)),
          )
        ],
      ),
      body: ListView(
        children: [
          // ignore: prefer_const_constructors
          SizedBox(
            height: 30,
          ),
          _notificationsListView(),
        ],
      ),
    );
  }

  Widget _notificationsListView() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(
          width: kHorizontalPadding / 2,
        );
      },
      //padding: EdgeInsets.symmetric(horizontal: kScaffoldPadding),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: NotificationsList.list.length - 4,
      itemBuilder: (context, index) {
        NotificationsList data = NotificationsList.list[index];
        return Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                // print("OK>>>>>>>>>>>>>>>>>>>>");
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: index % 2 == 0 ? Colors.white : Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Icon(
                          FontAwesomeIcons.solidDotCircle,
                          size: 10,
                          color: mainColor,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.notice!.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    color: secondaryFontColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
