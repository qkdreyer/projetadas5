with Mot, Liste_Couple, Liste_Triplet;
use Mot, Liste_Couple, Liste_Triplet;

package Analyse_Lexicale is --Package permettant d'analyser le texte et d'effectuer les requetes dessus

   --utilisation de la liste generique
   use Liste_Couple.L;
   use Liste_Triplet.LT;   

   function CaractereAutorise (C : in Character) return Boolean;

   procedure Query_Liste_Couple (L : in out TListe_Couple; NomFic : in String);
   --Renvoit une liste comprenant tous les couples(mot;occurence) du texte, la
   --liste est tri�e par ordre alphabetique
   --je pense qu'il faudrait faire qu'on parcourt tout le texte
   --et qu'a chaque mot trouv� on l'insere de maniere tri�ee dans la liste qu'on renvoit
   --si on le trouve dans la liste alors on fait juste augmenter le nbOcc

   procedure Query_Liste_Triplet_Txt1 (L : in out TListe_Triplet; NomFic : in String);

   procedure Query_Liste_Triplet_Txt2 (L : in out TListe_Triplet; NomFic : in String);

   function Query_NbOcc (L : TListe_Couple; M : String) return Integer;
   --Requete renvoyant le nombre d'occurence du mot m dans le texte

   function Query_NbOcc_Txt1 (L : TListe_Triplet; M : String) return Integer;
   --Requete renvoyant le nombre d'occurence du mot m dans le texte 1

   function Query_NbOcc_Txt2 (L : TListe_Triplet; M : String) return Integer;
   --Requete renvoyant le nombre d'occurence du mot m dans le texte 2

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

   procedure Creer_Fichier_Listemot_T (L : in TListe_Triplet);
   --Procedure qui cr�e le fichier liste-mot.txt-y a partir de la liste de triplet l
   --Le Fichier cr�� est de la forme suivante
   --Mot1 NboccTxt1 NbOccTxt2
   --Mot2 NbOccTxt1 NbOccTxt2

   function Existe (Name : in String) return Boolean;

   procedure Recup_Liste (L : in out TListe_Couple);
   --procedure qui recr�e la liste de couple a partir du fichier "liste-mot.txt"
   --le fichier n'est pas pass� en parametre car il sera cr�� auparavant par la fonction Creer_Fichier_Listemot
   --et donc le fichier existera forcement et pourra etre ouvert dans le corps de la fonction
   --declenche une exception si le fichier n'existe pas

   procedure Recup_Liste_T (L : in out TListe_Triplet);
   --procedure qui recr�e la liste de couple a partir du fichier "liste-mot-t.txt"
   --le fichier n'est pas pass� en parametre car il sera cr�� auparavant par la fonction Creer_Fichier_Listemot_T
   --et donc le fichier existera forcement et pourra etre ouvert dans le corps de la fonction
   --declenche une exception si le fichier n'existe pas

   procedure AffichageN (L : in TListe_Couple; N : in Integer);
   -- affiche les N premiers mots de la liste

   procedure AffichageN_T (L : in TListe_Triplet; N : in Integer);
   -- affiche les N premiers mots de la liste   
   
   procedure Query_Intersection (T : in TListe_Triplet);
   -- affiche les mots communs de deux auteurs

   procedure Query_Difference (T : in TListe_Triplet);
   -- affiche les mots d'un auteur et pas de l'autre (et vice versa)
      
end Analyse_Lexicale;

