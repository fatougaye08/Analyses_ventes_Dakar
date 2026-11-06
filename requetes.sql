-- Requêtes d'analyse – Teranga Market 2025 (SQLite)
-- Tables : ventes (données nettoyées), boutiques, produits

-- Q1 – Chiffre d'affaires, nombre de ventes et panier moyen par boutique
SELECT b.nom AS boutique,
       SUM(v.montant)                    AS ca_fcfa,
       COUNT(*)                          AS nb_ventes,
       ROUND(AVG(v.montant))             AS panier_moyen,
       ROUND(SUM(v.montant) * 1.0 / b.surface_m2) AS ca_par_m2
FROM ventes v JOIN boutiques b ON b.boutique_id = v.boutique_id
GROUP BY b.nom ORDER BY ca_fcfa DESC;

-- Q2 – Part de chaque catégorie dans le chiffre d'affaires
SELECT categorie,
       SUM(montant) AS ca_fcfa,
       ROUND(100.0 * SUM(montant) / (SELECT SUM(montant) FROM ventes), 1) AS part_pct
FROM ventes GROUP BY categorie ORDER BY ca_fcfa DESC;

-- Q3 – Top 5 des produits par chiffre d'affaires (fonction de fenêtrage)
WITH ca AS (SELECT nom_produit, categorie, SUM(montant) AS ca_fcfa FROM ventes GROUP BY nom_produit)
SELECT RANK() OVER (ORDER BY ca_fcfa DESC) AS rang, nom_produit, categorie, ca_fcfa
FROM ca ORDER BY rang LIMIT 5;

-- Q4 – Évolution trimestrielle de la part du mobile money (Wave + Orange Money), en % du nombre de ventes
SELECT 'T' || ((CAST(strftime('%m', date) AS INTEGER) + 2) / 3) AS trimestre,
       ROUND(100.0 * SUM(mode_paiement IN ('Wave', 'Orange Money')) / COUNT(*), 1) AS part_mobile_money_pct,
       ROUND(100.0 * SUM(mode_paiement = 'Espèces') / COUNT(*), 1)                 AS part_especes_pct
FROM ventes GROUP BY trimestre ORDER BY trimestre;

