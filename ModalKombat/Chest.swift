//
//  Chest.swift
//  ModalKombat
//
//  Created by Giovanni Gabriel on 18/10/2021.
//


class Chest {
    
    // TODO: Properties
    var randomPlayer: Int
    var randomCharacter: Int
    var randomTurn: Int
    
    // TODO: Initialization
    init() {
        self.randomTurn = Int.random(in: 1...5)
        self.randomPlayer = Int.random(in: 0...1)
        self.randomCharacter = Int.random(in: 0...2)
    }
    
    // TODO: Methods
    func checkChest(){
        if randomTurn == turnNumber {
            print("Pas si vite ! Un coffre sauvage apparait")
            
            print("""
            Que souhaites-tu faire ?
            """
                 + "\n1. Ouvrir le coffre."
                 + "\n2. Continuer.")

             if let userChoice = readLine(){
                 switch userChoice {
                 case "1":
                     _ = showChest()
                 case "2":
                     break
                 default:
                     checkChest()
                 }
             }
        }
    }
    func showChest() -> Weapon? {
        let randomWeapon = weaponsList.randomElement()
        if let weapon = randomWeapon{
                print("Il y a une arme : \(weapon.name) qui inflige : \(weapon.damage) points de degats et peut soigner de : \(weapon.heal) points de vie. ")
                assignate(weapon)
                return weapon
        }
        print("Le coffre est vide")
        return nil
    }
    private func assignate(_ weapon: Weapon) {
        if Game.players[randomPlayer].characters[randomCharacter].healt > 0 && Game.players[randomPlayer].characters[randomCharacter].ownWeapon !== weapon {
            Game.players[randomPlayer].characters[randomCharacter].ownWeapon = weapon
            print("le joueur \(Game.players[randomPlayer].name) obtient \(weapon.name) pour \(Game.players[randomPlayer].characters[randomCharacter].name) le \(Game.players[randomPlayer].characters[randomCharacter].category)")
        } else {
            assignate(weapon)
        }
    }
}
