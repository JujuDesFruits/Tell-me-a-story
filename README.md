# Bienvenue sur le projet Open-source Tell-me-a-story

Ci-joint la liste des onglet pour se retrouver dans le projet:

- [Wiki/Documentation](https://github.com/JujuDesFruits/Tell-me-a-story/wiki)
- [site internet](http://tell-me-a-story.onthewifi.com/) *en cours de réalisation*
- [play store](#) *en cours de réalisation*
- [apple store](#) *en cours de réalisation*
- [Board des taches à réaliser](https://github.com/JujuDesFruits/Tell-me-a-story/projects/1)

Pour accéder au server, veuillez transmettre votre clé publique rsa à un admin qu'il puisse vous rajouter un accès ssh
**root@tell-me-a-story.onthewifi.com**

## Règles de modification du code

liste des étapes pour modifier du code:
cloner le projet (ou utiliser le ssh):
```
git clone https://github.com/JujuDesFruits/Tell-me-a-story.git
```
créer votre branche
```
git checkout -b "nom_de_la_branche"
```
faite vos modifications   
pousser les modifications sur la branche principale
```
git add .
git commit -m "nom_de_la_modification_explicite"
git push --set-upstream origin nom_de_la_branche
```
cliquer sur le lien proposer et completez le pull request.
**Ne pas s'auto merger à moins de réaliser un changement mineur**
Pour mettre votre branche à jour dans le cas d'un conflit avec la branche *master* réaliser cette étape:
```
git checkout master
git pull
git checkout "nom_de_la_branche"
git pull . master
```

## Images

Toute les images sont et doivent être libres de droit.

