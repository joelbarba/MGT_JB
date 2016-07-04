-- Fix values:

---------- 0          1       2        3        4      5
colors = ['uncolor', 'blue', 'white', 'black', 'red', 'green'];
-------------- 0             1                2
card_types = ['basic land', 'instant spell', 'creature'];
--------------- 0         1        2       3          4         5          6
game_phases = ['upkeep', 'untap', 'take', 'summon1', 'attack', 'summon2', 'end'];
--------------- 0       1       2         3        4            5
card_places = ['deck', 'hand', 'summon', 'table', 'graveyard', 'discarted'];

-- Collections

card_templates = [
  { card_code,
    name,
    color,      ----> colors[]
    card_type,  ----> card_types[]
    cost_summon : [0,0,0,0,0,0],  --> each corresponding to colors[]
    card_text,
    atack,
    defend,
    image_file
  }
];

players = [
  { player_id, name }
];

cards = [
  { card_id,
    card_code, ---> card_templates.card_code
    owner      ---> players.player_id
  }
];

deck_templates = [
  deck_code,
  name,
  cards : []  ---> cards.card_id
]


game = {
  player_turn,   --- 1 or 2
  player1 : {
    player_id,    ---> players.player_id
    life,         ---> 0-20 life points
    deck: {
      deck_code,  ---> deck_templates.deck_code
      name,
      cards: [
        { card_id,     ---> cards.card_id
          card_place,  ---> card_places[]
          taped,       ---> false=untapped, true=tapped
          card_info: {} -- depending on each the card type
        }
      ]
    }
}

------------------------------------------------------------------------------------------------
Paràmetres fixos :

COLORS :
0 = incolor
1 = blau
2 = blanc
3 = negre
4 = vermell
5 = verd

TIPUS :
01   Terra bàsica
02   Encanteri instantani
03   Criatura

ESTAT_PARTIDA : 0=no iniciada, 1=en curs, 2=finalitzada
TORN : 1=jugador1, 2=jugador2
FASE : 1=Manteniment, 2=Entreçar, 3=Robar, 4=Invocar1, 5=atacar, 6=Invocar2, 7=Final de torn
SITUACIO_CARTA : 1=baralla, 2=ma, 3=en invocacio, 4=en joc, 5=cementiri, 6=descartada


------------------------------------------------------------------------------------------------

CARTES
- codi_carta                    number      PK
- nom                           varchar2
- color                         number
- tipus                         number
- edicio                        number
- cost_inv_incolor              number
- cost_inv_blau                 number
- cost_inv_blanc                number
- cost_inv_negre                number
- cost_inv_vermell              number
- cost_inv_verd                 number
- text_descripcio               varchar2
- atac                          number
- defensa                       number
- ruta_imatge                   varchar2

BARALLES
- id_baralla                    number      PK
- nom_baralla                   varchar2

CARTES_BARALLA
- id_carta                      number      PK
- baralla                       number      FK a BARALLES
- codi_carta                    number      FK a CARTES


------------------------------------------------------------------------------------------------

PARTIDES
- id_partida                    number      PK
- estat_partida                 number
- torn                          number
- fase                          number
- nom_jugador_1                 varchar2
- nom_jugador_2                 varchar2
- baralla_1                     number      FK a BARALLES
- baralla_2                     number      FK a BARALLES
- vida_jugador_1                number
- vida_jugador_2                number

CARTES_PARTIDA
- id_carta_partida              number      PK
- codi_carta                    number      FK a CARTES
- id_partida                    number      FK a PARTIDES
- jugador                       number
- ordre                         number
- situacio_carta                number
- girada                        boolean


LOG_PARTIDA
- id_partida
- id_accio



------------------------------------------------------------------------------------------------
-- Iniciar partida

codi_partida = nvl((select max(id_partida) from PARTIDES), 0) + 1;

insert into PARTIDES values (
:id_partida          id_partida
0                    estat_partida
1                    torn
1                    fase
'bill'               nom_jugador_1
'joe'                nom_jugador_2
1                    baralla_1
2                    baralla_2
20                   vida_jugador_1
20                   vida_jugador_2
);

insert into CARTES_PARTIDA
select rownum                    id_carta_partida
       codi_carta                codi_carta
       :id_partida               id_partida
       1                         jugador
       null                      ordre
       1                         situacio_carta
       false                     girada
  from CARTES_BARALLA
 where baralla = (select baralla_1 from PARTIDES where id_partida = :id_partida)

insert into CARTES_PARTIDA
select rownum                    id_carta_partida
       codi_carta                codi_carta
       :id_partida               id_partida
       2                         jugador
       null                      ordre
       1                         situacio_carta
       false                     girada
  from CARTES_BARALLA
 where baralla = (select baralla_2 from PARTIDES where id_partida = :id_partida)


for i = 1 to 60 {
    x = random(60) + 1;
    CARTES_PARTIDA.ordre = x - (select count(*)

}




