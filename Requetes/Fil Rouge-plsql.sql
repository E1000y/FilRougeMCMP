

--------
-- Cr�er une proc�dure pour inscrire un adh�rent � une activit�. 
--L'inscription sera refus�e si la date limite d'inscription est d�pass�e.
set serveroutput on;

create or replace procedure inscrire_adh_activite
(
    v_id_adh in membre.id_membre%type,
    v_id_act in activite.id_activite%type
)
as
    v_date_activite date;
    v_date_du_jour date;
   date_limite_inscription date;
begin

    select date_activite into v_date_activite from activite where id_activite = v_id_act;
    SELECT SYSDATE INTO v_date_du_jour FROM dual;
    
    date_limite_inscription := v_date_activite -5;
    dbms_output.put_line('v_date_activite '|| v_date_activite);
    dbms_output.put_line('date_limite_inscription '|| date_limite_inscription);

    if(v_date_du_jour > date_limite_inscription) then
        dbms_output.put_line('la date de l''activite est trop rapproch�e ou l''activit� est d�j� pass�e');
        --RAISE_APPLICATION_ERROR (-20001, 'Date de l''activit� trop rapproch�e');
        --le code d'exception ne fonctionne pas
        -- enfin si �a fonctionne mais �a ne renvoie pas d'erreur compr�hensible � la console. �a ne renvoie rien.
    
    else
        --dbms_output.put_line('On va inscrire l''adh�rent � l''activit�');
        --dbms_output.put_line('Mais on va d''abord tester qu''il n''est pas d�j� inscrit � cette m�me activit�');
        
        if(verifinscription(v_id_adh,v_id_act)) then
           --dbms_output.put_line('l''adh�rent n''est pas d�j� inscrit � cette activit�, on va donc l''y inscrire');
           insert into participer (id_membre, id_activite, date_inscription) values (v_id_adh,v_id_act,v_date_du_jour);
           --mais il faudrait �galement conna�tre le nombre d'invit�s et leurs noms, que je vais ignorer ici.
        else
        RAISE_APPLICATION_ERROR(-20002, 'l''adh�rent est d�j� inscrit');
        end if;    
    end if;
    
end inscrire_adh_activite;


begin
  dbms_output.put_line('Est-ce que untel est inscrit? ' || verifinscription(1,10));
end;

-- V�rifier qu'un adh�rent n'est pas d�j� inscrit � une activit�
create or replace function verifinscription
(
   v_id_adh in membre.id_membre%type,
    v_id_act in activite.id_activite%type
)
return number
as

v_adherent_estinscrit number(1);

begin
  --select count(*) into v_adherent_existe from membre where id_membre = v_id_adh;
  select count(*) into v_adherent_estinscrit from participer where id_membre = v_id_adh and id_activite = v_id_act;
      
 return v_adherent_estinscrit;
end verifinscription;




