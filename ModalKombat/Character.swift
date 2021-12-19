//
//  Character.swift
//  ModalKombat
//
//  Created by Giovanni Gabriel on 18/10/2021.
//


public class Character{
    
    // MARK: Properties
    var name : String 
    let category : String
    var healt : Int{
        didSet {
            if self.healt <= 0 {
                self.healt = 0
            }
        }
    }
    var ownWeapon : Weapon
    
    // MARK: Initialization
    init(name: String, category: String, healt: Int, ownWeapon : Weapon){
        self.name = name
        self.category = category
        self.healt = healt
        self.ownWeapon = ownWeapon
    }

    // MARK: Methods
    func setCharacterName(){
        print("Maintenant choisi le nom de ton \(category).")
        if let name = readLine(), !name.isEmpty {
            if charactersNames.contains(name.lowercased()){
                print("Désolé... Mais ce nom est déjà attribué a un autre joueur.")
                setCharacterName()
            } else {
                charactersNames.append(name.lowercased())
                self.name = name.uppercased()
                print("Félicitation ton \(category) s'appelle maintenant : \(self.name).")
            }
        } else {
            print("Désolé... Mais tu n'as pas donné un nom à ton \(category).")
            setCharacterName()
        }
    }
    
    func attack(target: Character) {
         target.healt -= ownWeapon.damage
        print("""
    
              \(name) le \(category) attaque \(target.name) le \(target.category) et lui inflige \(ownWeapon.damage) points de dégat avec l'arme : \(ownWeapon.name)
    """)
        if target.healt <= 0 {
            print("""
        
                  \(name) le \(category) a achevé \(target.name) le \(target.category) .
        """)
            Game.players[currentPlayer].score+=1
        }
    }
    func heal(target: Character) {
        target.healt += ownWeapon.heal
        print("""
    
              \(name) le \(category) soigne \(target.name) le \(target.category) de  \(ownWeapon.heal) points de dégat avec l'arme :\(ownWeapon.name)
    """)
    }

}

var charactersList: [Character] = [Character(name: "", category: "Knight 🛡", healt: 100, ownWeapon: weaponsList[3]),
                                   Character(name: "", category: "Wizard 🔮", healt: 50, ownWeapon: weaponsList[2]),
                                   Character(name: "", category: "Ranger 🏹", healt: 65, ownWeapon: weaponsList[4]),
                                   Character(name: "", category: "Gladiator ⚔️", healt: 100, ownWeapon: weaponsList[0]),
                                   Character(name: "", category: "Shaman 📿", healt: 55, ownWeapon: weaponsList[5]),
                                   Character(name: "", category: "Assasin 🗡", healt: 60, ownWeapon: weaponsList[1])]
