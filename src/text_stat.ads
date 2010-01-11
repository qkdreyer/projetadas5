with Liste_Couple;
use Liste_Couple;

package Text_Stat is
   
   --Ce paquetage permet d'effectuer des op�rations "statistiques" sur le texte analys�
   --nombre total de mots, nombre de mots de longueur sup�rieur ou �gale a un entier positif donn�,
   --longueur moyenne d'un mot, et surement d'autres plus tard

   function Num_Mot_Tot(L : TListe_Couple) return Integer;
   --Calcule le nombre total de mot du texte

   function Num_Mot_Tot(L : TListe_Triplet) return Integer;
   --Calcule le nombre total de mot du texte

   function Num_Occ_Moy(L : TListe_Couple) return Float;
   --Calcule le nombre d'occurence moyen a partir de la liste obtenu des mots
   --dans le texte

   function Num_Occ_Moy(L : TListe_Triplet) return Float;
   --Calcule le nombre d'occurence moyen a partir de la liste obtenu des mots
   --dans le texte(se base sur la somme des occurences dans les 2 textes pour chaque mot)

   function Long_Moy(L : TListe_Couple) return Float;
   --Calcule la longueur moyenne d'un mot dans le texte

   function Long_Moy(L : TListe_Triplet) return Float;
   --Calcule la longueur moyenne d'un mot dans le texte

   function Num_Mot_Sup(L : TListe_Couple; N : Integer) return Integer;
   --Calcule le nombre de mot dont la longueur est sup�rieur ou �gale a un entier positif donn�
   
   function Num_Mot_Sup(L : TListe_Triplet; N : Integer) return Integer;
   --Calcule le nombre de mot dont la longueur est sup�rieur ou �gale a un entier positif donn�


end Text_Stat;
