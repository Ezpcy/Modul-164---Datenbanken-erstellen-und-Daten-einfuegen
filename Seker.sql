CREATE Database db_ubs;

use db_ubs;

create table
    KundenInfo (
        ID_Kunde int not null auto_increment primary key,
        Nachname varchar(50) not null,
        Kontonummer varchar(5) not null,
        SWIFT INT,
        Kontostand decimal(10, 2),
        Erstellt_am DATE
    );

insert into
    KundenInfo
values
    (
        null,
        "Seker",
        "12345",
        163,
        100000.00,
        "2024.03.15"
    );

insert into
    KundenInfo (Nachname, Kontonummer, SWIFT, Kontostand)
values
    ("Schneider", "01010", 203, 150.00);

alter table KundenInfo
add column geaendert_am datetime;

update KundenInfo
set
    Kontostand = Kontostand + 1000
where
    kontoNummer = "12345";

select
    ID_Kunde,
    Nachname,
    Kontonummer,
    Kontostand
from
    KundenInfo
where
    Nachname like "Par%"
    or Kontonummer > "3322"
    and Kontostand <= 100.00
order by
    Nachname asc,
    Kontostand desc;