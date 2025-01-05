= Séminaire 6

== Intelligence artificielle et détection de fraude

Le 12 novembre 2024,
#link("https://www.linkedin.com/in/oliviercaelen/")[Olivier Caelen], ancien
employé de l'équipe R&D chez
#link("https://www.linkedin.com/company/worldlineglobal/")[Worldline], a
présenté cette entreprise spécialisée dans le paiement. Worldline, anciennement
connue sous le nom de Banksys, est responsable de 95% des transactions en
Belgique, soit environ 30 millions de transactions par jour. Grâce à son
expertise et à sa technologie avancée, Worldline offre des solutions fiables et
sécurisées pour les transactions bancaires.

La fraude se produit lorsqu'une personne effectue un paiement en usurpant
l'identité de quelqu'un d'autre. Il existe différents types de fraude, tels que
le skimming, le phishing et le vol de données. L'objectif est de minimiser les
faux positifs dans la détection de la fraude en tenant compte qu'un faux positif
a beaucoup plus d'impact pour le client.

Le machine learning simplifie grandement la détection de la fraude et facilite
la protection des consommateurs et des marchands.

L'architecture d'un système de détection de fraude comporte deux chemins
différents. Premièrement, la détection de fraude peut être effectuée avant
l'autorisation d'une transaction en moins de 100 ms. Ce chemin utilise un
ensemble de données plus petit et bloque strictement une carte en cas de fraude
présumée. Deuxièmement, la détection peut être effectuée après l'autorisation en
temps réel, où les transactions de débit et de crédit sont traitées avec un
ensemble de données plus grand. Ce chemin donne plus de temps pour traiter les
données et bloque une carte ou produit une alerte en cas de fraude détectée.

Le machine learning est utile pour la détection de fraude, qui est un problème
d'apprentissage avec des ensembles de données déséquilibrés. Les modèles sont
fortement déséquilibrés, avec environ 1 transaction frauduleuse pour 1000
transactions valides. Pour rééquilibrer les ensembles de données, des techniques
d'undersampling ou d'oversampling peuvent être utilisées.

La technique "EasyEnsemble" est une méthode développée par Worldline pour
aborder les problèmes de classification avec des ensembles de données
déséquilibrés, comme c'est le cas pour la détection de fraude. Elle est
particulièrement utile lorsque le nombre de cas positifs
(_transactions frauduleuses_) est nettement inférieur au nombre de cas négatifs
(_transactions valides_).

EasyEnsemble est une méthode d'ensemble, ce qui signifie qu'elle crée plusieurs
modèles d'apprentissage automatique à partir de sous-ensembles de données
rééchantillonnés et les combine pour obtenir des résultats plus précis et
robustes. Cette approche permet de réduire le surapprentissage et d'améliorer la
performance globale du modèle.

Dans le cadre d'EasyEnsemble, plusieurs sous-ensembles sont créés en utilisant
une technique d'undersampling pour les cas négatifs (_transactions valides_) tout
en conservant tous les cas positifs (_transactions frauduleuses_). Ensuite, pour
chaque sous-ensemble, un classificateur est entraîné.

Une fois que tous les classificateurs ont été entraînés sur leurs sous-ensembles
respectifs, ils sont combinés pour former un modèle d'ensemble.

L'implémentation d'EasyEnsemble est facilitée par l'utilisation de packages
open-source, qui permettent de mettre en place cette technique sans avoir à tout
recoder.

Pour réduire le nombre de faux positifs, le clustering peut être appliqué en
regroupant les consommateurs en différentes catégories telles que les
transactions en ligne, les transactions en face à face et les transactions
mixtes. Les variables telles que le nombre de transactions par jour, l'âge et le
genre peuvent être utilisées pour déterminer les groupes de consommateurs.

Cette présentation fût dense et intéressante. La détection de fraude est un
sujet important et complexe, et le machine learning joue un rôle crucial dans
l'amélioration de la précision et de l'efficacité de ces systèmes.
