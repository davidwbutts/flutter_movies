
import 'package:flutter/material.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: const Text('Movies'),
                  centerTitle: true,
                  pinned: true,
                  floating: true,
                  snap: true,
                  forceElevated: innerBoxIsScrolled,
                  bottom: const TabBar(
                    tabs: <Tab>[
                      Tab(text: 'Recent'),
                      Tab(text: 'Popular'),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: const TabBarView(
            children:  <Widget>[
              TheatreTab(),
              PopularTab(),
            ],
            physics: PageScrollPhysics(parent: BouncingScrollPhysics()),
          ),
        ),
      ),
    );
  }
}


class TheatreTab extends StatelessWidget {
  const TheatreTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: CustomScrollView(
          key: const PageStorageKey<String>('theatre_tab'),
          slivers: <Widget>[
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 4.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  _builtItem,
                  childCount: 30,
                ),
              ),
            ),
          ],
        )
    );
  }

  Widget? _builtItem(BuildContext context, int index) {
    const Placeholder();
  }
}


class PopularTab extends StatelessWidget {
  const PopularTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: CustomScrollView(
          key: const PageStorageKey<String>('popular_tab'),
          slivers: <Widget>[
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 4.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  _builtItem,
                  childCount: 30,
                ),
              ),
            ),
          ],
        )
    );
  }

  Widget? _builtItem(BuildContext context, int index) {
    const SizedBox(width: 100, height: 200, child: Placeholder());
  }
}

// _tabs.map((String name) {
//               return SafeArea(
//                 top: false,
//                 bottom: false,
//                 child: Builder(
//                   // This Builder is needed to provide a BuildContext that is
//                   // "inside" the NestedScrollView, so that
//                   // sliverOverlapAbsorberHandleFor() can find the
//                   // NestedScrollView.
//                   builder: (BuildContext context) {
//                     return CustomScrollView(
//                       // The "controller" and "primary" members should be left
//                       // unset, so that the NestedScrollView can control this
//                       // inner scroll view.
//                       // If the "controller" property is set, then this scroll
//                       // view will not be associated with the NestedScrollView.
//                       // The PageStorageKey should be unique to this ScrollView;
//                       // it allows the list to remember its scroll position when
//                       // the tab view is not on the screen.
//                       key: PageStorageKey<String>(name),
//                       slivers: <Widget>[
//                         SliverOverlapInjector(
//                           // This is the flip side of the SliverOverlapAbsorber
//                           // above.
//                           handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//                         ),
//                         SliverPadding(
//                           padding: const EdgeInsets.all(8.0),
//                           // In this example, the inner scroll view has
//                           // fixed-height list items, hence the use of
//                           // SliverFixedExtentList. However, one could use any
//                           // sliver widget here, e.g. SliverList or SliverGrid.
//                           sliver: SliverFixedExtentList(
//                             // The items in this example are fixed to 48 pixels
//                             // high. This matches the Material Design spec for
//                             // ListTile widgets.
//                             itemExtent: 48.0,
//                             delegate: SliverChildBuilderDelegate(
//                                   (BuildContext context, int index) {
//                                 // This builder is called for each child.
//                                 // In this example, we just number each list item.
//                                 return ListTile(
//                                   title: Text('Item $index'),
//                                 );
//                               },
//                               // The childCount of the SliverChildBuilderDelegate
//                               // specifies how many children this inner list
//                               // has. In this example, each tab has a list of
//                               // exactly 30 items, but this is arbitrary.
//                               childCount: 30,
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               );
//             }).toList()