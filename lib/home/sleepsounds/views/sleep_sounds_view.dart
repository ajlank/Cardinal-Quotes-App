import 'package:cardinal_quotes_app/utils/appRoutes/constants/constant.dart';
import 'package:cardinal_quotes_app/utils/data/data_sleep_sounds.dart';
import 'package:flutter/material.dart';

class SleepSoundsView extends StatelessWidget {
  const SleepSoundsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 25, 14),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset('assets/sleep_sounds/right_arrow.png')),
                SizedBox(
                  width: 7,
                ),
                Text('Sleep Sounds',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),)
              ],),
              SizedBox(
                height: 13,
              ),
              Expanded(
                child: ListView.builder(itemCount: sleepSounds.length,
                itemBuilder: (context, i) {
                  var item=sleepSounds[i];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(soundDetailsRoute);
                    },
                    child: SizedBox(
                      height: 340,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(12),
                            child: Image.asset(item.image),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.5,vertical: 12),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(item.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),)
                                      ],
                                    ),
                                   
                                  ],
                                ),
                               SizedBox(
                                height: 4,
                               ),
                                 Row(
                                  children: List.generate(item.tags.length, (i){
                                    var tag=item.tags[i];
                                    return Padding(
                                       padding: const EdgeInsets.only(right: 10),
                                       child: Text(tag,style: TextStyle(color: Colors.white),),
                                     );
                                  })
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('assets/sleep_sounds/eye.png'),
                                              SizedBox(
                                                width: 3,
                                              ),
                                            Text('577777k',style: TextStyle(color: Colors.white),),
                                              
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    
                                     Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('assets/sleep_sounds/share.png'),
                                               SizedBox(
                                                width: 3,
                                              ),
                                            Text('Share',style: TextStyle(color: Colors.white),),
                                              
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                     Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('assets/sleep_sounds/download.png'),
                                                 SizedBox(
                                                width: 3,
                                              ),
                                            Text('Download',style: TextStyle(color: Colors.white),),
                                              
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                      Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('assets/sleep_sounds/save.png'),
                                                 SizedBox(
                                                width: 3,
                                              ),
                                            Text('Save',style: TextStyle(color: Colors.white),),
                                              
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                    
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ),
                  );
                },
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}