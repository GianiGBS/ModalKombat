//
//  Player.swift
//  ModalKombat
//
//  Created by Giovanni Gabriel on 18/10/2021.
//


class Player {
    
    // MARK: Properties
    var id : Int
    var name : String
    var characters = [Character]()
    var score: Int = 0
    
    // MARK: Initialization
    init (id : Int, name : String) {
        self.id = id
        self.name = name
    }
    // MARK: Methods
    func setPlayerName() {
        print("""
        
              Choisi le nom du Joueur \(self.id).
        """)
        if let name = readLine(), !name.isEmpty{
            self.name = name.uppercased()
            print("""
                  Salutation \(self.name) !
        """)
        }
        else{ // Wrong answer ! Try again.
            print("Vous n'avez pas donné un nom au \(self.name).")
            setPlayerName()
        }
    }
    func createTeam(){
        var teamate = Character(name: "", category: "", healt: 0, ownWeapon: Weapon(name: "", damage: 0, heal: 0))
        var indexCharacters = 3
        while characters.count < 3 {
        print("""

\(self.name), choisi maintenant \(indexCharacters) personnage(s) dans cette liste pour former une equipe :
""")
            for (index, character) in charactersList.enumerated() {
                print("\(index + 1). \(character.category)")
        }
        // We get the user's response
        if let choice = readLine(), let indexChoice = Int(choice) {
            if indexChoice > 0 && indexChoice < 6 {
                teamate = charactersList[indexChoice - 1]
                characters.append(charactersList[indexChoice - 1])
                charactersList.remove(at: (indexChoice - 1))
                indexCharacters -= 1
                print("""
                      Bravo \(self.name)! Tu as ajouté un \(teamate.category) à ton équipe.

                """)
            } else { // Wrong answer ! Try again.
                print("Désolé... Je n'ai pas bien compris ? Veuillez choisir entre 1 et 6.")
                createTeam()
            }
        }else { // Wrong answer ! Try again.
            print("Désolé... Je n'ai pas bien compris ? Veuillez choisir entre 1 et 6.")
            createTeam()
        }
        }
    }
    func setTeamCharactersName() {
        for (index, _) in self.characters.enumerated() {
            self.characters[index].setCharacterName()
        }
    }
    func showTeam() {
        print("""
        
              \(self.name), tu es le Joueur \(self.id), voici ton équipe :
        
        """)
        for (index, character) in characters.enumerated() {
            print("\(character.name), est à l'index \(index + 1), c'est un \(character.category) qui a \(character.healt) points de ❤️ et peut faire \(character.ownWeapon.damage) points de 💥 avec \(character.ownWeapon.name).")
        }
    }
    private func selectFighter() { // We select our attacker
        var fighter = Character(name: "", category: "", healt: 0, ownWeapon: Weapon(name: "", damage: 0, heal: 0))
        
        print("\(self.name), choisi maintenant ton Attaquant.")
        
        for (index, character) in characters.enumerated() {
            if character.healt > 0 {
                print("\(index + 1). \(character.name) le \(character.category)")
            }
        }
        // We get the user's response
        if let choice = readLine(), let indexChoice = Int(choice) {
            if indexChoice > 0 && indexChoice < 4 && characters[indexChoice - 1].healt > 0 {
                fighter = characters[indexChoice - 1]
                print("Tu as choisi \(fighter.name) le \(fighter.category) comme Attaquant.")
                selectAction(fighter: fighter)
            } else { // Wrong answer ! Try again.
                print("Désolé... Je n'ai pas bien compris ? Veuillez choisir entre 1 et 3.")
                selectFighter()
            }
        } else { // Wrong answer ! Try again.
            print("Désolé... Je n'ai pas bien compris ? Veuillez choisir entre 1 et 3.")
            selectFighter()
        }
    }
    private func selectAction(fighter : Character) { // We choose the action of our Attacker
        print("""

    Choisi maintenant l'action pour \(fighter.name).
    """
              + "\n1. Attaquer"
              + "\n2. Soigner")
        
        // We get the user's response
            if let choice = readLine() {
                switch choice {
                case "1":
                    chest.checkChest()
                    print("Tu as choisi d'attaquer. EN GARDE !")
                    _ = selectEnemyTarget(fighter: fighter)
                case "2":
                    print("Tu as choisi de soigner.")
                    _ = selectAllyTarget(fighter: fighter)
                default: // Wrong answer ! Try again.
                    print("Désolé... Je n'ai pas bien compris ? Veuillez choisir entre 1 et 2.")
                    selectAction(fighter: fighter)
                }
            }
    }
    private func selectAllyTarget(fighter : Character) -> Character { // We select our ally target
        var target = Character(name: "", category: "", healt: 0, ownWeapon: Weapon(name: "", damage: 0, heal: 0))
        
        print("""
        
        Choisi maintenant une cible Aliée dans la liste suivante.
        """)
        
        for (index, character) in characters.enumerated() {
            if character.healt > 0 {
                print("\(index + 1). \(character.name) le \(character.category)")
            }
        }
    
        // We get the user's response
        if let choice = readLine(), let indexChoice = Int(choice) {
            if indexChoice > 0 && indexChoice < 4 && characters[indexChoice - 1].healt > 0 {
                target = characters[indexChoice - 1]
                print("Tu as choisi \(target.name) comme cible.")
                fighter.heal(target: target)
            }
            else { // Wrong answer
                print("Désolé... Je n'ai pas bien compris ? Veuillez choisir entre 1 et 3.")
                _ = selectAllyTarget(fighter: fighter)
            }
        } else { // Wrong answer ! Try again.
            print("Désolé... Je n'ai pas bien compris ? Veuillez choisir entre 1 et 3.")
            _ = selectAllyTarget(fighter: fighter)
        }
        return target
    }
    private func selectEnemyTarget(fighter : Character) -> Character { // We select our enemy target
        let enemyPlayer = currentPlayer == 1 ? 1 : 0
        var target = Character(name: "", category: "", healt: 0, ownWeapon: Weapon(name: "", damage: 0, heal: 0))

        print("""
        
        Choisi maintenant une cible Ennemi dans la liste suivante.
        """)
        for (index, character) in Game.players[enemyPlayer].characters.enumerated() {
            if character.healt > 0 {
                print("\(index + 1). \(character.name) le \(character.category)")
            }
        }
        // We get the user's response
        if let choice = readLine(), let indexChoice = Int(choice) {
            if indexChoice > 0 && indexChoice < 4 && Game.players[enemyPlayer].characters[indexChoice - 1].healt > 0 {
                target = Game.players[enemyPlayer].characters[indexChoice - 1]
                print("Tu as choisi \(target.name) comme cible.")
                fighter.attack(target: target)
            }
            else { // Wrong answer ! Try again.
                print("Désolé... Je n'ai pas bien compris ? Veuillez choisir entre 1 et 3.")
                _ = selectEnemyTarget(fighter: fighter)
            }
        } else { // Wrong answer ! Try again.
            print("Désolé... Je n'ai pas bien compris ? Veuillez choisir entre 1 et 3.")
            _ = selectEnemyTarget(fighter: fighter)
        }
        return target
    }
    func teamIsAlive() -> Bool {
        var totalTeamHealt = 0
        for character in characters {
            totalTeamHealt += character.healt
        }
        return totalTeamHealt > 0
    }
    func turn(against enemyPlayer: Player){
         print("""
        
             _____ C'est au tour du Joueur \(self.id) de jouer. _____
        
        \(self.name) ? Que souhaites-tu faire ?
        """
             + "\n1. Voir ton équipe."
             + "\n2. Combattre. ")
       
         if let userChoice = readLine(){
             switch userChoice {
             case "1":
                 showTeam()
                 turn(against: enemyPlayer)
             case "2":
                 selectFighter()
             default: // Wrong answer ! Try again.
                 print("Je ne comprends pas...")
                 turn(against: self)
             }
         }
        currentPlayer = enemyPlayer.id == 1 ? 1 : 0
        turnNumber += 1
     }
}
