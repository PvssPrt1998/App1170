import Foundation

final class Source: ObservableObject {
    
    let manager = Manager()
    
    @Published var times: Array<Time> = []
    @Published var skins: Array<Skin> = []
    
    @Published var guides: Array<Guide> = [
        Guide(id: 1, title: "How to Improve Your Aim in Counter-Strike 2", image1: "guide11", image2: "guide12", image3: "guide13", text1: "• Master crosshair placement: Always keep your crosshair at head level.", text2: "• Practice tracking and flick shots in aim training maps.", text3: "• Learn recoil patterns for your favorite weapons.", isFavorite: false, readed: false),
        Guide(id: 2, title: "Essential Grenade Spots for Dust2", image1: "guide21", image2: "guide22", image3: "guide23", text1: "• Smoke for Xbox: Stand in T-spawn and aim at the window ledge.", text2: "• Flash for A-site: Throw a flash over long doors to blind defenders.", text3: "• Molotov for B-site: Aim at the back of the site to flush out campers.", isFavorite: false, readed: false),
        Guide(id: 3, title: "Economy Management in Competitive Matches", image1: "guide31", image2: "guide32", image3: "guide33", text1: "• Know when to eco (save money for a full buy).", text2: "• Use pistols effectively in force-buy rounds.", text3: "• Prioritize utility purchases over high-cost weapons.", isFavorite: false, readed: false),
        Guide(id: 4, title: "Best Weapon Loadouts for Different Scenarios", image1: "guide41", image2: "guide42", image3: "guide43", text1: "• Pistol rounds: Use the USP-S or Glock for precision.", text2: "• Full buy rounds: Combine an AK-47/M4A4 with grenades.", text3: "• Eco rounds: Deagle or P250 for impactful low-budget options.", isFavorite: false, readed: false),
        Guide(id: 5, title: "Top Strategies for T-Side", image1: "guide51", image2: "guide52", image3: "guide53", text1: "• Execute A-split: Control mid and push through catwalk and long.", text2: "• Default setup: Spread out and look for picks across the map.", text3: "• Fake plays: Create noise on one site to pull rotations, then hit the other.", isFavorite: false, readed: false),
        Guide(id: 6, title: "How to Communicate Effectively with Your Team", image1: "guide61", image2: "guide62", image3: "guide63", text1: "• Use precise callouts: Learn all map-specific locations.", text2: "• Share economy info: Let teammates know your money situation.", text3: "• Coordinate utility usage: Avoid wasting grenades.", isFavorite: false, readed: false),
        Guide(id: 7, title: "Tips for Defending as CT", image1: "guide71", image2: "guide72", image3: "guide73", text1: "• Hold angles with the advantage: Use your environment to stay unpredictable.", text2: "• Play crossfire setups: Coordinate positions with your teammate.", text3: "• Use utility for delay: Smokes and incendiaries can stall pushes.", isFavorite: false, readed: false),
        Guide(id: 8, title: "Understanding the New CS2 Mechanics", image1: "guide81", image2: "guide82", image3: "guide83", text1: "• Weapon accuracy on the move: Learn which weapons are best for strafing.", text2: "• Improved smoke grenades: Take advantage of their dynamic behavior.", text3: "• Sub-tick servers: Adapt your timing for smoother gameplay.", isFavorite: false, readed: false),
        Guide(id: 9, title: "How to Rank Up Faster in CS2", image1: "guide91", image2: "guide92", image3: "guide93", text1: "• Play with a pre-made team for better coordination.", text2: "• Focus on improving individual skill in aim training and strategy.", text3: "• Avoid toxic behavior: Stay positive and contribute to teamwork.", isFavorite: false, readed: false),
        Guide(id: 10, title: "Advanced Movement Techniques", image1: "guide101", image2: "guide102", image3: "guide103", text1: "• Bunny hopping: Master strafe-jumping for faster map traversal.", text2: "• Jiggle peeking: Use it to bait shots and gather intel.", text3: "• Shoulder peeking: Expose just enough of yourself to check angles.", isFavorite: false, readed: false)
    ]
    
    @Published var subtleties: Array<Subtletie> = [
        Subtletie(id: 1, title: "Use Sound to Your Advantage", image: "Subtletie1", image1: "subtletie11", image2: "subtletie12", image3: "subtletie13", text1: "• Enemy footsteps reveal direction and proximity.", text2: "• Shift-walking (crouch or walk) makes you silent but slower.", text3: "• Fake defuse sounds can bait opponents into revealing their position.", isFavorite: false, readed: false),
        Subtletie(id: 2, title: "Peek with Precision", image: "Subtletie2", image1: "subtletie21", image2: "subtletie22", image3: "subtletie23", text1: "• Wide peeks can surprise enemies, but they expose you more.", text2: "• Jiggle peeking is safer for gathering intel without committing fully.", text3: "", isFavorite: false, readed: false),
        Subtletie(id: 3, title: "Dynamic Smokes Can Be Manipulated", image: "Subtletie3", image1: "subtletie31", image2: "subtletie32", image3: "subtletie33", text1: "• Throw grenades through smokes to briefly clear them.", text2: "• Bullets and grenades can distort or dissipate the new volumetric smokes.", text3: "", isFavorite: false, readed: false),
        Subtletie(id: 4, title: "Weapon-Switch Timing Matters", image: "Subtletie4", image1: "subtletie41", image2: "subtletie42", image3: "subtletie43", text1: "• Avoid reloading in unsafe spots; switching to your pistol can save you in a pinch.", text2: "• Knife movement is faster, ideal for rotating or escaping.", text3: "", isFavorite: false, readed: false),
        Subtletie(id: 5, title: "Map Awareness Wins Games", image: "Subtletie5", image1: "subtletie51", image2: "subtletie52", image3: "subtletie53", text1: "• Always glance at the radar for teammate positions and dropped bomb locations.", text2: "• Use the minimap to predict enemy rotations based on your team's presence.", text3: "", isFavorite: false, readed: false),
        Subtletie(id: 6, title: "Learn Recoil Recovery Timing", image: "Subtletie6", image1: "subtletie61", image2: "subtletie62", image3: "subtletie63", text1: "• After shooting, let your crosshair settle for maximum accuracy.", text2: "• Tap or burst fire at longer ranges instead of holding down the trigger.", text3: "• Fake defuse sounds can bait opponents into revealing their position.", isFavorite: false, readed: false),
        Subtletie(id: 7, title: "Use Shadows for Intel", image: "Subtletie7", image1: "subtletie71", image2: "subtletie72", image3: "subtletie73", text1: "• Pay attention to enemy shadows around corners or near windows.", text2: "• Position yourself to avoid giving away your shadow when holding angles.", text3: "", isFavorite: false, readed: false),
        Subtletie(id: 8, title: "Crosshair Placement Saves Lives", image: "Subtletie8", image1: "subtletie81", image2: "subtletie82", image3: "subtletie83", text1: "• Keep your crosshair aligned with common headshot angles.", text2: "• Avoid aiming at the ground or sky, even when moving.", text3: "", isFavorite: false, readed: false),
        Subtletie(id: 9, title: "Utility Is More Important Than You Think", image: "Subtletie9", image1: "subtletie91", image2: "subtletie92", image3: "subtletie93", text1: "• A $300 smoke can win a $16,000 round by blocking key sightlines.", text2: "• Flashbang timing is crucial; practice to avoid flashing your teammates.", text3: "", isFavorite: false, readed: false),
        Subtletie(id: 10, title: "Mind the Economy", image: "Subtletie10", image1: "subtletie101", image2: "subtletie102", image3: "subtletie103", text1: "• Sometimes, saving your weapon is better than risking an unwinnable round.", text2: "• Drop weapons for teammates who are better positioned or have higher impact potential.", text3: "", isFavorite: false, readed: false)
    ]
    
    @Published var mistakes: Array<Mistake> = [
        Mistake(id: 1, title: "Poor Crosshair Placement", image: "mistake1", image1: "mistake11", image2: "mistake12", text1: "• Aiming at the ground or too high reduces reaction time.", text2: "• Always aim at head level where enemies are likely to appear.", isFavorite: false, readed: false),
        Mistake(id: 2, title: "Ignoring the Economy", image: "mistake2", image1: "mistake21", image2: "mistake22", text1: "• Buying every round leads to weak setups in key moments.", text2: "• Learn when to save, force-buy, or full-buy based on your team’s finances.", isFavorite: false, readed: false),
        Mistake(id: 3, title: "Overcommitting to Fights", image: "mistake3", image1: "mistake31", image2: "mistake32", text1: "• Chasing kills often exposes you to unnecessary danger.", text2: "• Take fights on your terms, using cover and positioning.", isFavorite: false, readed: false),
        Mistake(id: 4, title: "Neglecting Utility Usage", image: "mistake4", image1: "mistake41", image2: "mistake42", text1: "• Not buying or using grenades can cost your team tactical advantages.", text2: "• Misusing flashes and smokes can hurt your teammates instead of helping.", isFavorite: false, readed: false),
        Mistake(id: 5, title: "Reloading at the Wrong Time", image: "mistake5", image1: "mistake51", image2: "mistake52", text1: "• Reloading in the middle of a fight or in open areas is a common death sentence.", text2: "• Switch to your pistol or reposition before reloading.", isFavorite: false, readed: false),
        Mistake(id: 6, title: "Overpeeking", image: "mistake6", image1: "mistake61", image2: "mistake62", text1: "• Constantly re-peeking the same angle gives enemies time to prepare.", text2: "• Peek intelligently, and let teammates support you when possible.", isFavorite: false, readed: false),
        Mistake(id: 7, title: "Lack of Communication", image: "mistake7", image1: "mistake71", image2: "mistake72", text1: "• Staying silent leaves your team unaware of enemy positions or strategies.", text2: "• Use clear and concise callouts for map locations and threats.", isFavorite: false, readed: false),
        Mistake(id: 8, title: "Playing Predictably", image: "mistake8", image1: "mistake81", image2: "mistake82", text1: "• Repeating the same routes or strategies makes you easy to counter.", text2: "• Mix up your positioning and tactics to keep enemies guessing.", isFavorite: false, readed: false),
        Mistake(id: 9, title: "Not Checking Corners", image: "mistake9", image1: "mistake91", image2: "mistake92", text1: "• Rushing into areas without clearing corners often leads to ambushes.", text2: "• Use methodical movement and utility to ensure areas are safe.", isFavorite: false, readed: false),
        Mistake(id: 10, title: "Underestimating Pistols", image: "mistake10", image1: "mistake101", image2: "mistake102", text1: "• Pistols like the Deagle, P250, or Five-Seven can turn eco rounds into wins.", text2: "• Learn how to use pistols effectively rather than relying solely on rifles.", isFavorite: false, readed: false)
    
    ]
    
    func load(completion: () -> Void) {
        
        if let skins = try? manager.fetchSkins() {
            self.skins = skins
        }
        if let times = try? manager.fetchTime() {
            self.times = times
        }
        if let guidesCD = try? manager.fetchGuides() {
            guidesCD.forEach { gcd in
                guides[Int(gcd.id) - 1].isFavorite = gcd.isFavorite
                guides[Int(gcd.id) - 1].readed = gcd.readed
            }
        }
        if let guidesCD = try? manager.fetchSubtleties() {
            guidesCD.forEach { gcd in
                subtleties[Int(gcd.id) - 1].isFavorite = gcd.isFavorite
                subtleties[Int(gcd.id) - 1].readed = gcd.readed
            }
        }
        if let guidesCD = try? manager.fetchMistakes() {
            guidesCD.forEach { gcd in
                mistakes[Int(gcd.id) - 1].isFavorite = gcd.isFavorite
                mistakes[Int(gcd.id) - 1].readed = gcd.readed
            }
        }
        
        
        completion()
    }
    
    func guideFavoriteToggle(_ guide: Guide) {
        guides[guide.id - 1].isFavorite = guide.isFavorite
        manager.saveOrEdit(guides[guide.id - 1])
    }
    
    func guideReaded(_ guide: Guide) {
        guides[guide.id - 1].readed = guide.readed
        manager.saveOrEdit(guides[guide.id - 1])
    }
    
    func subtletieFavoriteToggle(_ subtletie: Subtletie) {
        subtleties[subtletie.id - 1].isFavorite = subtletie.isFavorite
        manager.saveOrEdit(subtleties[subtletie.id - 1])
    }
    
    func subtletieReaded(_ subtletie: Subtletie) {
        subtleties[subtletie.id - 1].readed = subtletie.readed
        manager.saveOrEdit(subtleties[subtletie.id - 1])
    }
    
    func mistakeFavoriteToggle(_ mistake: Mistake) {
        mistakes[mistake.id - 1].isFavorite = mistake.isFavorite
        manager.saveOrEdit(mistakes[mistake.id - 1])
    }
    
    func mistakeReaded(_ mistake: Mistake) {
        mistakes[mistake.id - 1].readed = mistake.readed
        manager.saveOrEdit(mistakes[mistake.id - 1])
    }
    
    func saveTime(_ time: Time) {
        times.append(time)
        manager.saveTime(time)
    }
    
    func removeTime(_ time: Time) {
        guard let index = times.firstIndex(where: {$0.uuid == time.uuid}) else { return }
        times.remove(at: index)
        try? manager.removeTime(time)
    }
    
    func saveSkin(_ skin: Skin) {
        skins.append(skin)
        manager.saveSkin(skin)
    }
    
    func removeSkin(_ skin: Skin) {
        guard let index = skins.firstIndex(where: {$0.uuid == skin.uuid}) else { return }
        skins.remove(at: index)
        try? manager.removeSkin(skin)
    }
    
    func editSkin(_ skin: Skin) {
        guard let index = skins.firstIndex(where: {$0.uuid == skin.uuid}) else { return }
        skins[index] = skin
        manager.editSkin(skin)
    }
}
