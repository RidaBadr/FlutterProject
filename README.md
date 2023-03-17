# FlutterProject

MIAGED est une plateforme de vente en ligne proposant une variété de produits pour (Homme, Femme, Enfant), permettant aux utilisateurs d'ajouter ou de retirer des articles de leur panier, de modifier leur profil et de sauvegarder ces informations dans une base de données Firebase.

# Informations de connexion : 
  - Login :  badr@miage.ma
  - Mot de passe :  azerty

## MVP of the application

### US#1:[MVP] Interface de login
-  Les deux champs de saisie sont : Email et Mot De Passe
- Le champ de saisie du Mot de Passe est obfusqué.
- Le label du bouton est : Se connecter
-  Au clic sur le bouton « Se connecter », une vérification en base est réalisée [avec la gestion des erreurs]. Si l’utilisateur existe, celui-ci est redirigé sur la page Home qui contient l'ensemble des produits à vendre.

### US#2:[MVP] Liste de vêtements
- l’utilisateur arrive sur cette page et pourra visualiser le contenu principal et d’une BottomNavigationBar composée de trois entrées et leurs icônes correspondantes : [Acheter], [Panier], [Profil]
- La page actuelle est la page Acheter. Son icône et son texte sont d’une couleur différente des autres entrées
- Une liste déroulante de tous les vêtements m’est proposée à l’écran
- Chaque vêtement affiche les informations suivantes : Une image (les images ne sont pas gérées dans l’application, insérées à travers des liens internet), un titre , la taille, le prix.
- Au clic sur une entrée de la liste, le détail est affiché (Voir US#3)
- Cette liste de vêtements est récupérée de la base de données.

### US#3:[MVP] Détail d’un vêtement 
- La page de détail est composée des informations suivantes : une image, un titre, la taille, la marque, le prix.
- La page est également composée d’un bouton « Retour ».

### US#4:[MVP] Le panier
- Au clic sur le bouton « Panier », la liste des vêtements du panier de l’utilisateur est affichée avec les informations suivantes : Une image (n'est pas géré localement), un titre, la taille, le prix.
-  Un total général est affiché à l’utilisateur (somme de tous les vêtements du panier)
-  À droite de chaque vêtement, une icône permet à l’utilisateur de retirer un produit. Au clic sur celle-ci, le produit est retiré de la liste et le total général mis à jour
-  Aucun autre bouton d’action n’est présent sur la page (pas de paiement pour le moment)

### US#5: [MVP] Profil utilisateur
- Au clic sur le bouton « Profil », les informations de l’utilisateur s’affichent.
- Les informations sont : Le login (readonly), Le password (offusqué), L’anniversaire , L’adresse , Le code postal (affiche le clavier numérique et n’accepte que les chiffres) , La ville.
- Un bouton « Valider » permet de sauvegarder les données (en base de données)
- Un bouton « Se déconnecter » permet de revenir à la page de login


### US#6: Filtrer sur la liste des vêtements

- Sur la page « Acheter », une TabBar est présente, listant "Tous", "Hommes" "Femmes" "Enfants" 
- Par défaut, l’entrée « Tous » est sélectionnée et tous les vêtements sont affichés.
- Au clic sur une des entrées, la liste est filtrée pour afficher seulement les vêtements correspondants à la catégorie sélectionnée


### US#7 : Fonction supplémentaire

- SplashScreen
- Interface pour s'inscrire s'il s'agit d'un nouvel utilisateur
- un Drawer qui affiche le logo de l'application et FAQ, A propos, Se Déconnecter

### SCREENSHOT

![2023-03-17_19h51_03](https://user-images.githubusercontent.com/114596641/225993788-14b96d37-343d-4e84-b50e-8374a3c547df.png)
![2023-03-17_19h43_43](https://user-images.githubusercontent.com/114596641/225993932-5f41142e-a374-4e02-8678-1b4cb19d76c6.png)
![2023-03-17_19h45_05](https://user-images.githubusercontent.com/114596641/225993950-90ba9a3a-5a59-4fa9-8d4d-c32dc15a7d91.png)
![2023-03-17_19h38_30](https://user-images.githubusercontent.com/114596641/225994006-308f5bb5-6e0c-4201-9b1e-8f9983aaf4ee.png)
![2023-03-17_19h39_06](https://user-images.githubusercontent.com/114596641/225994021-f07fa9f5-e8b8-4e7b-a7e8-a43d07ec9fcc.png)
![2023-03-17_19h39_31](https://user-images.githubusercontent.com/114596641/225994034-f074c477-f838-4015-8f93-954af9654e40.png)
![2023-03-17_19h39_44](https://user-images.githubusercontent.com/114596641/225994048-27dae8a5-abff-4f21-8c29-31a3825a6f56.png)
![2023-03-17_19h40_37](https://user-images.githubusercontent.com/114596641/225994053-c2211d91-e406-4714-95e5-acd21f00edf4.png)
![2023-03-17_19h41_25](https://user-images.githubusercontent.com/114596641/225994069-54d01ee3-8a3a-4c7a-a048-b3729f893037.png)

![2023-03-17_19h42_44](https://user-images.githubusercontent.com/114596641/225994127-1f4f9e58-5cc7-435e-a168-3b4d0af1ab20.png)

