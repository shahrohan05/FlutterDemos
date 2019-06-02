import 'choice.dart';
import 'story.dart';

List<Story> _stories = <Story>[
  Story(
      index: 0,
      story: "You are stuck in a post apacoliptic zombieland. "
          "There are three zombies on a road in front of you. What do you do?",
      choices: <Choice>[
        Choice(
          choice: "Run towards the other direction.",
          storyIndex: 1,
        ),
        Choice(
          choice: "Take a metal rod and run towards the zombies.",
          storyIndex: 2,
        )
      ]),
  Story(
      index: 1,
      story:
          "You are running as fast as you can to get away from the zombies behind you and you see a truck coming at you at high speed.",
      choices: <Choice>[
        Choice(
          choice: "Stay on road, wave your hands and request for help.",
          storyIndex: 3,
        ),
        Choice(
          choice: "Run towards your left and try to find a shelter.",
          storyIndex: 4,
        )
      ]),
  Story(
      index: 2,
      story:
          "You somehow manage to beat up the zombies and escape, but one of the zombies have bit you on the arm.",
      choices: <Choice>[
        Choice(
          choice: "Find a chainsaw and cut off the arm.",
          storyIndex: 5,
        ),
        Choice(
          choice: "Find a shelter.",
          storyIndex: 6,
        )
      ]),
  Story(
      index: 3,
      story:
          "Truck stops and there are people on board. You get on the truck only to find out "
          "one of the survivors is badly wounded and has been bit by zombies.",
      choices: <Choice>[
        Choice(
          choice: "You urge everyone to throw him out of the truck.",
          storyIndex: 7,
        ),
        Choice(
          choice: "Say nothing and sit in the corner.",
          storyIndex: 8,
        )
      ]),
  Story(
      index: 4,
      story:
          "You run for a while and see a gas station ahead of you, you are hungry and tired, the station looks deserted and epmty.",
      choices: <Choice>[
        Choice(
          choice: "Go inside the gas station.",
          storyIndex: 9,
        ),
        Choice(
          choice: "Keep walking towards open areas.",
          storyIndex: 10,
        )
      ]),
  Story(
      index: 5,
      story:
          "Your wound after cutting off the arm is not covered properly and you are in a lot of pain. "
          "You see a hospital ahead of you as you walk for a while. It looks like there is no one inside, "
          "but you may find medical supplies to properly cover your wound and some painkillers.",
      choices: <Choice>[
        Choice(
          choice: "Go inside the hospital.",
          storyIndex: 11,
        ),
        Choice(
          choice: "Keep walking towards open grounds.",
          storyIndex: 10,
        )
      ]),
  Story(
      index: 6,
      story: "You keep walking and see an old house at a distant place. "
          "As you approach near you hear sounds that makes it clear that there are more zombies inside the house, "
          "but you are very tired and the infection of the bite in your arm is spreading and you are loosing your mind.",
      choices: <Choice>[
        Choice(
          choice: "Go inside the house.",
          storyIndex: 12,
        ),
        Choice(
          choice: "Find a gun to end your life.",
          storyIndex: -1,
          outcome:
              "You found a gun and shot yourself in the head. But as you shot yourself, you woke up and realised it was all a dream. "
              "Phew! You are well and good, but you wish you had some more time in the dream.",
        )
      ]),
  Story(
      index: 7,
      story:
          "When you ask evryone to throw him out, you find out that person is their leader and now everyone aboard is engry and upset with you.",
      choices: <Choice>[
        Choice(
          choice:
              "Talk to the leader and ask him to make the right choice for everyone.",
          storyIndex: 13,
        ),
        Choice(
          choice: "Apoligize for what you said and sit silently in the corner.",
          storyIndex: 8,
        )
      ]),
  Story(
      index: 8,
      story:
          "As the truck goes on for a few kilemeters, the wounded person starts to loose his mind and everyone is freaking out.",
      choices: <Choice>[
        Choice(
            choice: "Do nothing.",
            storyIndex: -1,
            outcome:
                "He starts biting and attacking everyone, all aborad ends up being affected and you are now a part of a zombie band, going on a truck. "
                "The driver smashes the truck on a wall and you wake up, only to find out it was all a dream. You think to yourself, hmmm! interesting dream."),
        Choice(
          choice: "You take charge and push him out of the truck.",
          storyIndex: 14,
        )
      ]),
  Story(
      index: 9,
      story:
          "As you go inside the station, you find some food and water. You are still very tired and could use a few hours of rest. "
          "But your instict tells you there is something wrong with the place.",
      choices: <Choice>[
        Choice(
            choice: "You decide to stay and rest for a couple of hours.",
            storyIndex: -1,
            outcome:
                "You are attacked by zombies while you are resting, but as they bite and scratch your body you wake up and find out it was all a dream. "
                "You laugh and think to yourself, what it would have been had you not stayed at the station. Interesting!"),
        Choice(
          choice:
              "You take as much food and supplies as you can carry and start walking again, to look for a safer place.",
          storyIndex: 15,
        )
      ]),
  Story(
      index: 10,
      story:
          "You have been walking all day but couldn't find a safe place to rest, you are extremely tired, hungry and thirsty, "
          "not able to walk anymore and it is about to be night.",
      choices: <Choice>[
        Choice(
            choice: "You decide to sit there and rest for a while.",
            storyIndex: -1,
            outcome:
                "You are attacked by zombies while you are resting, but as they bite and scratch your body you wake up and find out it was all a dream. "
                "You laugh and think to yourself, what it would have been had you gone inside that station."),
        Choice(
          choice:
              "You keep walking and push yourself to the limits in the hope to find some shelter.",
          storyIndex: 16,
        )
      ]),
  Story(
      index: 11,
      story:
          "You enter the hospital and hear some weird sounds, but you ignore them. You find medical supplies you were looking for, "
          "you cover your wound with proper dressing, but now you feel like you badly need some rest.",
      choices: <Choice>[
        Choice(
            choice: "You decide to stay and rest for a couple of hours.",
            storyIndex: -1,
            outcome:
                "You are attacked by zombies while you are resting, but as they bite and scratch your body you wake up and find out it was all a dream. "
                "You laugh and think to yourself, what it would have been had you not stayed at the hospital. Interesting!"),
        Choice(
          choice:
              "You take some painkillers, drink some water and start walking again, to look for a safer place.",
          storyIndex: 16,
        )
      ]),
  Story(
      index: 12,
      story:
          "As you enter the house, you realise it was a bad idea and there are zombies walking all around the house. "
          "Your would has already made your skin and your movement look like a zombie, but you still have some control over your mind. ",
      choices: <Choice>[
        Choice(
            choice:
                "You decide walk around the house pretending to be a zombie.",
            storyIndex: -1,
            outcome:
                "Your trick worked! Nobody attacked you, but after sometime the infection completely took over "
                "and just you as you feel like you are about to loose your mind completely, your dog licks your face and wakes you up. It was a dream, relax!"),
        Choice(
            choice: "Run out of the house.",
            storyIndex: -1,
            outcome:
                "The zombies spot you running out, runs after you, catches you and attack you. But as you feel the pain of their random bites on your body,"
                " you hear loud noise of your mom yelling at you, you wake up and realise it was all just a dream. Phew!")
      ]),
  Story(
      index: 13,
      story:
          "The leader asks you to lead his people towards safety and survival, jumps out of the truck moving at high speed and dies. "
          "Everyone now looks to you in the hopes that you would lead them.",
      choices: <Choice>[
        Choice(
            choice: "You agree to become their leader.",
            storyIndex: -1,
            outcome:
                "You lead the people, you look out for each other and somhow find a shelter for all the humans, "
                "protected from the horrors of the zombieland, your group is happy and you all are "
                "sitting in the porch of the shelter and suddenly you hear your phone ring, you wake up and realise it was all a dream. "),
        Choice(
            choice: "You deny thier appeal.",
            storyIndex: -1,
            outcome:
                "You leave the group and go ahead on your own. Some time later you are surrounded and attacked. As you are taking the beating"
                " you wake up and find out it was all a dream.")
      ]),
  Story(
      index: 14,
      story:
          "Everyone in on the truck are vey angry with you for throwing out their leader, some of them are asking you to leave them and get off the truck, "
          "some agree to what you did and argue with the others who dont.",
      choices: <Choice>[
        Choice(
            choice: "You leave the truck.",
            storyIndex: -1,
            outcome:
                "You leave the group and go ahead on your own. Some time later you are surrounded and attacked. As you are taking the beating"
                " you wake up and find out it was all a dream."),
        Choice(
            choice: "You try to make them understand you reason.",
            storyIndex: -1,
            outcome:
                "You lead the people, you look out for each other and somhow find a shelter for all the humans, "
                "protected from the horrors of the zombieland, your group is happy and you all are"
                "sitting in the porch of the shelter and suddenly you hear your phone ring, you wake up and realise it was all a dream. ")
      ]),
  Story(
      index: 15,
      story:
          "As you move forward, you survive on your own and become stronger and more equipped to fight off any horror of this world. "
          "On your path towards finding a safe shelter for humans you are met with 2 girls who are scared and stuck in an old house surrounded by "
          "zombies from all sides.",
      choices: <Choice>[
        Choice(
            choice: "You make a plan and try rescueing them.",
            storyIndex: -1,
            outcome:
                "You save the girls, you look out for each other and somhow find a shelter for all the humans, "
                "protected from the horrors of the zombieland, after a few months you end up marrying the older of the two girls. On one fine day you are "
                "sitting in the porch of the shelter and suddenly you hear your phone ring, you wake up and realise it was all a dream. "),
        Choice(
            choice: "You leave them to their fate.",
            storyIndex: -1,
            outcome:
                "You feel guilty for not saving the girls, You find the shelter you were looking for, but you are lonely and sad. A few moths goes by and "
                "on one fine day you are "
                "sitting in the porch of the shelter and suddenly you hear your phone ring, you wake up and realise it was all a dream.")
      ]),
  Story(
      index: 16,
      story:
          "Your wound from the zombie fight has spread the infection in almost your entire body, you cannot feel your legs or arms anymore and walking "
          "is almost out of your control, you have very little control left in your brain.",
      choices: <Choice>[
        Choice(
            choice: "You try to end your life.",
            storyIndex: -1,
            outcome:
                "You gather every last bit of strength you have left in your body and mind and try banging your head against a big rock, but as your "
                "head makes contact with the rock, you wake up and realise it was all a dream."),
        Choice(
            choice: "You let it go.",
            storyIndex: -1,
            outcome:
                "You let the infection take control of your mind, you feel like you are stuck in a cage of your own body, you feel what you are doing "
                "but you can't control your own body. After very long suffering of about a month you gradually and finally you die and your body keeps "
                "walking around dead.")
      ]),
];

int _currentStoryIndex = 0;

String _backgroundImage = 'images/background_zombie.jpg';

void makeAChoice(String userChoice) {
  Story currentStory = _stories[_currentStoryIndex];
  List<Choice> choices = currentStory.choices;
  choices.forEach((choice) {
    if (choice.choice == userChoice) {
      if (choice.storyIndex != -1) {
        _currentStoryIndex = choice.storyIndex;
      }
    }
  });
}

bool lastChoice(String userChoice) {
  bool lastChoice = false;
  Story currentStory = _stories[_currentStoryIndex];
  List<Choice> choices = currentStory.choices;
  choices.forEach((choice) {
    if (choice.choice == userChoice) {
      if (choice.storyIndex == -1) {
        lastChoice = true;
      }
    }
  });
  return lastChoice;
}

String getOutcome(String userChoice) {
  String outcome = "";
  Story currentStory = _stories[_currentStoryIndex];
  List<Choice> choices = currentStory.choices;
  choices.forEach((choice) {
    if (choice.choice == userChoice) {
      outcome = choice.outcome;
    }
  });
  return outcome;
}

String get currentStory {
  return _stories[_currentStoryIndex].story;
}

List<String> get choices {
  Story currentStory = _stories[_currentStoryIndex];
  List<Choice> choices = currentStory.choices;
  List<String> choicesToReturn;
  choices.forEach((choice) => choicesToReturn.add(choice.choice));
  return choicesToReturn;
}

String get firstChoice {
  Story currentStory = _stories[_currentStoryIndex];
  Choice choice = currentStory.choices[0];
  return choice.choice;
}

String get secondChoice {
  Story currentStory = _stories[_currentStoryIndex];
  Choice choice = currentStory.choices[1];
  return choice.choice;
}

String get backgroundImage {
  return _backgroundImage;
}

void resetStoryDriver() => _currentStoryIndex = 0;
