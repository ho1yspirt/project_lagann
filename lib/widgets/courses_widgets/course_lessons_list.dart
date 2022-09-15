import 'package:flutter/material.dart';
import 'package:project_lagann/models/video.dart';

import '../../generated/l10n.dart';
import '../../models/user.dart';
import '../../utils/constants.dart';
import 'course_lesson_card.dart';

class CourseLessonsList extends StatelessWidget {
  final bool isPurchased;
  CourseLessonsList({
    Key? key,
    required this.isPurchased,
  }) : super(key: key);

  static const UserModel _testUser = UserModel(
    id: 1,
    username: "UX/UI:Structure",
    profileImageUrl:
        "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80",
    subscribers: "2000",
  );

  final video = VideoModel(
    id: 'x606y4QWrxo',
    author: _testUser,
    title: 'Flutter Clubhouse Clone UI Tutorial | Apps From Scratch',
    thumbnailUrl: 'https://i.ytimg.com/vi/x606y4QWrxo/0.jpg',
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    duration: '8:20',
    timestamp: DateTime(2021, 3, 20),
    viewCount: '10K',
    likes: '958',
    dislikes: '4',
    commentsCount: "250",
    description:
        """It''s time to go a-viking! Original song inspired by Assassin's Creed Valhalla, Vikings and Eivor. 
Subscribe! http://www.youtube.com/subscription_c...
* DOWNLOAD LINKS BELOW *

SUPPORT ME ON PATREON: https://www.patreon.com/miracleofsound

Mixed & edited by Frank De Jong & Martijn de Groot at Hal 5 www.hal5studio.com

DOWNLOAD/STREAM: 
Spotify: https://open.spotify.com/user/ph9sn9c...
Bandcamp: http://miracleofsound.bandcamp.com
Itunes: https://itunes.apple.com/ie/artist/mi...

MERCH:
http://bit.ly/MOSMerch

Miracle Of Sound social media links: 
Twitter: https://twitter.com/miracleofsound
TikTok: https://www.tiktok.com/@miracleofsound
Instagram: https://www.instagram.com/miracleofso...
Facebook: https://www.facebook.com/MiracleOfSound/
Reddit: https://www.reddit.com/r/Miracleofsound/
VK: https://vk.com/miracleofsound

#Vikings #Valheim #AssassinsCreedValhalla

LYRICS: 

Valhalla Calling              Gavin Dunne 2020

Ships on vigor of the waves are skimming
Barren summits to the verdant plains
Each horizon is a new beginning
Rise and reign

Far from the fjords and the ice cold currents
Ravens soar over new frontiers
Songs and sagas of a fate determined
Shields and spears

Vows of favour or the thrill of plunder
Pull together for the clan and kin
Clank of hammers and the crash of thunder
Pound within

Oh-ho-oh
The echoes of eternity
Oh-ho-oh
Valhalla calling me
Oh-ho-oh
To pluck the strings of destiny
Oh-ho-oh
Valhalla calling me
Valhalla calling me

Sails a' swaying on the crimson rivers
Blood and glory in the fighting fields
Shields a' shatter into splintered timbers
Iron and steel

Fires are rising and the bells are ringing
Glory take us into Odin's halls
Golden glimmer and the sound of singing
Asgard's call

Oh-ho-oh
The echoes of eternity
Oh-ho-oh
Valhalla calling me""",
  );

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, int index) {
          return CourseLessonCard(
            isPurchased: isPurchased,
            lessonIndex: index + 1,
            videoModel: video,
          );
        },
        childCount: 32,
      ),
    );
  }
}
