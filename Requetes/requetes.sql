--Requ�tes pour les adh�rents
--Afficher les activit�s � venir en commen�ant par la plus r�cente
select * from activite where date_activite>sysdate;

--Afficher les 3 derni�res nouvelles publi�es � destination des adh�rents
select * from publication where isnouvelleadherents=1 order by id_publication desc fetch next 3 rows only  ;

--Requ�tes pour les organisateurs
--Afficher le nombre d'adh�rents � jour de leur cotisation pour la saison
Select * from membre m 
join cotiser c on m.id_membre = c.id_membre
join saison s on s.id_saison = c.id_saison
where sysdate between s.date_debut_saison and s.date_fin_saison and c.cotisation_a_jour = 1;

--Afficher la liste des adh�rents qui n'ont pas donn� leur adresse mail 
select * from membre where email is null;

--Afficher la liste des adh�rents qui n'ont pas renouvel� leur adh�sion
select * from membre m 
join cotiser c on m.id_membre = c.id_membre 
where id_saison=(select id_saison from saison where sysdate between date_debut_saison and date_fin_saison) 
and c.cotisation_a_jour=0;

--Afficher le nombre d'activit�s pour les 3 mois � venir
select * from activite where date_activite between sysdate and add_months(sysdate,3);

--Afficher les adh�rents inscrits � une activit� donn�e
select * from membre m
join participer_et_inviter p on p.id_membre = m.id_membre
join activite a on a.id_activite = p.id_activite;

--Afficher le nombre de participants pour les activit�s qui se d�rouleront dans les 3 prochains mois.
select count(p.id_membre)+sum(p.nombre_invites)from participer p
join activite a on p.id_activite=a.id_activite
where date_activite between sysdate and add_months(sysdate,3);

--Afficher les activit�s qui ont moins de 10 participants
select a.id_activite, a.nom_activite from activite a 
join participer p 
on a.id_activite=p.id_activite
group by a.id_activite, a.nom_activite
having (count(p.id_membre)+sum(p.nombre_invites))<10;


--(requ�tes pour tester la question pr�c�dente)
select * from participer;
select * from activite;
select * from participer p right join activite a on p.id_activite = a.id_activite;

--En fin de saison, pour permettre de faire le bilan moral de l'association, 
--afficher toutes les activit�s avec le nombre de participants adh�rents et le nombre de participants invit�s. 
--Les trier par audience d�croissante.

--1)r�cup�rer la saison
select id_saison from saison where sysdate > date_debut_saison and sysdate < date_fin_saison;
--2)r�cup�rer les activit�s avec le nombre de participants.
select * from activite where date_activite 
        between 
                (select date_debut_saison from saison 
                    where id_saison = (select id_saison from saison where sysdate > date_debut_saison and sysdate < date_fin_saison) )
        and
                (select date_fin_saison from saison 
                    where id_saison = (select id_saison from saison where sysdate > date_debut_saison and sysdate < date_fin_saison) );

--
select * from activite a, saison s
where sysdate between s.date_debut_saison and s.date_fin_saison
and a.date_activite between s.date_debut_saison and s.date_fin_saison;

--Annuler l'inscription d'un adh�rent � une activit�
delete from participer where id_membre = 
(select id_membre from membre where nom='Duchampt') 
and id_activite= (select a.id_activite from activite  a where a.nom_activite = 'Sortie A');

rollback;


----Afficher les activit�s pass�es pour lesquelles aucune photo n'a �t� publi�e.
select * from activite where photo_activite is null and date_activite<sysdate;

--Afficher le nombre de nouvelles par type de destinataire(public ou adh�rent)




--Lister les adh�rents les plus actifs (ceux qui participent au plus grand nombre d'activit�s)
select count(m.id_membre), m.nom, m.prenom from membre m 
join participer p 
on m.id_membre  = p.id_membre
join activite a
on a.id_activite = p.id_activite
group by m.id_membre, m.nom, m.prenom;

