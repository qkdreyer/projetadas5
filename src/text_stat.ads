with Mot;use Mot;
package Text_Stat is
   --Ce paquetage permet d'effectuer des op�rations "statistiques" sur le texte analys�
   --nombre total de mots, nombre de mots de longueur sup�rieur ou �gale a un entier positif donn�,
   --longueur moyenne d'un mot, et surement d'autres plus tard

   function Num_Mot_Tot(txt: Fichier_Texte) return Integer;
   --Calcule le nombre total de mot du texte
   
   function Num_Occ_Moy((L: ListeCouple) return Float;
   --Calcule le nombre d'occurence moyen a partir de la liste obtenu des mots
   --dans le texte
   
   function Long_Moy(txt: Fichier_Texte) return Integer;
   --Calcule la longueur moyenne d'un mot dans le texte
   
   function Num_Mot_Sup((L: ListeCouple;N: Integer) return Integer;
   --Calcule le nombre de mot dont la longueur est sup�rieur ou �gale a un entier positif donn�

   -- ... A completer eventuellement par la suite


end Text_Stat;
