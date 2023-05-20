#Création de la table
DROP TABLE IF EXISTS dw_services;
CREATE TABLE dw_services(
	YEAR YEAR NOT NULL COMMENT'2000->2017',
    COUNTRY VARCHAR(100) NOT NULL,
    GRANULARITY VARCHAR(10) NOT NULL COMMENT'Total, Urban, Rural',
    BASIC VARCHAR(20) COMMENT'Population using at least basic drinking-water services (%)',
    SAFELY_MANAGED VARCHAR(20) COMMENT'Population using safely managed drinking-water services (%)',
    PRIMARY KEY(COUNTRY,YEAR,GRANULARITY)
    );
#Importation des données
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DAN-P8-donnees/BasicAndSafelyManagedDrinkingWaterServices.csv'
	INTO TABLE dw_services
	FIELDS TERMINATED BY ',' 
    OPTIONALLY ENCLOSED BY '"' 
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS; 

#Création de la table
DROP TABLE IF EXISTS region;    
CREATE TABLE region(
	CONTINENT VARCHAR(100) NOT NULL, 
	COUNTRY VARCHAR(100) NOT NULL,
    PRIMARY KEY(COUNTRY)
    );
#Importation des données
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DAN-P8-donnees/RegionCountry.csv'
	INTO TABLE region
	FIELDS TERMINATED BY ',' 
    OPTIONALLY ENCLOSED BY '"' 
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS;


#Création de la table
DROP TABLE IF EXISTS population;     
CREATE TABLE population(
	COUNTRY VARCHAR(100) NOT NULL,
    GRANULARITY VARCHAR(100) NOT NULL,
    YEAR YEAR NOT NULL,
    POPULATION FLOAT,
    PRIMARY KEY(COUNTRY,YEAR,GRANULARITY)
    );
#Importation des données
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DAN-P8-donnees/Population.csv'
	INTO TABLE population
	FIELDS TERMINATED BY ',' 
    OPTIONALLY ENCLOSED BY '"' 
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS;
#Correction du nom 'Republic of North Macedonia' en 'North Macedonia' pour cohérence entre les tables
UPDATE population
SET COUNTRY = REPLACE(COUNTRY, 'North Macedonia','Republic of North Macedonia')
WHERE COUNTRY LIKE 'North Macedonia';

   
#Création de la table
DROP TABLE IF EXISTS mortality;
CREATE TABLE mortality(
	YEAR YEAR NOT NULL,
    COUNTRY VARCHAR(100) NOT NULL,
    GRANULARITY VARCHAR(10) NOT NULL,
	MORTALITY_RATE_UNSAFE_WATER VARCHAR(20) COMMENT'Mortality rate attributed to exposure to unsafe WASH services',
    DEATHS VARCHAR(20) COMMENT'Number of deaths attributed to exposure to unsafe WASH services',
    PRIMARY KEY(COUNTRY,YEAR,GRANULARITY)
    );
#Importation des données
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DAN-P8-donnees/MortalityRateAttributedToWater.csv'
	INTO TABLE mortality
	FIELDS TERMINATED BY ',' 
    OPTIONALLY ENCLOSED BY '"' 
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS;


#Création de la table 
DROP TABLE IF EXISTS political_stability;    
CREATE TABLE political_stability(
	COUNTRY VARCHAR(100) NOT NULL,
    YEAR YEAR NOT NULL,
    STABILITY FLOAT,
    GRANULARITY VARCHAR(10) NOT NULL,
    PRIMARY KEY(COUNTRY,YEAR)
    );
#Importation des données  
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DAN-P8-donnees/PoliticalStability.csv'
	INTO TABLE political_stability
	FIELDS TERMINATED BY ',' 
    OPTIONALLY ENCLOSED BY '"' 
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS; 
#Correction du nom 'Republic of North Macedonia' en 'North Macedonia' pour cohérence entre les tables
UPDATE political_stability
SET COUNTRY = REPLACE(COUNTRY, 'North Macedonia','Republic of North Macedonia')
WHERE COUNTRY LIKE 'North Macedonia';


#Création de la table    
DROP TABLE IF EXISTS surface_area;
CREATE TABLE surface_area(
	#YEAR 2020,
    COUNTRY VARCHAR(100) NOT NULL,
    SURFACE VARCHAR(20) COMMENT "Superficie pays en 2020",
    PRIMARY KEY(COUNTRY)
    );
#Importation des données 
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DAN-P8-donnees/P8_surface_area.csv'
	INTO TABLE surface_area
	FIELDS TERMINATED BY ';' 
    OPTIONALLY ENCLOSED BY '"' 
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS; 
#Correction des noms de pays pour cohérence entre les tables    
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, 'Bahamas, The','Bahamas')
WHERE COUNTRY LIKE 'Bahamas, The';
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, 'North Macedonia','Republic of North Macedonia')
WHERE COUNTRY LIKE 'North Macedonia';
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, 'Bolivia','BOLIVIA (PLURINATIONAL STATE OF)')
WHERE COUNTRY LIKE 'Bolivia';
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, 'United Kingdom','UNITED KINGDOM OF GREAT BRITAIN AND NORTHERN IRELAND')
WHERE COUNTRY LIKE 'United Kingdom';
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, 'United States','UNITED STATES OF AMERICA')
WHERE COUNTRY LIKE 'United States';
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, 'Congo, Dem. Rep.','DEMOCRATIC REPUBLIC OF THE CONGO')
WHERE COUNTRY LIKE 'Congo, Dem. Rep.';
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, 'Congo, Rep.','CONGO')
WHERE COUNTRY LIKE 'Congo, Rep.'; 
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, 'Egypt, Arab Rep.','EGYPT')
WHERE COUNTRY LIKE 'Egypt, Arab Rep.';
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, 'Hong Kong SAR, China','CHINA, HONG KONG SAR')
WHERE COUNTRY LIKE 'Hong Kong SAR, China';
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, 'Macao SAR, China','CHINA, MACAO SAR')
WHERE COUNTRY LIKE 'Macao SAR, China';
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "Korea, Dem. People's Rep.","DEMOCRATIC PEOPLE'S REPUBLIC OF KOREA")
WHERE COUNTRY LIKE "Korea, Dem. People's Rep.";
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "Iran, Islamic Rep.","IRAN (ISLAMIC REPUBLIC OF)")
WHERE COUNTRY LIKE "Iran, Islamic Rep.";
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "Gambia, The","GAMBIA")
WHERE COUNTRY LIKE "Gambia, The";
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "Kyrgyz Republic","KYRGYZSTAN")
WHERE COUNTRY LIKE "Kyrgyz Republic";
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "Lao PDR","LAO PEOPLE'S DEMOCRATIC REPUBLIC")
WHERE COUNTRY LIKE "Lao PDR";
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "Micronesia, Fed. Sts.","MICRONESIA (FEDERATED STATES OF)")
WHERE COUNTRY LIKE "Micronesia, Fed. Sts.";
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "Korea, Rep.","REPUBLIC OF KOREA")
WHERE COUNTRY LIKE "Korea, Rep.";
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "Moldova","REPUBLIC OF MOLDOVA")
WHERE COUNTRY LIKE "Moldova";
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "St. Kitts and Nevis","SAINT KITTS AND NEVIS")
WHERE COUNTRY LIKE "St. Kitts and Nevis";
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "St. Lucia","SAINT LUCIA")
WHERE COUNTRY LIKE "St. Lucia";
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "St. Vincent and the Grenadines","SAINT VINCENT AND THE GRENADINES")
WHERE COUNTRY LIKE "St. Vincent and the Grenadines";
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "St. Martin (French part)","SAINT-MARTIN (FRENCH PART)")
WHERE COUNTRY LIKE "St. Martin (French part)";
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "Sint Maarten (Dutch part)","SINT MAARTEN  (DUTCH PART)")
WHERE COUNTRY LIKE "Sint Maarten (Dutch part)";
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "Slovak Republic","SLOVAKIA")
WHERE COUNTRY LIKE "Slovak Republic";
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "Turkiye","TURKEY")
WHERE COUNTRY LIKE "Turkiye";
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "Tanzania","UNITED REPUBLIC OF TANZANIA")
WHERE COUNTRY LIKE "Tanzania";
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "Virgin Islands (U.S.)","UNITED STATES VIRGIN ISLANDS")
WHERE COUNTRY LIKE "Virgin Islands (U.S.)";
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "Venezuela, RB","VENEZUELA (BOLIVARIAN REPUBLIC OF)")
WHERE COUNTRY LIKE "Venezuela, RB";
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "Vietnam","VIET NAM")
WHERE COUNTRY LIKE "Vietnam";
UPDATE surface_area
SET COUNTRY = REPLACE(COUNTRY, "Yemen, Rep.","YEMEN")
WHERE COUNTRY LIKE "Yemen, Rep.";