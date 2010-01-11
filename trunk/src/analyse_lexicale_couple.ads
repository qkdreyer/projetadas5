with Liste_Couple;
use Liste_Couple;

package Analyse_Lexicale_Couple is --Package permettant d'analyser le texte et d'effectuer les requetes dessus
   
   procedure Query_Liste_Couple (L : in out TListe_Couple; NomFic : in String);
   --Renvoit une liste comprenant tous les couples(mot;occurence) du texte, la
   --liste est tri�e par ordre alphabetique
   --je pense qu'il faudrait faire qu'on parcourt tout le texte
   --et qu'a chaque mot trouv� on l'insere de maniere tri�ee dans la liste qu'on renvoit
   --si on le trouve dans la liste alors on fait juste augmenter le nbOcc

   function Query_NbOcc (L : TListe_Couple; M : String) return Integer;
   --Requete renvoyant le nombre d'occurence du mot m dans le texte

   procedure Query_NbPref (L : in TListe_Couple; S : in String; NbMot : out Integer; NbOcc : out Integer);
   --Requete renvoyant le nombre de mot ayant s pour pr�fixe et le nombre d'occurence de s (Appel de query_NbOcc(s))

   procedure Query_NbSuff (L : in TListe_Couple; S : in String; NbMot : out Integer; NbOcc : out Integer);
   --Requete renvoyant le nombre de mot ayant s pour suffixe et le nombre d'occurence de s (Appel de query_NbOcc(s))

   procedure Query_NbFact (L : in TListe_Couple; S : in String; NbMot : out Integer; NbOcc : out Integer);
   --Requete renvoyant le nombre de mot ayant s pour facteur et le nombre d'occurence de s (Appel de query_NbOcc(s))

   procedure Creer_Fichier_Listemot (L : in TListe_Couple);
   --Procedure qui cr�e le fichier "liste-mot.txt" a partir de la liste de couple l
   --Le Fichier cr�� est de la forme suivante
   --Mot1 Nbocc1
   --Mot2 NbOcc2

   procedure Recup_Liste (L : in out TListe_Couple);
   --procedure qui recr�e la liste de couple a partir du fichier "liste-mot.txt"
   --le fichier n'est pas pass� en parametre car il sera cr�� auparavant par la fonction Creer_Fichier_Listemot
   --et donc le fichier existera forcement et pourra etre ouvert dans le corps de la fonction
   --declenche une exception si le fichier n'existe pas

   procedure AffichageN (L : in TListe_Couple; N : in Integer);
   -- affiche les N premiers mots de la liste
      
end Analyse_Lexicale_Couple;
