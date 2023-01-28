import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Navigation());
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;

  @override
  List<feed> feeds = [];

  Widget buildBottomSheet(BuildContext context) {
    String newPost = '';
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Post',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newPost = newText;
              },
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  feeds.add(feed(content: newPost));
                });
                Navigator.pop(context);
              },
              child: Text(
                'Post',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.feed),
            label: 'Feed',
          ),
          NavigationDestination(
            icon: Icon(Icons.post_add),
            label: 'Post',
          ),
          NavigationDestination(
            //selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.portrait),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        Scaffold(
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Image.network(
                    'https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&w=800'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Image.network(
                    'https://images.unsplash.com/photo-1627639679638-8485316a4b21?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y3V0ZSUyMGtpZHxlbnwwfHwwfHw%3D&w=1000&q=80'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Image.network(
                    'https://images.pexels.com/photos/1391498/pexels-photo-1391498.jpeg?auto=compress&cs=tinysrgb&w=800'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Image.network(
                    'https://images.pexels.com/photos/1382731/pexels-photo-1382731.jpeg?auto=compress&cs=tinysrgb&w=800'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Image.network(
                    'https://images.pexels.com/photos/1468379/pexels-photo-1468379.jpeg?auto=compress&cs=tinysrgb&w=800'),
              ),
            ],
          ),
        ),
        Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(Icons.post_add),
            onPressed: () {
              showModalBottomSheet(context: context, builder: buildBottomSheet);
            },
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 60, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.post_add,
                        size: 30,
                        color: Colors.lightBlueAccent,
                      ),
                      backgroundColor: Colors.white,
                      radius: 30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Posts',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${feeds.length} Posts so far',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: PostList(feeds),
                ),
              ),
            ],
          ),
        ),
        Scaffold(
          body: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Image(
                    height: MediaQuery.of(context).size.height / 3,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://www.tclf.org/sites/default/files/thumbnails/image/CA_Berkeley_UniversityOfCaliforniaAtBerkeley_byCharlieNguyen-Flickr_2008_001_Sig.jpg'),
                  ),
                  Positioned(
                    bottom: -60.0,
                    child: profilePic(),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              ListTile(
                title: Center(
                  child: Text('Ashley Esper'),
                ),
                subtitle: Center(
                  child: Text('28 years old Traveler'),
                ),
              ),
              ListTile(
                title: Text('About'),
                subtitle: Text(
                    'I am excited to meet new people and traver all over the world. If you are interested in travelling with me, lets connect'),
              ),
            ],
          ),
        ),
      ][currentPageIndex],
    );
  }
}

Widget profilePic() => CircleAvatar(
      radius: 80,
      backgroundImage: NetworkImage(
          'https://images.unsplash.com/photo-1589696485114-9e2f81d83484?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YmxvbmRlJTIwZ2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
    );

class PostList extends StatefulWidget {
  // const PostList({super.key});
  final List<feed> feeds;

  PostList(this.feeds);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return Post(post_content: widget.feeds[index].content);
        },
        itemCount: widget.feeds.length);
  }
}

class Post extends StatelessWidget {
  final String post_content;

  Post({this.post_content = ''});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post_content),
    );
  }
}

class feed {
  final String content;
  feed({this.content = ''});
}
