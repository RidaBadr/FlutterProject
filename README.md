# FlutterProject

MIAGED est une plateforme de vente en ligne proposant une variété de produits pour (Homme, Femme, Enfant), permettant aux utilisateurs d'ajouter ou de retirer des articles de leur panier, de modifier leur profil et de sauvegarder ces informations dans une base de données Firebase.

# Informations de connexion : 
  Login : badr@miage.ma
  Mot de passe : azerty

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
