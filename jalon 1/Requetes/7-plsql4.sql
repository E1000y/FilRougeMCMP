--L'association souhaite connaitre facilement le nombre de participants inscrits aux 
--activités. Proposer différentes solutions pour répondre à cette demande. Vous décrirez 
--chaque solution puis vous les comparerez

create or replace function nbparticipants_toutesactivitesconfondues

return number
as

v_nb_part_ttact number;

begin

select count(*)+sum(nombre_invites) into v_nb_part_ttact from participer;

return v_nb_part_ttact;

end nbparticipants_toutesactivitesconfondues;


----je veux le nombre de participants avec en face le numéro de l'activite

set serveroutput on;

create or replace function nbparticipants_paractivite

return VARCHAR2
as

v_nb_part_paract number;
v_count_activite number;
v_id_act number;
v_nom_act varchar2(100);
v_resultat varchar2(5000):='';

begin
  
 for R_pjoina in (select count(*)+sum(nombre_invites) as compte, a.id_activite as id_act, a.nom_activite as nom_act 
                                    from participer p
                                    join activite a
                                    on p.id_activite = a.id_activite
                                     group by a.id_activite, a.nom_activite)
    loop
    
    v_resultat := v_resultat ||'"'||R_pjoina.compte||/*';'||R_pjoina.id_act||*/';'||R_pjoina.nom_act||'"'||chr(10);
    
        
    end loop;
    
    return v_resultat;

end;



begin

dbms_output.put_line(nbparticipants_paractivite);

end;

--Sélectionner la liste des activités entre deux dates

select count(*)+sum(nombre_invites), a.id_activite, a.nom_activite, a.date_activite 
    from participer p
    join activite a
    on p.id_activite = a.id_activite /*and a.date_activite between '01/09/2021' and '01/09/2023'*/
    group by a.id_activite, a.nom_activite, a.date_activite
    order by a.date_activite;


select count(*)+sum(nombre_invites), a.id_activite, a.nom_activite, a.date_activite 
    from participer p
    join activite a
    on p.id_activite = a.id_activite and a.date_activite between '01/10/2021 00:00:00' and '01/12/2023 00:00:00'
    group by a.id_activite, a.nom_activite, a.date_activite;


create or replace function select_suivant_date(
v_date_debut activite.date_activite%type,
v_date_fin activite.date_activite%type
)
return varchar
as

v_result varchar(5000) :='';

begin

for tab_elt in ( select count(*)+sum(nombre_invites) as nb_participants, a.id_activite as id_act, a.nom_activite as nom_act, a.date_activite as date_act
                    from participer p
                    join activite a
                    on p.id_activite = a.id_activite and a.date_activite between v_date_debut and v_date_fin
                    group by a.id_activite, a.nom_activite, a.date_activite)
loop

v_result := v_result ||'"'||tab_elt.nb_participants||';'||tab_elt.nom_act||';'||tab_elt.date_act||'"'||chr(10);

end loop;


return v_result;

end select_suivant_date;

begin
dbms_output.put_line(select_suivant_date('01/10/1995 00:00:00', '01/12/3000 00:00:00'));
end;
