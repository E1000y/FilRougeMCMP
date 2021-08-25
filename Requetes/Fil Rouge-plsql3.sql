create or replace function extraire_membres_csv

return VARCHAR2
 as
 
 v_count_membres_total number(10);
 v_nom membre.nom%type;
 v_prenom membre.prenom%type;
 v_email membre.email%type;
 v_tel membre.NoTel%type;
 v_lines varchar2(5000);
    
  
 begin
 
 --cette procédure extrait les valeurs des membres de tous les adhérents de la table membre pour le restituer au format "nom; prénom; mail; tel" \n 
 
 select count(*) into v_count_membres_total from membre;
  
 for I in 1..v_count_membres_total loop
    --dbms_output.put_line('I : '|| i);
    select nom, prenom, email, notel into v_nom, v_prenom, v_email, v_tel from membre where id_membre=I;
   
      
    v_lines := v_lines ||'"' ||v_nom||';'||v_prenom||';'||v_email||';'||v_tel||'"'||chr(10);
 
 end loop;
 
 return v_lines;
  
 end;
 

 
 begin 
 dbms_output.put_line(extraire_membres_csv);
 end;