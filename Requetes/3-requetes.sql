--Requ�tes pour les adh�rents
--Afficher les activit�s � venir en commen�ant par la plus r�cente
select nom_activite, description_activite, date_activite from activite where date_activite > sysdate order by date_activite;

--Afficher les 3 derni�res nouvelles publi�es � destination des adh�rents
select id_publication, description_nouvelle, date_publi_nouvelle 
from publication 
where isnouvelleadherents=1 
order by date_publi_nouvelle desc fetch next 3 rows only ;

--Requ�tes pour les organisateurs
--Afficher le nombre d'adh�rents � jour de leur cotisation pour la saison
Select count(*) from membre m 
join cotiser c on m.id_membre = c.id_membre
join saison s on s.id_saison = c.id_saison
where sysdate between s.date_debut_saison and s.date_fin_saison and c.cotisation_a_jour = 1;

--Afficher la liste des adh�rents qui n'ont pas donn� leur adresse mail 
select * from membre where email is null;

--Afficher la liste des adh�rents qui n'ont pas renouvel� leur adh�sion
-- non existence, left join avec where is null
select nom, prenom, c.id_membre, cotisation_a_jour from membre m
left join cotiser c 
on m.id_membre = c.id_membre and id_saison=(select id_saison from saison where sysdate between date_debut_saison and date_fin_saison)
where c.id_membre is null or cotisation_a_jour = 0;

--Afficher le nombre d'activit�s pour les 3 mois � venir
select count(*) from activite where date_activite between sysdate and add_months(sysdate,3);

--select nom_activite from activite where date_activite between sysdate and add_months(sysdate,3);

--Afficher les adh�rents inscrits � une activit� donn�e
select nom, prenom, a.id_activite, a.nom_activite from membre m
join participer p on p.id_membre = m.id_membre
join activite a on a.id_activite = p.id_activite
where p.id_activite = 1;
---j'ai limit� � la sortie � Saint Affrique car c'est celle o� il y a le plus d'adh�rents inscrits


--Afficher le nombre de participants pour les activit�s qui se d�rouleront dans les 3 prochains mois.
select count(p.id_membre)+sum(p.nombre_invites) from participer p
join activite a on p.id_activite=a.id_activite
where date_activite between sysdate and add_months(sysdate,3);

--Afficher les activit�s qui ont moins de 10 participants
select a.id_activite, a.nom_activite, count(p.id_membre)+sum(p.nombre_invites) from activite a 
join participer p 
on a.id_activite=p.id_activite
group by a.id_activite, a.nom_activite
having (count(p.id_membre)+sum(p.nombre_invites))<10;



--En fin de saison, pour permettre de faire le bilan moral de l'association, 
--afficher toutes les activit�s avec le nombre de participants adh�rents et le nombre de participants invit�s. 
--Les trier par audience d�croissante.

select a.nom_activite, count(p.id_membre), sum(p.nombre_invites) 
from activite a join participer p 
on a.id_activite=p.id_activite
join saison s 
on a.date_activite between s.date_debut_saison and s.date_fin_saison
where sysdate between s.date_debut_saison and s.date_fin_saison
group by a.nom_activite
order by (count(p.id_membre) + sum(p.nombre_invites)) desc ;


--Annuler l'inscription d'un adh�rent � une activit�
delete from participer where id_membre = (select id_membre from membre where id_membre=1) 
and id_activite= 1;

rollback;

----Afficher les activit�s pass�es pour lesquelles aucune photo n'a �t� publi�e.
-- regarder dans la table photo s'il y a des photos qui correspondent � des activit�s
select nom_activite from activite a
left join photo p on a.id_activite = p.id_activite
where p.id_photo is null;


--Afficher le nombre de nouvelles par type de destinataire(public ou adh�rent)
select count(*), isnouvelleadherents from publication group by isnouvelleadherents;



--Lister les adh�rents les plus actifs (ceux qui participent au plus grand nombre d'activit�s)
select count(m.id_membre), m.nom, m.prenom from membre m 
join participer p 
on m.id_membre  = p.id_membre
join activite a
on a.id_activite = p.id_activite
group by m.id_membre, m.nom, m.prenom
order by count(m.id_membre) desc;


-- est-ce que 1 est inscrit � l'activit� 1?
select count(*) from participer where id_activite = 10 and id_membre = 1;

select * from participer;
select id_activite, date_activite from activite;
select count(*) from membre;

insert into participer (id_membre, id_activite, date_inscription) values (5,9,sysdate);
rollback;

update participer set nombre_invites = 0 where nombre_invites is null;

