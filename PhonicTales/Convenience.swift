//
//  Convenience.swift
//  PhonicTales
//
//  Created by Caroline Davis on 28/11/2016.
//  Copyright © 2016 Caroline Davis. All rights reserved.
//

import UIKit
import AVFoundation

class Convenience: UIViewController, AVSpeechSynthesizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var usersAnswers:[String] = []
    var text: String = ""
    var selectedStory = ""
    
    
    // play func for sounds
    func play(synthesizer: AVSpeechSynthesizer, button: UIButton) {
        if !synthesizer.isSpeaking {
            let utterance = AVSpeechUtterance(string: self.text)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
            utterance.rate = 0.4
            let image = UIImage(named: "Pause") as UIImage!
            button.setImage(image, for: .normal)
            synthesizer.speak(utterance)
        } else if synthesizer.isSpeaking && synthesizer.isPaused {
            let image = UIImage(named: "Pause") as UIImage!
            button.setImage(image, for: .normal)
            synthesizer.continueSpeaking()
        } else if synthesizer.isSpeaking {
            let image = UIImage(named: "Play") as UIImage!
            button.setImage(image, for: .normal)
            synthesizer.pauseSpeaking(at: AVSpeechBoundary.word)
        }
        
    }
    
    // stop func for sounds
    func stop(synthesizer: AVSpeechSynthesizer, button: UIButton) {
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
        let image = UIImage(named: "Play") as UIImage!
        button.setImage(image, for: .normal)
    }
    
    // alert message pop ups
    func alertMessage(errorMessage: String, sender: AnyObject) {
        let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("OK")
            return
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        sender.present(alertController, animated: true, completion: nil)
    }
    
    
    // shared instance singleton
    class func sharedInstance() -> Convenience {
        struct Singleton {
            static var sharedInstance = Convenience()
        }
        return Singleton.sharedInstance
    }
    
    
    //story template text and questions
    var storyTemplates = [
        "Animal": [
            "text": "Yesterday I left my house and went for a walk with my pet <0>, named <1>, to buy some delicious <2>.  It was a <3> day so I decided to put on my best <4>. Little <1> and I <5> all the way to the store and saw a <6> along the way.  ,<1> chased the <6> into the store and the <6> broke a <7>. The <6> looked angry and ran away. I apologised to the shopkeeper about the <7> and he told me it was okay because he had won <8> dollars that day and could pay for the repairs. I asked the shopkeeper for some <2> and headed off to the park with <1>. As I began to eat my <2> I saw the <6> sitting amongst the grass. I asked him to come over to share the <2>. He <9> over and declined the <2> and said 'What am I, a <0> ?,'. The <6> was never seen again.",
            "questions": [
                "What is your favourite animal?",
                "Type in a name?",
                "What is your favourite food?",
                "Name an adjective",
                "Name an item of clothing",
                "Type in an action verb",
                "Type in another animal",
                "Name an object",
                "Type in a number",
                "Name another action verb"]
        ],
        "Ship": [
            "text": "It was the year  <0> and Mr <1> was setting out on his first voyage across the ocean. He was getting ready for his journey alongside his friend <2> who needed to get to <3> for a wedding. The wedding was costume themed, so Mr <1> was dressing up as a <4> and <2> as a <5>. The two had never been to <3> before, but were keen to set sail. The ship was called the <6> of the sea and was bright <7>.  As the ship began to leave the shore, a <8>  <9> jumped out of the water and began thrashing about in the sea. The <9> was wreaking havoc as the ships crew tried to steer the ship away from the gigantic waves. However, the <9> was too strong and the ship ended up getting pushed back to the dock. Disappointed, Mr <1> and <2> stepped off the ship and back onto land, A lady called out to them with a telegram. It said 'Do not come to <3>, the wedding has been cancelled. The groom went fishing and was eaten by a giant <9>'. Mr <1> and <2> couldn’t believe it, went back to shore and ate <9> for dinner.",
            "questions": [
                "Type in a year",
                "Type in a last name",
                "Type in first name",
                "Name a country",
                "Type in an animal",
                "Name an occupation",
                "What’s your favourite food?",
                "Name your favourite colour?",
                "Type in an adjective",
                "Name a sea creature"]
        ],
        "Love": [
            "text": "<0> was tired of being single and decided to try her hand at the new dating show, love by <1>. The auditions were being held in the town of <2> and <0> had a feeling that this time she would find love. She decided to wear a <3> <4> and left to go to the audition. At the audition she saw a FUNNY man with a <5> on his shoulder. She thought I wonder if he knows that <5> is on his shoulder.  It was then time for the audition and she was met with <6> people and a <7>. The <7> was the first to ask a question. It said 'Why am I talking to you? Are you okay?’. <0> couldn’t believe her eyes, was she dreaming? She said, ‘I am <8>, I just want to find love'. The other people laughed and said, ‘I think you’re in the wrong studio, these are auditions for the new show ‘Are you losing your mind or are you just kind?.’ <0> stood there <9> and ran outside. She saw the man with the <5> on his shoulder smiled and said ‘You’re so gonna get this job’.",
            "questions": [
                "Type in a female name",
                "Type in a verb",
                "Name a town",
                "Type in a colour",
                "Name an item of clothing",
                "Type in an animal",
                "Type in a number",
                "Name an object",
                "Name an emotion",
                "Type an action verb"]
        ],
        "Food": [
            "text": "It was nearly <0>s birthday and he decided to have a party at the new themed restaurant, <1> for tea. Little <0> was turning <2> so this was a big deal for everyone in <0>S family. His sister <3> was <4> and had never eaten <1> before so she was really <5> about the party. It was the day of the party and all <0>s <6> friends arrived. They were wearing <7> party hats and were throwing streamers,. <0> was so excited he screamed 'its my birthday and I'm eating <1> for <8>'! The waiters brought out <0>S <1> and he sat there and stared at it,. <3> said what are you looking at?, and <0> replied ‘I cant eat this!, I can see its <9> eyes, looking at me.' <3> was confused. There were no eyes on the <1>,. <3> ate the <1> and said, ‘No need to worry now, Its in my belly’,. <0> looked at <3> and screamed. She had become the <1>.",
            "questions": [
                "Type in a male name",
                "Name a type of food",
                "Type in a number",
                "Type in a female name",
                "Name another number",
                "Type an emotion",
                "Name a sport",
                "Name a colour",
                "Type in a meal time",
                "Small, Medium or Large?"]
        ],
        "Ghost": [
            "text": "It was half past <0> when <1> heard a weird noise coming from the attic. The house was always full of <2> noises, but this one seemed distinctively odd,. Bubble bubble bubble, went the noise. <1> lay in bed wondering if it was a <3> or maybe even a ghost? <1> went to investigate, put on her brand new <4> slippers and creeped upstairs. Bubble bubble bubble, went the sound. a GHOST like air swept the staircase and <1> began to feel rather <5>. She peeped through the door and saw something move. She nervously crept inside and saw a <6> pot bubbling away. <1> heard a whisper, she screamed 'ahhhhh a ghost is in my house'. She ran downstairs as <7> as she could and heard a <8> chuckle behind her. She heard a familiar voice say 'Are you sure you don’t want some stew, <1>'. It was <1>S grandmother <9>, she forgot she had moved in the day before. 'Oh sure gran, as long as its not frogs legs'.",
            "questions": [
                "Type in a number",
                "Type in a female name",
                "Name an adjective",
                "Name an animal",
                "Type in a colour",
                "Describe the weather",
                "Small, Medium or Large?",
                "Name a speed",
                "Type in an adjective",
                "Type in female name"]
        ],
        "Fight": [
            "text": "In the kingdom of <0> there was a prince named <1>. The prince fell ill from a witches spell and was asleep for <2> hours. To wake the prince from his slumber, a strange <3> was to be plucked from a <4> mountain in the sky. The princes warriors, <5> and Rocky set off on a voyage to obtain the <3>. Only a mile from the kingdom the warriors were met with <6> bandits. The bandits wanted to steal <5>S golden <7>. The bandits had weapons of all sorts, swords, hammers, <8>s, you name it they had it. Rocky was a fine swordsman and beat the bandits up one by one and saved <5>S <7>. The two continued their journey, plucked the <3> and came back to the kingdom. The queen went to use the <3> on her son, however, the prince would not wake up! The <3> had died! Rocky stamped his feet in despair and 'BOING' the Prince jumped high off his <9> bed. Apparently Rocky's <7> was magical, and they didn't need the <3> after all.",
            "questions":[
                "Name a town",
                "Type in a male name",
                "Type in a number",
                "Name a vegetable",
                "Small, Medium or Large?",
                "Type in another name",
                "Type in another number",
                "Name an item of clothing",
                "Name a cooking utensil",
                "Type in an adjective"]
        ]
    ]
    
}
