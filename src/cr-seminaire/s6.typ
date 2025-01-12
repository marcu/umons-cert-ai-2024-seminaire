= Séminaire 6

== Intelligence artificielle et détection de fraude


Le dernier séminaire a été donné par Olivier Caelen. Monsieur Caelen a travaillé pour Worldline qui s'occupe de la plupart des transactions bancaires en Belgique.

Worldline utilise le machine learning afin de détecter des fraudes dans le contexte des transactions bancaires.

Mais qu'est-ce qu'une fraude ?

La fraude se définit comme l'utilisation d'une carte alors que son propriétaire ne le veut pas. Cela peut se faire via du :

- skimming (utilisation d'un dispositif électronique illégal pour capturer les informations de cartes bancaires)
- phishing (méthode reposant sur la supercherie pour acquérir des informations sensibles, comme des noms d'utilisateur, des mots de passe et des numéros de carte de crédit)
- vol de données.

La lutte peut se faire de manière "real time" si le temps de traitement de l'information fait moins de 200 ms. Dans ce cas, il est possible de bloquer la transaction frauduleuse. Sinon, la lutte se fait de manière "near real-time" avec un temps de calcul qui peut prendre quelques minutes. Dans ce cas, la transaction frauduleuse ne peut être bloquée mais les suivantes le seront.

La lutte contre la fraude "real time" est très délicate à mettre en place car il ne faut pas qu'elle soit trop stricte, en effet bloquer une transaction non-frauduleuse peut être très gênant pour le client et donc pour la banque.

Une caractéristique du problème de la détection de la fraude est que c'est un problème "highly unbalanced", c'est-à-dire que les classes des données sont inégalement représentées : une fraude apparaît moins de 1 fois sur 1000.

Pour ce type de problème, il est préférable d'utiliser l'accuration plutôt que la précision pour évaluer les modèles.

L'accuration est le rapport entre le nombre de transactions bien classées et le nombre total de transactions alors que la précision est le rapport entre le nombre de transactions bien classées et le nombre de transactions classées comme frauduleuses.

De plus, pour les problèmes "highly unbalanced", les méthodes d'undersampling ou d'oversampling peuvent être utilisées pour équilibrer les classes lors de l'entraînement des modèles.

Cette intervention a été assez technique mais très enrichissante. Elle m'a permis de mieux comprendre les métriques qui peuvent être utilisées pour évaluer un modèle et l'importance du choix de ces métriques.

Ca m'a aussi permis d'avoir un exemple concret de l'utilité du machine learning dans la société en permettant de lutter contre la fraude.


