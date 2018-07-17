ReadMe

Ce Morpion a été conçu par Dimitri KIAVUE et Pierre Tâm-Anh LE KHAC

**Let's start: lance et fais fonctionner le game Maggle**

- Lancer le programme avec le fichier : morpion.rb ;
- Faire jouer 2 joueurs ;
- Demander les prénoms de chaque joueur;
- Demander les icônes de chaque joueur;
- Demander au joueur quelle case il veut jouer parmi les 9 cases;
- Afficher le plateau à chaque fin de tour de joueur ;
- Annoncer la victoire d'un des 2 joueurs en cas de victoire


3 Classes :
- Board
- Player
- Game


**Board**
Cette classe contient trois méthodes qui sont les gardiennes du temple de la cohérence du game sur l’échiquier :

def display_board > Montre le plateau de jeu
def play > Case remplie / pas remplie?
def victory? > Gagné / pas gagné?


**Player**
Cette classe concerne les joueurs et possède 2 valeurs :

name : Nom du joueur
icon : L'icône choisie par le joueur


**Game**
Cette classe Game pose les bases structurelles du jeu et vérifie qui doit jouer, et le dénouement du jeu (victoire/défaite ou match nul), avec les méthodes suivantes :

- def go # => ZE METHOD qui mobilise tout le code et fait exécuter le jeu, .
- def turn # =>  ZE MTHOD qui couvre le move d’un joueur en collectant la case choisie par ce dernier, puis redessine le board
