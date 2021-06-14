%conferencia,divisão,equipa,estádio
team(afc,east,buffalo_bills,highmark_stadium).
team(afc,east,miami_dolphins,hard_rock_stadium).
team(afc,east,new_england_patriots,gillette_stadium).
team(afc,east,new_york_jets,metlife_stadium).
team(afc,north,baltimore_ravens,mt_bank_stadium).
team(afc,north,cincinnati_bengals,paul_brown_stadium).
team(afc,north,cleveland_browns,firstenergy_stadium).
team(afc,north,pittsburgh_steelers,heinz_field).
team(afc,south,houston_texans,nrg_stadium).
team(afc,south,indianapolis_colts,lucas_oil_stadium).
team(afc,south,jacksonville_jaguars,tiaa_bank_field).
team(afc,south,tennessee_titans,nissan_stadium).
team(afc,west,denver_broncos,empower_field_at_mile_high).
team(afc,west,kansas_city_chiefs,arrowhead_stadium).
team(afc,west,las_vegas_raiders,allegiant_stadium).
team(afc,west,los_angeles_chargers,sofi_stadium).
team(nfc,east,dallas_cowboys,att_stadium).
team(nfc,east,new_york_giants,metlife_stadium).
team(nfc,east,philadelphia_eagles,lincoln_financial_field).
team(nfc,east,washington_football_team,fedex_field).
team(nfc,north,chicago_bears,soldier_field).
team(nfc,north,detroit_lions,ford_field).
team(nfc,north,green_bay_packers,lambeau_field).
team(nfc,north,minnesota_vikings,us_bank_stadium).
team(nfc,south,atlanta_falcons,mercedes-benz_stadium).
team(nfc,south,carolina_panthers,bank_of_america_stadium).
team(nfc,south,new_orleans_saints,mercedesbenz_superdome).
team(nfc,south,tampa_bay_buccaneers,raymond_james_stadium).
team(nfc,west,arizona_cardinals,state_farm_stadium).
team(nfc,west,los_angeles_rams,sofi_stadium).
team(nfc,west,san_francisco_49ers,levis_stadium).
team(nfc,west,seattle_seahawks,lumen_field).


%fora,casa,dia,hora
match(dallas_cowboys,tampa_bay_buccaneers,20210909,120).
match(philadelphia_eagles,atlanta_falcons,20210912,1800).
match(pittsburgh_steelers,buffalo_bills,20210912,1800).
match(minnesota_vikings,cincinnati_bengals,20210912,1800).
match(san_francisco_49ers,detroit_lions,20210912,1800).
match(arizona_cardinals,tennessee_titans,20210912,1800).
match(seattle_seahawks,indianapolis_colts,20210912,1800).
match(los_angeles_chargers,washington_football_team,20210912,1800).
match(new_york_jets,carolina_panthers,20210912,1800).
match(jacksonville_jaguars,houston_texans,20210912,1800).
match(cleveland_browns,kansas_city_chiefs,20210912,2125).
match(miami_dolphins,new_england_patriots,20210912,2125).
match(green_bay_packers,new_orleans_saints,20210912,2125).
match(denver_broncos,new_york_giants,20210912,2125).
match(chicago_bears,los_angeles_rams,20210912,120).
match(baltimore_ravens,las_vegas_raiders,20210913,115).

% a) `where(Visitor, Host, Stadium)` que encontra o est�dio (`Stadium`)
% onde o encontro entre `Visitor` (joga fora) e `Host` (joga em casa) ir�
% decorrer.

where(Visitor, Host, Stadium) :-
    match(Visitor, Host, _, _),
    team(_, _, Host, Stadium).


% b) `stadiums_open(Date, Stadium)` que encontra os est�dios com
% encontros na data indicada.

stadiums_open(Date, Stadium) :-
    match(_, Host, Date, _),
    team(_, _, Host, Stadium).

% c) `conf_stadiums_open(Conf, Date, Stadium)` que encontra est�dios cuja
% equipa a jogar em casa � da confer�ncia `Conf`.

conf_stadiums_open(Conf, Date, Stadium) :-
    stadiums_open(Date, Stadium),
    team(Conf, _, _, Stadium).

% d) `cross_conf_stadiums(Stadium)` que encontra est�dios que s�o a casa
% de equipas das duas confer�ncias (*afc* e *nfc*).

cross_conf_stadiums(Stadium) :-
    team(C1,_,_,Stadium),
    team(C2,_,_,Stadium),
    C1 \= C2.
