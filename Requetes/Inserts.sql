

insert into Membre values(
    1, 
    'Duchampt',
    'Jean-luc', 
	'jl@duchampt.com',
    1, 
    '01/01/1950 00:00:00', 
    hextoraw('453d7a34'), 
    '236, ter', 
    'rue de la ganti�re',
    '63100',
    'Clermont-Ferrand',
    'FR',
	'Duchamptjl',
	'Duchamptjl',
	null
	);



insert into Membre values(2, 'Ergot','Fran�oise','ergot.f@free.fr', 1, '01/01/1952 00:00:00', hextoraw('453d7a34') ,'2', 'rue de l''h�tel de ville','63100', 'Clermont-Ferrand', 'FR','Ergotf', 'Ergotf',null);
insert into Membre values(3, 'Dubois','Alain','Alain.Dubois9988@gmail.com', 0, '01/01/1953 00:00:00', hextoraw('453d7a34') ,'3, ter', 'rue des amandiers','12100', 'Millau', 'FR','Duboisa', 'Duboisa',null);
insert into Membre values(4, 'Dupont', 'Amandine','Amandine.Dupont@mail.ru', 0, '01/01/1954 00:00:00', hextoraw('453d7a34') ,'3, ter', 'rue de la coupole','12100', 'Millau', 'FR','Duponta', 'Duponta',null);
insert into Membre values(5, 'Arnaud', 'R�mi','Remi.Arnaud9966@yahoo.fr', 1, '01/01/1955 00:00:00', hextoraw('453d7a34'), '25', 'rue des cerisiers','12100', 'Millau', 'FR','Arnaudr', 'Arnaudr',null);
insert into Membre values(6,'Marquet','Fran�oise','Francoisedsmarquet@laposte.fr',1,'01/01/1956 00:00:00',hextoraw('453d7a34'),'30', 'rue des renards','12100', 'Millau', 'FR', 'Marquetf', 'Marquetf',null);
insert into Membre values(7, 'Antonini', 'Florence','Florence.Antonini@gmx.de',0,'01/01/1957 00:00:00', hextoraw('453d7a34'),'40', 'rue des b�gonias','12100','Millau','FR','Antoninif', 'Antoninif',null);
insert into Membre values(8, 'Leroy','Jean-Fran�ois','LeroyJF@yahoo.fr',0,'01/01/1958 00:00:00', hextoraw('453d7a34'),'45', 'rue des tilleuls','12100','Millau','FR', 'Leroyjf', 'Leroyjf',null);
insert into Membre values(9,'Desmartins', 'Jean-Luc','DesmartinsJL@gmail.com', 0, '01/01/1959 00:00:00', hextoraw('453d7a34'),'57', 'rue des p�chers', '12100','Millau','FR', 'Desmartinsjl', 'Desmartinsjl',null);
insert into Membre values(10,'Desjardins','Sylvie','Desjardins.Sylvie01@orange.fr',0,'01/01/1960 00:00:00',hextoraw('453d7a34'),'52','Avenue de la R�publique','12100','Millau','FR','Desjardinss', 'Desjardinss',null);
insert into Membre values(11,'Ayrald','Etienne','Ayrald5601Etienne@yahoo.fr',0,'01/01/1961 00:00:00', hextoraw('453d7a34'), '63', 'rue de l''eaubonne', '12100', 'Millau', 'FR','Ayralde', 'Ayralde',null);
insert into Membre values(12, 'Milham','Ed',null,0,'01/01/1962 00:00:00', hextoraw('453d7a34'),'12 ter', 'rue de Birmingham', '12100', 'Millau', 'FR', 'Milhame', 'Milhame',null);
insert into Membre values(13, 'Tate','Jessica', null, 0, '01/01/1963', hextoraw('FFFFFFFF'), '11', 'rue des Rosiers', '12100', 'Millau','FR','Tatej','Tatej',null); 

commit;

insert into activite values(
			1,
			'Sortie A', 
			'ceci est la description de la sortie A',
			'A',
			'Point GPS A',
			'01/01/2021 00:00:00', 
			7.50,
			15.0,
			'motos',
			hextoraw('453d7a34'),
			1
			);
insert into activite values(2,'Sortie B', 'ceci est la description de la sortie B','B','Point GPS B','01/02/21 00:00:00', 7.50,15.0,'cyclos',hextoraw('453d7a34'),2);
insert into activite values(3,'Sortie C', 'ceci est la description de la sortie C','C','Point GPS C','01/08/21 00:00:00', 7.50,15.0,'solex',hextoraw('453d7a34'),5);
insert into activite values(4,'Sortie D', 'ceci est la description de la sortie D','D','Point GPS D','01/09/21 00:00:00', 7.50,15.0,'motos',hextoraw('453d7a34'),1);
insert into activite values(5,'Sortie E', 'ceci est la description de la sortie E','E','Point GPS E','02/09/21 00:00:00', 7.50,15.0,'motos',hextoraw('453d7a34'),1);
insert into activite values(6,'Sortie F', 'ceci est la description de la sortie F','F','Point GPS F','01/01/22 00:00:00',7.50, 15.0, 'motos', hextoraw('453d7a34'),1);
insert into activite values(7,'Sortie G', 'ceci est la description de la sortie G','G','Point GPS G','01/01/20 00:00:00',7.50, 15.0, 'motos', NULL,1);

insert into photo values(1,hextoraw('FFFFFF'), '01/01/2021',1,1);
insert into photo values(2,hextoraw('FFFFFF'), '01/01/2021',1,5);
insert into photo values(3,hextoraw('FFFFFF'), '01/01/2021',1,10);
insert into photo values(4,hextoraw('FFFFFF'), '01/01/2021',2,2);
insert into photo values(5,hextoraw('FFFFFF'), '01/01/2021',2,1);
insert into photo values(6,hextoraw('FFFFFF'), '01/01/2021',3,10);
insert into photo values(7,hextoraw('FFFFFF'), '01/01/2021',4,9);
insert into photo values(8,null, '01/01/2021',4,9);
insert into photo values(9, null,'01/01/2020', 7,1);

insert into saison values(1,'01/09/2019 00:00:00','31/08/2020 00:00:00');
insert into saison values(2,'01/09/2020 00:00:00','31/08/2021 00:00:00');
insert into saison values(3,'01/09/2021 00:00:00','31/08/2022 00:00:00');


insert into publication values(1,'Nouvelles sur la sortie A',0,'Pour la sortie A nous allons jusque dans le puy-de-d�me d�jeuner � la Bergerie de Sarpoil...', hextoraw('00000000'),1,1);
insert into publication values(2,'Nouvelles sur la sortie B',0,'Pour la sortie B nous allons jusque dans...', hextoraw('00000000'),0,3);
insert into publication values(3,'Nouvelles sur la sortie C',0,'Pour la sortie C nous allons � ...', hextoraw('00000000'),1,5);
insert into publication values(4,'Nouvelles sur la sortie D',0,'Pour la sortie D ...', hextoraw('00000000'),1,1);
insert into publication values(5,'Promotion sur les gants',1,'Super promotion : 60% de remise sur une paire de gants...', hextoraw('00000000'),1,1);

insert into participer values(1,1,'02/02/2021 00:00:00',2,'Jean Guillot et Jacques Camus');
insert into participer values(2,1,'02/02/2021 00:00:00',0,'');
insert into participer values(4,1,'02/02/2021 00:00:00',1,'Philippe Lema�tre');
insert into participer values(5,1,'02/02/2021 00:00:00',0,'');
insert into participer values(10,1,'02/02/2021 00:00:00',1,'Etienne Franck');
insert into participer values(7,1,'02/02/2021 00:00:00',0,'');
insert into participer values(1,3,'02/02/2021 00:00:00',2,'Jean Guillot et Jacques Camus');
insert into participer values(1,4,'02/02/2021 00:00:00',2,'Jean Guillot et Jacques Camus');
insert into participer values(1,5,'02/02/2021 00:00:00',0,'');

insert into cotiser values(1,1,1,'02/09/2019 00:00:00',120);
insert into cotiser values(2,1,1,'02/09/2019 00:00:00',120);
insert into cotiser values(3,1,1,'02/09/2019 00:00:00',120);
insert into cotiser values(4,1,1,'02/09/2019 00:00:00',120);
insert into cotiser values(5,1,1,'02/09/2019 00:00:00',120);
insert into cotiser values(6,1,1,'02/09/2019 00:00:00',120);
insert into cotiser values(7,1,1,'02/09/2019 00:00:00',120);
insert into cotiser values(8,1,1,'02/09/2019 00:00:00',120);
insert into cotiser values(9,1,1,'02/09/2019 00:00:00',120);
insert into cotiser values(10,1,1,'02/09/2019 00:00:00',120);
insert into cotiser values(11,1,1,'02/09/2019 00:00:00',120);
insert into cotiser values(1,2,1,'02/09/2020 00:00:00',120);
insert into cotiser values(2,2,1,'02/09/2020 00:00:00',120);
insert into cotiser values(3,2,1,'02/09/2020 00:00:00',120);
insert into cotiser values(4,2,1,'02/09/2020 00:00:00',120);
insert into cotiser values(5,2,1,'02/09/2020 00:00:00',120);
insert into cotiser values(7,2,1,'02/09/2020 00:00:00',120);
insert into cotiser values(9,2,1,'02/09/2020 00:00:00',120);
insert into cotiser values(11,2,1,'02/09/2020 00:00:00',120);
insert into cotiser values(12,2,0,'02/09/2020 00:00:00',120);
insert into cotiser values(13,2,0,'02/09/2020 00:00:00',120);

UPDATE Membre SET NoTel = '(502) 873-2752' WHERE id_membre = 1;
UPDATE Membre SET NoTel = '(261) 915-7516' WHERE id_membre = 2;
UPDATE Membre SET NoTel = '(622) 294-6408' WHERE id_membre = 3;
UPDATE Membre SET NoTel = '(990) 777-6908' WHERE id_membre = 4;
UPDATE Membre SET NoTel = '(406) 824-5110' WHERE id_membre = 5;
UPDATE Membre SET NoTel = '(501) 263-5617' WHERE id_membre = 6;
UPDATE Membre SET NoTel = '(620) 298-0312' WHERE id_membre = 7;
UPDATE Membre SET NoTel = '(230) 162-6732' WHERE id_membre = 8;
UPDATE Membre SET NoTel = '(343) 732-7554' WHERE id_membre = 9;
UPDATE Membre SET NoTel = '(185) 716-1788' WHERE id_membre = 10;
UPDATE Membre SET NoTel = '(278) 890-7589' WHERE id_membre = 11;
UPDATE Membre SET NoTel = '(808) 667-1170' WHERE id_membre = 12;
UPDATE Membre SET NoTel = '(890) 213-6063' WHERE id_membre = 13;
