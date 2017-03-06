program Garage;

uses crt;

//Il me manque tout le programme principal en revanche toutes les fonctions, les procedures et les vérifications sont faites

{ALGO Garage
//BUT Créer et afficher un ensemble de garages contenant entre 6 et 15 voitures
//ENTREE infos sur chaques voitures
//SORTIE infos de toutres les voitures ainsi que leurs garages

type adresse=enregistrement
	numero:ENTIER
	voie:CHAINE
	CP:ENTIER
	ville:CHAINE
	pays:CHAINE
	numero_de_tel:ENTIER
	email:CHAINE
FINENREGISTREMENT

type date=enregistrement
	jour:ENTIER
	mois:ENTIER
	annee:ENTIER
FINENREGISTREMENT
type marques_voiture(audi,ford,opel,BMW,toyota)

type energie_voiture(essence, diesel, GPL, electrique,hybride)

type voitures=enregistrement
	marque:marques_voiture
	modele:CHAINE
	energie:energie_voiture
	Puissance_Fiscal:ENTIER
	Puissance_DYN:ENTIER
	Couleur:CHAINE
	Options:CHAINE
	Annee_du_modele:ENTIER
	Prix_du_modele:ENTIER
	Cote_Argus
	Date_de_mise_en_circulation:date
	Age:ENTIER
	plaque:CHAINE
FINENREGISTREMENT

type liste_voiture=tableau [6..15] DE voitures

type garage=enregistrement
	nom:CHAINE
	ad:adresse
	contenu:liste_voiture
FINENREGISTREMENT

type ensemble_de_garage:tableau[1..2] DE garage

fonction lettre_incluse(lettre:caractere,mot:chaine):booleen
//BUT vérifier si une lettre est incluse dans un mot
//ENTREE le mot et la lettre
//SORTIE vrai ou faux

VAR
	res:booleen //res sera le booleen renvoyé
	i:entier //i sert à vérifier chaque lettre du mot
DEBUT
	//initialisation des variables
	res<-FAUX
	i<-1
	//tant que la lettre n'est pas trouver et que tout le mot n'est pas parcouru
	TANT QUE res=FAUX ET i<=longueur(mot) FAIRE
		//on vérifie si en i la lettre du mot est la même que celle choisi
		SI mot[i]=lettre ALORS
			res<-VRAI //si c'est le cas res devient vrai
		FINSI
		i<-i+1
	FINTANTQUE
	lettre_incluse<-res//on renvoie res
FINFONCTION

procedure creation_garage(var G:garage)
//BUT créer un garage
//ENTREE informations sur le garage
//SORTIE le garage

VAR
	//toutes ces variables servent de stockage afin de vérifier qu'elles sont valide
	nom:CHAINE
	numero,CP,numero_de_tel:ENTIER
	voie,ville,pays,email:CHAINE
DEBUT
	REPETER
		ECRIRE"Veuillez entrer le nom du garage :"
		LIRE nom
	JUSQU'A nom<>''
	G.nom<-nom
	REPETER
		ECRIRE"Veuillez entrer le numéro de l'adresse du garage :"
		LIRE numero
	JUSQU'A numero>0
	G.ad.numero<-numero
	REPETER
		ECRIRE"Veuillez entrer la voie de l'adresse du garage :" 
		LIRE voie
	JUSQU'A voie<>''
	G.ad.voie<-voie
	REPETER
		ECRIRE"Veuillez entrer la ville de l'adresse du garage :"
		LIRE ville
	JUSQU'A ville<>''
	G.ad.ville<-ville
	REPETER
		ECRIRE"Veuillez entrer le pays de l'adresse du garage :"
		LIRE pays
	JUSQU'A pays<>''
	G.ad.pays<-pays
	REPETER
		ECRIRE"Veuillez entrer le code postal du garage :"
		LIRE CP
	JUSQU'A CP<100000 ET CP>0
	G.ad.CP<-CP
	REPETER
		ECRIRE"Veuillez entrer le numéro de téléphone du garage :"
		LIRE numero_de_tel
	JUSQU'A numero_de_tel>0
	G.ad.numero_de_tel<-numero_de_tel
	REPETER
		ECRIRE"Veuillez entrer l'adresse mail du garage :"
	JUSQU'A lettre_incluse('@',email) ET lettre_incluse('.',email)
FINPROCEDURE

procedure creation_voitures(var V:voitures)
//BUT créer une voitures
//ENTREE informations de la voitures
//SORTIE la voiture
VAR
	marque:marques_voiture
	modele,couleur,Options,plaque:CHAINE
	energie:energie_voiture
	Puissance_Fiscal,Puissance_DYN,Annee_du_modele,Prix_du_modele,Cote_Argus,Age,stock:ENTIER
	Date_de_mise_en_circulation:date
DEBUT
	REPETER
		ECRIRE"Veuillez entrer la marque de la voiture :"
		LIRE marque
	JUSQU'A marque<>''
	V.marque<-marque
	REPETER
		ECRIRE"Veuillez entrer la modele de la voiture :"
		LIRE modele
	JUSQU'A modele<>''
	V.modele<-modele
	REPETER
		ECRIRE"Veuillez entrer l'énergie de la voiture :"
		LIRE energie
	JUSQU'A energie<>''
	V.energie<-energie
	REPETER
		ECRIRE"Veuillez entrer la puissance fiscale de la voiture :"
		LIRE Puissance_Fiscal
	JUSQU'A Puissance_Fiscal>0
	V.Puissance_Fiscal<-Puissance_Fiscal
	REPETER
		ECRIRE"Veuillez entrer la puissance dynamique de la voiture :"
		LIRE Puissance_DYN
	JUSQU'A Puissance_DYN>0 ET Puissance_DYN>Puissance_Fiscal
	V.Puissance_DYN<-Puissance_DYN 
	REPETER
		ECRIRE"Veuillez entrer la couleur de la voiture :"
		LIRE couleur
	JUSQU'A couleur<>''
	V.couleur<-couleur
	REPETER
		ECRIRE"Veuillez entrer les options de la voiture en séparant chaque options par un # ou aucune si il n'y a aucune options:"
		LIRE Options
	JUSQU'A Options<>''
	V.Options<-Options
	REPETER
		ECRIRE"Veuillez entrer le prix du modèle :"
		LIRE Prix_du_modele
	JUSQU'A Prix_du_modele>0
	V.Prix_du_modele<-Prix_du_modele
	REPETER
		ECRIRE"Veuillez entrer 'année du modèle :"
		LIRE Annee_du_modele
	JUSQU'A Annee_du_modele>0 ET Annee_du_modele<2017
	V.Annee_du_modele<-Annee_du_modele
	REPETER
		ECRIRE"Veuillez entrer la marque de la voiture :"
		LIRE marque
	JUSQU'A marque<>''
	V.marque<-marque
	REPETER
		ECRIRE"Veuillez entrer l'année de mise en circulation de la voiture "
		LIRE Date_de_mise_en_circulation.annee
	JUSQU'A Date_de_mise_en_circulation.annee>Annee_du_modele ET Date_de_mise_en_circulation.annee<=2017
	REPETER
		ECRIRE"Veuillez entrer le mois de mise en circulation de la voiture :"
		LIRE Date_de_mise_en_circulation.mois
	JUSQU'A Date_de_mise_en_circulation.mois>0 ET Date_de_mise_en_circulation<13
	CAS Date_de_mise_en_circulation.mois PARMIS
		1:REPETER
			ECRIRE"Veuillez entre le jour de mise en circulation de la voiture :"
			LIRE Date_de_mise_en_circulation.jour
		  JUSQU'A Date_de_mise_en_circulation.jour>0 ET Date_de_mise_en_circulation.jour<32
		2:SI Date_de_mise_en_circulation.annee MOD 4=0 ET Date_de_mise_en_circulation.annee MOD 100<>0 OU Date_de_mise_en_circulation.annee MOD 400=0
			REPETER
				ECRIRE"Veuillez entrer le jour de mise en circulation de la voiture :"
				LIRE Date_de_mise_en_circulation.jour
			JUSQU'A Date_de_mise_en_circulation.jour>0 ET Date_de_mise_en_circulation.jour<=29
		  SINON
		    REPETER
				ECRIRE"Veuillez entrer le jour de mise en circulation de la voiture :"
				LIRE Date_de_mise_en_circulation.jour
			JUSQU'A Date_de_mise_en_circulation.jour>0 ET Date_de_mise_en_circulation.jour<=28
		  FINSI
		3:REPETER
			ECRIRE"Veuillez entre le jour de mise en circulation de la voiture :"
			LIRE Date_de_mise_en_circulation.jour
		  JUSQU'A Date_de_mise_en_circulation.jour>0 ET Date_de_mise_en_circulation.jour<32
		4:REPETER
			ECRIRE"Veuillez entre le jour de mise en circulation de la voiture :"
			LIRE Date_de_mise_en_circulation.jour
		  JUSQU'A Date_de_mise_en_circulation.jour>0 ET Date_de_mise_en_circulation.jour<31
		5:REPETER
			ECRIRE"Veuillez entre le jour de mise en circulation de la voiture :"
			LIRE Date_de_mise_en_circulation.jour
		  JUSQU'A Date_de_mise_en_circulation.jour>0 ET Date_de_mise_en_circulation.jour<32
		6:REPETER
			ECRIRE"Veuillez entre le jour de mise en circulation de la voiture :"
			LIRE Date_de_mise_en_circulation.jour
		  JUSQU'A Date_de_mise_en_circulation.jour>0 ET Date_de_mise_en_circulation.jour<31
		7:REPETER
			ECRIRE"Veuillez entre le jour de mise en circulation de la voiture :"
			LIRE Date_de_mise_en_circulation.jour
		  JUSQU'A Date_de_mise_en_circulation.jour>0 ET Date_de_mise_en_circulation.jour<32
		8:REPETER
			ECRIRE"Veuillez entre le jour de mise en circulation de la voiture :"
			LIRE Date_de_mise_en_circulation.jour
		  JUSQU'A Date_de_mise_en_circulation.jour>0 ET Date_de_mise_en_circulation.jour<32
		9:REPETER
			ECRIRE"Veuillez entre le jour de mise en circulation de la voiture :"
			LIRE Date_de_mise_en_circulation.jour
		  JUSQU'A Date_de_mise_en_circulation.jour>0 ET Date_de_mise_en_circulation.jour<31
		10:REPETER
			ECRIRE"Veuillez entre le jour de mise en circulation de la voiture :"
			LIRE Date_de_mise_en_circulation.jour
		  JUSQU'A Date_de_mise_en_circulation.jour>0 ET Date_de_mise_en_circulation.jour<32
		11:REPETER
			ECRIRE"Veuillez entre le jour de mise en circulation de la voiture :"
			LIRE Date_de_mise_en_circulation.jour
		  JUSQU'A Date_de_mise_en_circulation.jour>0 ET Date_de_mise_en_circulation.jour<31
		12:REPETER
			ECRIRE"Veuillez entre le jour de mise en circulation de la voiture :"
			LIRE Date_de_mise_en_circulation.jour
		  JUSQU'A Date_de_mise_en_circulation.jour>0 ET Date_de_mise_en_circulation.jour<32
	FINCASPARMIS
	V.Date_de_mise_en_circulation.annee<-Date_de_mise_en_circulation.annee
	V.Date_de_mise_en_circulation.mois<-Date_de_mise_en_circulation.mois
	V.Date_de_mise_en_circulation.jour<-Date_de_mise_en_circulation.jour
	Age<-Date_de_mise_en_circulation.annee-Annee_du_modele
	V.Age<-Age
	CAS Age PARMIS
		1:Cote_Argus<-V.Prix_du_modele*(1-(25/100))
		  V.Cote_Argus<-Cote_Argus
		2:Cote_Argus<-V.Prix_du_modele*(1-(25/100))
		  Cote_Argus<-Cote_Argus*(1-(10/100))
		  V.Cote_Argus<-Cote_Argus
		3:Cote_Argus<-V.Prix_du_modele*(1-(25/100))
		  Cote_Argus<-Cote_Argus*(1-(10/100))
		  Cote_Argus<-Cote_Argus*(1-(10/100))
		  V.Cote_Argus<-Cote_Argus
		PARDEFAULT:SI Age=0 ALORS
						V.Cote_Argus<-V.Prix_du_modele
				   SINON
						Cote_Argus<-V.Prix_du_modele*(1-(25/100))
						Cote_Argus<-Cote_Argus*(1-(10/100))
						Cote_Argus<-Cote_Argus*(1-(10/100))
				   FINSI
	FINCASPARMIS
	stock<-ALEATOIRE(65,90)
	V.plaque<-chr(stock)
	stock<-ALEATOIRE(65,90)
	V.plaque<-V.plaque+chr(stock)
	stock<-ALEATOIRE(65,90)
	V.plaque<-V.plaque+chr(stock)
	V.plaque<-V.plaque+'-'
	stock<-ALEATOIRE(65,90)
	V.plaque<-V.plaque+chr(stock)
	stock<-ALEATOIRE(65,90)
	V.plaque<-V.plaque+chr(stock)
	V.plaque<-V.plaque+'-'
	stock<-ALEATOIRE(48,57)
	V.plaque<-V.plaque+chr(stock)
	stock<-ALEATOIRE(48,57)
	V.plaque<-V.plaque+chr(stock)
FINPROCEDURE

VAR
	G:ensemble_de_garage
DEBUT
	
FIN
}