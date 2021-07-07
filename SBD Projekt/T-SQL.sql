Create procedure kategoriapracownika @nazwisko varchar(20)
as
select kategoria_id_kategoria, kategoria.kategoria 
from osobaspraw
join kategoria on kategoria.id_kategoria = osobaspraw.kategoria_id_kategoria
where nazwisko = @nazwisko;


EXECUTE kategoriapracownika 'Alszer';



Create procedure zmianaKat @id__kategoria int, @__idosoby int
as
begin
	
	update osobaSpraw set Kategoria_Id_kategoria = @id__kategoria where idOsoby=@__idosoby;
	update osobaSpraw set KategoriaSprawdzenia = (select Kategoria from Kategoria where Id_kategoria=@id__kategoria) where idOsoby=@__idosoby;
	
	Print 'osoba o id '+cast(@__idosoby as varchar) + ' sprawdza teraz kategorie o id' + cast(@id__kategoria as varchar);
end
drop procedure zmianaKat;
execute zmianakat 3, 3;




create trigger niemausuwaniareportow
on raport
for delete
as
begin
	rollback;
	RAISERROR('nie mozna usuwac raportow',1,2);
end;
select * from raport;

delete from raport where idraportu = 1;

select * from granaplatforme

create trigger liczbaGierwbazie
on granaplatforme
after insert, delete,update
as
begin
	Declare @platforma varchar(30)
	declare @ilosc integer
	declare db_cursor cursor for select nazwa, count (1) from GraNaplatforme join Platforma on Platforma.idPlatformy=GraNaplatforme.Platforma_idPlatformy group by Platforma.nazwa
	open db_cursor
	fetch next from db_cursor into @platforma , @ilosc

	while @@FETCH_STATUS = 0
	begin
		print ' w bazie jest '+cast(@ilosc as varchar)+ ' gier na '+@platforma
		fetch next from db_cursor into @platforma, @ilosc
		end
	close db_cursor
	DEALLOCATE db_cursor
END;
drop trigger liczbaGierwbazie
insert into granaplatforme (platforma_idplatformy,gra_idgry,developer_iddev)
values(1,	1,	2)

update GraNaplatforme set Platforma_idPlatformy = 1 where Platforma_idPlatformy =1;