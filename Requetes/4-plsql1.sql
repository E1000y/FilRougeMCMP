
--------
-- Cr�er une proc�dure pour inscrire un adh�rent � une activit�. Ajouter le nombre d'invit�s convi�s.
--L'inscription sera refus�e si la date limite d'inscription est d�pass�e.
set serveroutput on;

create or replace procedure inscrire_adh_activite
(
    v_id_adh in membre.id_membre%type,
    v_id_act in activite.id_activite%type,
    v_nb_inv in participer.nombre_invites%type
)
as
    v_date_activite date;
    v_date_du_jour date;
   date_limite_inscription date;
   v_nombre_de_participants number(10):=0;
   
begin

    select date_activite into v_date_activite from activite where id_activite = v_id_act;
    SELECT SYSDATE INTO v_date_du_jour FROM dual;
    select count(id_membre)+sum(nombre_invites) into v_nombre_de_participants
        from participer 
        where id_activite = v_id_act;
    
    date_limite_inscription := v_date_activite -5;
    dbms_output.put_line('v_date_activite '|| v_date_activite);
    dbms_output.put_line('date_limite_inscription '|| date_limite_inscription);
    dbms_output.put_line('v_nombre_de_participants ' || v_nombre_de_participants);

    if((v_date_du_jour > date_limite_inscription)) then
        dbms_output.put_line('la date de l''activite est trop rapproch�e, ou l''activit� est d�j� pass�e');
        RAISE_APPLICATION_ERROR (-20001, 'Date de l''activit� trop rapproch�e ou d�pass�e');
        --le code d'exception ne fonctionne pas
        -- enfin si �a fonctionne mais �a ne renvoie pas d'erreur compr�hensible � la console. �a ne renvoie rien.
    end if;
    if (v_nombre_de_participants>50) then
        dbms_output.put_line('Trop de monde dans l''activit�');
        RAISE_APPLICATION_ERROR(-20002, 'le nombre de participants est sup�rieur � 50');
    
    end if;
        --dbms_output.put_line('On va inscrire l''adh�rent � l''activit�');
        --dbms_output.put_line('Mais on va d''abord tester qu''il n''est pas d�j� inscrit � cette m�me activit�');
        
    if(verifinscription(v_id_adh,v_id_act)) then
       --dbms_output.put_line('l''adh�rent n''est pas d�j� inscrit � cette activit�, on va donc l''y inscrire');
       insert into participer (id_membre, id_activite, date_inscription, nombre_invites) values (v_id_adh,v_id_act,v_date_du_jour, v_nb_inv);
       --mais il faudrait �galement conna�tre le nombre d'invit�s et leurs noms, que je vais ignorer ici.
    else
        RAISE_APPLICATION_ERROR(-20002, 'l''adh�rent est d�j� inscrit');
    end if;    
  
end inscrire_adh_activite;


begin
inscrire_adh_activite(3,8,3);
end;

-- V�rifier qu'un adh�rent n'est pas d�j� inscrit � une activit�
create or replace function verifinscription
(
   v_id_adh in membre.id_membre%type,
    v_id_act in activite.id_activite%type
)
return boolean
as

v_adherent_estinscrit number(1);

begin
  --select count(*) into v_adherent_existe from membre where id_membre = v_id_adh;
  select count(*) into v_adherent_estinscrit from participer where id_membre = v_id_adh and id_activite = v_id_act;
      
      if(v_adherent_estinscrit =0)then
            return true;
      else return false;
      end if;
end verifinscription;




