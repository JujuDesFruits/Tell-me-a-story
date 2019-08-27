# MongoDB - Info

[MongoDB](https://www.mongodb.com/) est la base de donnée utilisé au cours de ce projet. Il s'agit d'une base de donnée NoSQL ayant pour objectif de donner plus de souplesse d'évolution du projet.
Cette base tourne sur le port 27017 pour l'application, et est sécurisé par authentification et la communication est chiffré par SSL.
De plus, une sauvegarde automatique quotidienne de la base de donnée vers un autre serveur est effectué pour préserver l'intégrité des données en cas de panne.

## Authentification
Pour se connecter à la base de donnée, une authentification est nécessaire. Pour obtenir des crédit veillez vous adressez à un administrateur.
Pour une connexion sur le serveur, utiliser la ligne ci dessous:
```
mongo -u <username> --authenticationDatabase story
```
dans le cas où il s'agirait de votre première connexion, veillez réinitialiser votre mot de passe chiffré de la manière suivante après sur le client mongo
```
use story;
db.changeUserPassword("<username>", "<newPassword>")
```

## Utilisation basique de MongoDB
pour lire les données
```
db.story.find({});
```
pour écrire des données
```
db.story.insertOne({key: "value"})
```
pour mettre à jour des données
```
db.story.update({id: "<object_ID>"}, {<new_document>}, {"multi": true});
```
pour supprimer des données
```
db.story.remove({id: "<object_ID>"}, {"multi": true})
```
Pour approfondir les manipulations possible sous mongoDB, je vous invite à lire [mon tutoriel](https://github.com/JujuDesFruits/Tell-me-a-story/blob/master/MongoDBTutorial_Trijean.pdf)
