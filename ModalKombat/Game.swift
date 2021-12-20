//
//  Game.swift
//  ModalKombat
//
//  Created by Giovanni Gabriel on 21/10/2021.
//


 class Game {
    
    // MARK: Properties
    static var players = [Player]()

    // MARK: Methods
    func presentation() {
            let message = """
                    _____Bienvenue !_____
    
    MODALKOMBAT est un jeu de combat au tour par tour
    qui est composé de deux joueurs.
    Chaque joueur a une équipe composée de trois personnages.
    Chaque personnage à des points de vie, un nom et une arme.
    
    Enjoy !
    
    """
            print(message)
        }
    func start(){
        print("Voulez-vous lancer une partie ?"
        + "\n1. Oui"
        + "\n2. Non")
        // We get the user's response
            if let choice = readLine() {
                switch choice {
                case "1":
                    print("_____ Bonjour et bienvenue dans l'arene de MODALKOMBAT _____")
                    newGame()
                case "2":
                    print("_____ Aurevoir à bientôt _____")
                    break
                default: // Wrong answer ! Try again.
                    print("Oups... Je n'ai pas bien compris ? Veuillez choisir entre 1 et 2.")
                    start()
                }
            }
    }
    func addPlayer(player : Player){
        Game.players.append(player)
    }
    
    fileprivate func newGame(){
        player1.setPlayerName()
        player1.createTeam()
        player1.setTeamCharactersName()
        player1.showTeam()
        player2.setPlayerName()
        player2.createTeam()
        player2.setTeamCharactersName()
        player2.showTeam()

        //Tour à tour Logique
        while player1.teamIsAlive() && player2.teamIsAlive(){
            // player 1 plays
            if currentPlayer == 1 {
                player1.turn(against:player2)
            }
            else {
                player2.turn(against:player1)
            }
        }
        winCheck()
    }
     private func winCheck(){
         if player1.teamIsAlive() == false {
             print("""
          
                🎊🎉____Félicitation !____🎉🎊
                    \(player2.name) GAGNE.
                🎊🎉👏👏👏👏👏👏👏👏👏👏👏👏👏👏🎉🎊
          """)
             showStat()
         } else if player2.teamIsAlive() == false {
             print("""
          
                🎊🎉____Félicitation !____🎉🎊
                    \(player1.name) GAGNE.
            🎊🎉👏👏👏👏👏👏👏👏👏👏👏👏👏👏🎉🎊
          """)
             showStat()
         }
     }
     
    private func showStat(){
            print("""

                    _____Stat de la partie_____

Nombre de tour : \(turnNumber)

Score : Player 1 [\(player1.score) - \(player2.score)] Player 2

Récapitulatif des équipes :
""")
        player1.showTeam()

        player2.showTeam()
    }
}

