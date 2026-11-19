alter table projekt drop foreign key projekt_ibfk_1;
alter table zadanie drop foreign key zadanie_ibfk_1;

alter table pracownik modify id_pracownika int not null; 
alter table pracownik drop primary key ; 

alter table pracownik modify id_pracownika int primary key;


set foreign_key_checks = 0;
alter table projekt 
	add foreign key (menadzer_projektu)
    references pracownik(id_pracownika);
alter table zadanie 
	add foreign key (id_pracownik) 	
    references pracownik(id_pracownika)
    on delete set null;
set foreign_key_checks = 1;

#zadanie2

alter table zadanie
	add godziny_szacowane int default 8;
select * from zadanie;

update zadanie 
	set godziny_szacowane=12
		where id_zadania=1;
update zadanie 
	set godziny_szacowane=2
		where id_zadania=2;
update zadanie 
	set godziny_szacowane=24
		where id_zadania=3;
        
alter table zadanie 
modify godziny_szacowane int default 6;

insert into zadanie (nazwa_zadania, priorytet, opis, id_pracownik, projekt, sprint)
	values
		("przenoszenie", "wysoki", "przenieś swoje biurko", 1, null, null);
select * from zadanie;
delete from zadanie where id_zadania=4;

alter table projekt
	add opis_kratki varchar(50);
alter table projekt
	modify opis_kratki varchar(200);
select * from projekt;
update projekt
	set opis_kratki = 'MVP'
	where id_projektu=1;
alter table projekt
	drop column opis_kratki;
    
    
alter table zadanie drop foreign key zadanie_ibfk_2;
set foreign_key_checks = 0;
alter table zadanie
	add foreign key (projekt)
    references projekt(id_projektu)
    on delete set null;
set foreign_key_checks = 1;
select * from projekt;
delete from projekt where id_projektu=1;
select * from zadanie;





