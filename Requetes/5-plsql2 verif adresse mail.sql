--Fonction permettant de vérifier qu'une adresse mail est valide

CREATE or replace FUNCTION verif_mail (email varchar2) RETURN VARCHAR2
IS 
ESTVALIDE BOOLEAN;
BEGIN
ESTVALIDE := REGEXP_LIKE (email,'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$');
    
    IF ESTVALIDE
    THEN
      return 'VALIDE';
   ELSE
      return 'NON VALIDE';
   END IF;
END;

begin
dbms_output.put_line(verif_mail('emilie.paniagua@gmail.com'));
end;