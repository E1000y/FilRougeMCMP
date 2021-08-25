--Requêtes pour les adhérents
--Afficher les activités à venir en commençant par la plus récente
select nom_activite, description_activite, date_activite from activite where date_activite > sysdate order by date_activite;

--Afficher les 3 dernières nouvelles publiées à destination des adhérents
select id_publication, description_nouvelle, date_publi_nouvelle 
from publication 
where isnouvelleadherents=1 
order by date_publi_nouvelle desc fetch next 3 rows only ;

--Requêtes pour les organisateurs
--Afficher le nombre d'adhérents à jour de leur cotisation pour la saison
Select count(*) from membre m 
join cotiser c on m.id_membre = c.id_membre
join saison s on s.id_saison = c.id_saison
where sysdate between s.date_debut_saison and s.date_fin_saison and c.cotisation_a_jour = 1;

--Afficher la liste des adhérents qui n'ont pas donné leur adresse mail 
select * from membre where email is null;

--Afficher la liste des adhérents qui n'ont pas renouvelé leur adhésion
-- non existence, left join avec where is null
select nom, prenom, c.id_membre, cotisation_a_jour from membre m
left join cotiser c 
on m.id_membre = c.id_membre and id_saison=(select id_saison from saison where sysdate between date_debut_saison and date_fin_saison)
where c.id_membre is null or cotisation_a_jour = 0;

--Afficher le nombre d'activités pour les 3 mois à venir
select count(*) from activite where date_activite between sysdate and add_months(sysdate,3);

--select nom_activite from activite where date_activite between sysdate and add_months(sysdate,3);

--Afficher les adhérents inscrits à une activité donnée
select nom, prenom, a.id_activite, a.nom_activite from membre m
join participer p on p.id_membre = m.id_membre
join activite a on a.id_activite = p.id_activite
where p.id_activite = 1;
---j'ai limité à la sortie à Saint Affrique car c'est celle où il y a le plus d'adhérents inscrits


--Afficher le nombre de participants pour les activités qui se dérouleront dans les 3 prochains mois.
select count(p.id_membre)+sum(p.nombre_invites) from participer p
join activite a on p.id_activite=a.id_activite
where date_activite between sysdate and add_months(sysdate,3);

--Afficher les activités qui ont moins de 10 participants
select a.id_activite, a.nom_activite, count(p.id_membre)+sum(p.nombre_invites) from activite a 
join participer p 
on a.id_activite=p.id_activite
group by a.id_activite, a.nom_activite
having (count(p.id_membre)+sum(p.nombre_invites))<10;



--En fin de saison, pour permettre de faire le bilan moral de l'association, 
--afficher toutes les activités avec le nombre de participants adhérents et le nombre de participants invités. 
--Les trier par audience décroissante.

select a.nom_activite, count(p.id_membre), sum(p.nombre_invites) 
from activite a join participer p 
on a.id_activite=p.id_activite
join saison s 
on a.date_activite between s.date_debut_saison and s.date_fin_saison
where sysdate between s.date_debut_saison and s.date_fin_saison
group by a.nom_activite
order by (count(p.id_membre) + sum(p.nombre_invites)) desc ;


--Annuler l'inscription d'un adhérent à une activité
delete from participer where id_membre = (select id_membre from membre where id_membre=1) 
and id_activite= 1;

rollback;

----Afficher les activités passées pour lesquelles aucune photo n'a été publiée.
-- regarder dans la table photo s'il y a des photos qui correspondent à des activités
select nom_activite from activite a
left join photo p on a.id_activite = p.id_activite
where p.id_photo is null;


--Afficher le nombre de nouvelles par type de destinataire(public ou adhérent)
select count(*), isnouvelleadherents from publication group by isnouvelleadherents;



--Lister les adhérents les plus actifs (ceux qui participent au plus grand nombre d'activités)
select count(m.id_membre), m.nom, m.prenom from membre m 
join participer p 
on m.id_membre  = p.id_membre
join activite a
on a.id_activite = p.id_activite
group by m.id_membre, m.nom, m.prenom
order by count(m.id_membre) desc;


-- est-ce que 1 est inscrit à l'activité 1?
select count(*) from participer where id_activite = 10 and id_membre = 1;

select * from participer;
select id_activite, date_activite from activite;
select count(*) from membre;

insert into participer (id_membre, id_activite, date_inscription) values (5,9,sysdate);
rollback;

update participer set nombre_invites = 0 where nombre_invites is null;

