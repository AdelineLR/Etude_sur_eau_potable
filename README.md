# Réaliser une étude sur l'eau potable et publier un tableau de bord
 
 _Projet réalisé dans le cadre de la formation Data Analyst d'OpenClassrooms_
 
## Compétences acquises
* Générer des graphiques adaptés aux types de données
* Synthétiser des résultats à destination d'un client
* Créer un tableau de bord répondant à des questions analytiques
* Analyser un besoin client pour formuler des questions analytiques


## Contexte 
L'association Drinking Water For All (DWFA), une ONG fictive, a besoin d'un tableau de bord présentant une vue globale de l’accès à l’eau potable dans le monde. Celui-ci permettra de choisir le pays à cibler en fonction de 3 domaines d’expertise :
  1. Création de services d’accès à l’eau potable ;
	2. Modernisation de services d’accès à l’eau déjà existants ;
	3. Consulting auprès d’administrations/gouvernements à propos des politiques d’accès à l’eau.

Pour ce projet, l'outil de data visualisation utilisé est Tableau Software. Le pré-traitement des données a été réalisé avec MySQL Worbench et la base de données MySQL a été connectée à Tableau via MySQL server.
[Lien vers l'histoire sur Tableau Public](https://public.tableau.com/shared/ZP8PSK492?:display_count=n&:origin=viz_share_link)

## Données
* BasicAndSafelyManagedDrinkingWaterServices.csv : Données sur l'accès et la qualité des services à l'eau potable par pays [Source WHO](https://apps.who.int/gho/data/node.main.WSHWATER?lang=en)
* MortalityRateAttributedToWater.csv : Données sur le taux de mortalité due à l'eau insalubre par pays [Source WHO](https://apps.who.int/gho/data/view.main.SDGWSHBOD392v?lang=en)
* PoliticalStability.csv : Données sur l'indicateur de stabilité politique par pays [Source WHO](http://www.fao.org/faostat/en/#data/FS)
* Population.csv : Données sur la population par pays [Source FAO](http://www.fao.org/faostat/en/#data/FS)
* RegionCountry.csv : Données sur les pays par régions OMS
* Surface_area.csv : Données sur la superficie par pays [Source World Bank](https://databank.worldbank.org/reports.aspx?source=2&series=AG.SRF.TOTL.K2&country=#)

## Fichiers
* LeRay_Adeline_1_Blueprint_022023.pdf : Blueprint du tableau de bord
* LeRay_Adeline_2_Mockup_022023.pdf : Mockup du tableau de bord
* LeRay_Adeline_3_Présentation_022023.pdf : Présentation du contexte, du pré-traitement des données et de la démarche de création du tableau de bord
* P8_Create_Table.sql : Script MySQL pour la création des tables, le chargement et le pré-traitement des données
* P8_Table_Country.sql : Script MySQL pour la création d'une liste exhaustive des pays pour les jointures (UNION DISTINCT) 
* P8_Jointure.sql : Script MySQL pour les jointures des tables
* P8_Eau_potable.twbx : Tableaux de bord et Histoire sous Tableau

