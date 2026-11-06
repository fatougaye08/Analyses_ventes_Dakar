# Analyse des ventes 2025 – Teranga Market (Dakar)

Projet d'analyse de données de bout en bout : nettoyage d'un fichier de ventes brut, analyse en SQL et en Python, tableau de bord et recommandations pour la direction commerciale.

> Les données sont **simulées** : Teranga Market est une chaîne fictive de 6 boutiques (Plateau, Médina, Parcelles Assainies, Pikine, Rufisque, Almadies). Des erreurs ont été ajoutées volontairement au fichier brut pour reproduire des conditions réelles.

## Question métier
Où et quand la chaîne réalise-t-elle son chiffre d'affaires, et quelles actions concrètes peut-on en tirer (stocks, personnel, paiement, boutiques) ?

## Contenu
| Fichier | Rôle |
|---|---|
| `data/ventes_brutes_2025.csv` | ~28 900 lignes brutes avec erreurs |
| `data/boutiques.csv`, `data/produits.csv` | Tables de référence |
| `analyse_ventes.ipynb` | Notebook : audit, nettoyage, SQL, graphiques, insights |
| `analyse_ventes.py` | Même analyse en script Python |
| `requetes.sql` | Requêtes SQL (agrégations, jointures, CTE, fonction de fenêtrage) |
| `figures/` | Graphiques exportés |

## Nettoyage réalisé
- 426 doublons supprimés
- Dates harmonisées (deux formats : AAAA-MM-JJ et JJ/MM/AAAA)
- Codes boutique normalisés (`b01`, `B3`, `B-06` → `B01`, `B03`, `B06`)
- 11 libellés de paiement ramenés à 4 (`cash`, `Especes` → Espèces ; `OM` → Orange Money…)
- Prix contenant « FCFA » convertis ; 91 prix aberrants (×100) corrigés par le prix catalogue
- 278 lignes sans quantité supprimées ; 92 retours (quantités négatives) isolés

## Principaux résultats
- **254 M FCFA** de chiffre d'affaires, 28 096 ventes, panier moyen d'environ 9 000 FCFA
- L'**alimentation** représente 52 % du CA ; ses ventes journalières augmentent de **80 %** dans les deux semaines précédant la Tabaski
- Le **mobile money** (Wave + Orange Money) passe de 35 % des ventes en janvier à 59 % en décembre
- Le CA journalier est **35 % plus élevé le week-end**
- Plateau réalise le plus gros CA, mais rapporté à la surface, Pikine est la boutique la plus performante et Rufisque la moins performante

## Recommandations
1. Anticiper les stocks alimentaires trois semaines avant la Tabaski
2. Renforcer les équipes en caisse le week-end
3. Négocier les commissions mobile money et lancer une offre de fidélité liée au paiement mobile
4. Prioriser un plan d'action (assortiment, visibilité) pour Rufisque

## Outils
Python (pandas, matplotlib), SQL (SQLite), Excel/Power BI pour le tableau de bord.

## Lancer le projet
```bash
pip install pandas matplotlib jupyter
jupyter notebook analyse_ventes.ipynb
```
Ou importez le dossier dans Google Colab.
