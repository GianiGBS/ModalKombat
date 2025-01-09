
# **ModalKombat**

  

**ModalKombat** est un jeu de combat interactif basé sur la console, développé en Swift, où deux joueurs s’affrontent à travers leurs équipes de personnages. Ce projet met en avant les concepts fondamentaux de la programmation orientée objet (POO) dans Swift.

  

## **📝 Description**

  

ModalKombat est un jeu textuel dans lequel :

  

• Chaque joueur crée une équipe de **3 personnages** choisis parmi différents types (Combattant, Mage, Colosse, Nain).

• Les joueurs s’affrontent à tour de rôle en attaquant ou en soignant des personnages.

• Des événements aléatoires, comme l’apparition de coffres contenant des armes, ajoutent une touche de stratégie et de hasard.

  

Le jeu se termine lorsque tous les personnages d’une équipe sont vaincus.

  

## **📜 Règles principales**

  

**Création des équipes**

1\. Chaque joueur choisit 3 personnages parmi les types suivants :

• **Combattant** : Guerrier équilibré avec une attaque standard.

• **Mage** : Capable de soigner les membres de son équipe.

• **Colosse** : Résistant mais inflige peu de dégâts.

• **Nain** : Fragile mais inflige de lourds dégâts.

2\. Chaque personnage doit être nommé avec un nom unique.

3\. Les personnages possèdent des points de vie initiaux et une arme par défaut.

  

**Mécanique de combat**

• À chaque tour, un joueur :

1\. Sélectionne un personnage de son équipe.

2\. Choisit une action : attaquer un adversaire ou soigner un allié (si Mage).

3\. Si un coffre apparaît, le personnage peut recevoir une nouvelle arme aléatoire.

• Les actions sont résolues immédiatement, et l’état des personnages est mis à jour.

  

**Conditions de victoire**

• Une équipe gagne lorsque tous les personnages adverses sont éliminés.

  

## **🚀 Fonctionnalités principales**

• **Combat dynamique** : Sélection et actions des personnages à tour de rôle.

• **Apparition aléatoire de coffres** : Offre des armes ou des bonus aléatoires.

• **Statistiques du jeu** : Résumé des performances (nombre de tours, actions effectuées, etc.).

• **Extension personnalisée** : Bonus créatif ajouté (ex. nouveau type de personnage ou effet spécial).

  

## **📂 Structure du projet**

  

**Classes principales**

1\. **Game** : Gère le déroulement global de la partie (tours, victoire, etc.).

2\. **Player** : Représente un joueur et son équipe.

3\. **Character** : Représente un personnage avec des attributs comme le nom, la santé, et l’arme.

4\. **Weapon** : Définit les armes et leurs effets (dégâts ou soins).

5\. **Chest** : Gère l’apparition aléatoire des coffres et leur contenu.

  

**Diagrammes**

• **Diagramme de classe** : Décrit les relations entre les objets du jeu [upload soon] .

• **Diagramme de séquence** : Illustre le flux d’interactions pendant une partie .

  

## **🔧 Installation**

1\. Clonez le dépôt :
```bash
git clone https://github.com/GianiGBS/ModalKombat.git
```

```bash
cd ModalKombat
```

  

  

2\. Ouvrez le fichier .xcodeproj avec Xcode.

3\. Lancez le projet dans la console en sélectionnant un simulateur macOS.

  

## **🛠️ Technologies utilisées**

• **Swift** : Langage principal.

• **Xcode** : IDE utilisé pour le développement.

  

## **🤝 Contribution**

  

Les contributions sont les bienvenues ! Ouvrez une issue ou une pull request pour proposer des améliorations.

  

## **📜 License**

  

Ce projet est sous licence MIT. Consultez le fichier LICENSE pour plus d’informations.

  

## **🎮 Exemple d’exécution**

  
```bash
Welcome to ModalKombat!

Player 1, please name your characters:

\- Character 1: Thor

\- Character 2: Merlin

\- Character 3: Gimli

  

Player 2, please name your characters:

\- Character 1: Hulk

\- Character 2: Gandalf

\- Character 3: Tyrion

  

The battle begins!

Thor attacks Hulk for 10 damage.

Merlin heals Thor for 15 HP.

A chest appears! Gimli equips a new weapon: "Battle Axe" (+20 attack).

...

  ```

## **📈 Statistiques finales**

  

À la fin de la partie, les statistiques suivantes sont affichées :

  

• Nombre de tours joués.

• Points de dégâts infligés par chaque personnage.

• Points de vie soignés par les Mages.

• Durée totale de la partie.

##
