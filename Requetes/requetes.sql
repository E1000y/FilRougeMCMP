--Requêtes pour les adhérents
--Afficher les activités à venir en commençant par la plus récente
select * from activite where date_activite>sysdate;

--Afficher les 3 dernières nouvelles publiées à destination des adhérents
select * from publication where isnouvelleadherents=1 order by id_publication desc fetch next 3 rows only  ;

--Requêtes pour les organisateurs
--Afficher le nombre d'adhérents à jour de leur cotisation pour la saison
Select * from membre m 
join cotiser c on m.id_membre = c.id_membre
join saison s on s.id_saison = c.id_saison
where sysdate between s.date_debut_saison and s.date_fin_saison and c.cotisation_a_jour = 1;

--Afficher la liste des adhérents qui n'ont pas donné leur adresse mail 
select * from membre where email is null;

--Afficher la liste des adhérents qui n'ont pas renouvelé leur adhésion
select * from membre m 
join cotiser c on m.id_membre = c.id_membre 
where id_saison=(select id_saison from saison where sysdate between date_debut_saison and date_fin_saison) 
and c.cotisation_a_jour=0;

--Afficher le nombre d'activités pour les 3 mois à venir
select * from activite where date_activite between sysdate and add_months(sysdate,3);

--Afficher les adhérents inscrits à une activité donnée
select * from membre m
join participer_et_inviter p on p.id_membre = m.id_membre
join activite a on a.id_activite = p.id_activite;

--Afficher le nombre de participants pour les activités qui se dérouleront dans les 3 prochains mois.
select count(p.id_membre)+sum(p.nombre_invites)from participer p
join activite a on p.id_activite=a.id_activite
where date_activite between sysdate and add_months(sysdate,3);

--Afficher les activités qui ont moins de 10 participants
select a.id_activite, a.nom_activite from activite a 
join participer p 
on a.id_activite=p.id_activite
group by a.id_activite, a.nom_activite
having (count(p.id_membre)+sum(p.nombre_invites))<10;


--(requêtes pour tester la question précédente)
select * from participer;
select * from activite;
select * from participer p right join activite a on p.id_activite = a.id_activite;

--En fin de saison, pour permettre de faire le bilan moral de l'association, 
--afficher toutes les activités avec le nombre de participants adhérents et le nombre de participants invités. 
--Les trier par audience décroissante.

--1)récupérer la saison
select id_saison from saison where sysdate > date_debut_saison and sysdate < date_fin_saison;
--2)récupérer les activités avec le nombre de participants.
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

--Annuler l'inscription d'un adhérent à une activité
delete from participer where id_membre = 
(select id_membre from membre where nom='Duchampt') 
and id_activite= (select a.id_activite from activite  a where a.nom_activite = 'Sortie A');

rollback;


----Afficher les activités passées pour lesquelles aucune photo n'a été publiée.
select * from activite where photo_activite is null and date_activite<sysdate;

--Afficher le nombre de nouvelles par type de destinataire(public ou adhérent)




--Lister les adhérents les plus actifs (ceux qui participent au plus grand nombre d'activités)
select count(m.id_membre), m.nom, m.prenom from membre m 
join participer p 
on m.id_membre  = p.id_membre
join activite a
on a.id_activite = p.id_activite
group by m.id_membre, m.nom, m.prenom;

