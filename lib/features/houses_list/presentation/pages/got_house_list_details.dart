import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:got_app/features/houses_list/domain/entities/get_characters_image_entity.dart';
import 'package:got_app/features/houses_list/domain/entities/members_house_entity.dart';
import 'package:got_app/features/houses_list/presentation/widgets/got_app_bar.dart';
import 'package:got_app/features/houses_list/utils/helpers/got_house_list_details_helper.dart';

class HouseListDetails extends StatefulWidget with GOTHouseListDetailsHelper {
  final List<MembersHouseEntity> membersHouse;
  final List<GetCharactersImageEntity> imageCharacters;
  final String title;
  final Color? colorTitle;
  final String imageUrl;
  const HouseListDetails({
    required this.membersHouse,
    required this.imageCharacters,
    super.key,
    required this.title,
    required this.colorTitle,
    required this.imageUrl,
  });

  @override
  State<HouseListDetails> createState() => _HouseListDetailsState();
}

class _HouseListDetailsState extends State<HouseListDetails> {
  bool _showList = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() {
      _showList = true;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: _showList ? Colors.white : widget.colorTitle,
        appBar: _showList
            ? GOTAppBar(
                title: widget.title,
              )
            : null,
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: _showList
              ? Builder(builder: (context) {
                  if (widget.membersHouse.isEmpty) {
                    return const Center(
                      child: Text('No houses available'),
                    );
                  }
                  return Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        widget.title.replaceAll('of ', 'of\n'),
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Cinzel',
                          fontWeight: FontWeight.bold,
                          color: widget.colorTitle,
                        ),
                      ),
                      Flexible(
                        child: ListView.separated(
                          itemCount: widget.membersHouse.length,
                          itemBuilder: (_, int index) {
                            final member = widget.membersHouse[index];

                            return ListTile(
                              title: Text(widget.membersHouse[index].name),
                              subtitle: Text(widget.getMemberTitle(
                                  member.slug, widget.imageCharacters)),
                              leading: widget.getImageUrl(member.slug,
                                          widget.imageCharacters) !=
                                      ''
                                  ? CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          widget.getImageUrl(member.slug,
                                              widget.imageCharacters)),
                                    )
                                  : const Icon(Icons.person),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 8,
                              color: const Color.fromARGB(255, 236, 233, 233),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                })
              : _buildLoadingScreen(),
        ),
      );

  Widget _buildLoadingScreen() {
    return Center(
      child: SvgPicture.asset(
        height: MediaQuery.sizeOf(context).height / 3.5,
        'assets/images/${widget.imageUrl}',
      ),
    );
  }
}
