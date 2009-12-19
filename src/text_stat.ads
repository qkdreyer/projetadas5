with Mot;use Mot;
with Couple;use Couple;
with Liste_Couple;use Liste_Couple;
with Ada.Text_Io;use Ada.Text_Io;

package Text_Stat is
   --Ce paquetage permet d'effectuer des op�rations "statistiques" sur le texte analys�
   --nombre total de mots, nombre de mots de longueur sup�rieur ou �gale a un entier positif donn�,
   --longueur moyenne d'un mot, et surement d'autres plus tard

   use Liste_Couple.L;

   function Num_Mot_Tot(L: TListe_Couple) return Integer;
   --Calcule le nombre total de mot du texte

   function Num_Occ_Moy(L: TListe_Couple) return Float;
   --Calcule le nombre d'occurence moyen a partir de la liste obtenu des mots
   --dans le texte

   function Long_Moy(L: TListe_Couple) return Float;
   --Calcule la longueur moyenne d'un mot dans le texte

   function Num_Mot_Sup(L: TListe_Couple;N: Integer) return Integer;
   --Calcule le nombre de mot dont la longueur est sup�rieur ou �gale a un entier positif donn�

   -- ... A completer eventuellement par la suite

end Text_Stat;
