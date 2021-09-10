set serveroutput on;

create or replace function extraire_membres_csv

return VARCHAR2
 as
 v_lines varchar2(10000);

 begin

 --cette procédure extrait les valeurs des membres de tous les adhérents de la table membre pour le restituer au format "nom; prénom; mail; tel" \n 

 

 for membres in (select nom, prenom, email, notel from membre) loop
 

    v_lines := v_lines ||'"'||membres.nom||';'||membres.prenom||';'||membres.email||';'||membres.notel||'"'||chr(10);

 end loop;

 return v_lines;

 end;
 
begin
dbms_output.put_line(extraire_membres_csv());
end;
 