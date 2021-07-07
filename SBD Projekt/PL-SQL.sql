set serveroutput on
Create procedure kategoriapracownika (v_nazwisko osobaspraw.nazwisko%type)
as
v_kategoria kategoria.kategoria%type;
begin
select  kategoria.kategoria into v_kategoria
from osobaspraw
join kategoria on kategoria.id_kategoria = osobaspraw.kategoria_id_kategoria
where nazwisko = v_nazwisko;
DBMS_OUTPUT.PUT_LINE('kategoria '||v_kategoria);
end;

drop procedure kategoriapracownika;
EXECUTE kategoriapracownika ('Alszer');



Create procedure zmianaKat (idkategoria2 int, idosoby2 int)
as
begin
	
	update osobaSpraw set Kategoria_Id_kategoria = idkategoria2 where idOsoby=idosoby2;
	update osobaSpraw set KategoriaSprawdzenia = (select Kategoria from Kategoria where Id_kategoria=idkategoria2) where idOsoby=idosoby2;
	DBMS_OUTPUT.PUT_LINE('osoba o id '|| cast(idosoby2 as varchar2) || ' sprawdza teraz kategorie o id ' || cast(idkategoria2 as varchar2));
	
end;
drop procedure zmianaKat;
execute zmianakat (3, 3);




create trigger niemausuwaniareportow
before delete
on raport
begin
	raise_application_error(-20500, 'nie ma usuwania');
end;
select * from raport;

delete from raport where idraportu = 1;

select * from granaplatforme;

create or replace trigger gry213 
before insert or update or delete 
on gra
for each row
declare
v_count int;
begin
    if inserting then
        select count(1) into v_count from gra where tytul = :NEW.tytul;
        if v_count != 0  then
            raise_application_error(-20500, 'taka gra istnieje');
        end if;
    elsif updating then
        if :NEW.idgry != :OLD.idgry then
            raise_application_error(-20500, 'nie mozna zmienic id');
        end if;
    elsif deleting then
            raise_application_error(-20500, 'nie mozna usunac gry');
        
    end if;
end;  
drop trigger gry231;
delete from gra where idgry=1;
update gra set idgry = 1 where idgry = 2;
commit;