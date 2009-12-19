with Mot;use Mot;
WITH Liste_Couple;USE Liste_Couple;

PACKAGE Analyse_Lexicale IS
   --Package permettant d'analyser le texte et d'effectuer les requetes dessus

   --utilisation de la liste generique
   USE Liste_Couple.L;

   FUNCTION CaractereAutorise (
         C : IN     Character)
     RETURN Boolean;

   PROCEDURE Query_Liste_Couple (
         L      : IN OUT TListe_Couple;
         NomFic : IN     String);
   --Renvoit une liste comprenant tous les couples(mot;occurence) du texte, la
   --liste est tri�e par ordre alphabetique
   --
   --je pense qu'il faudrait faire qu'on parcourt tout le texte
   --et qu'a chaque mot trouv� on l'insere de maniere tri�ee dans la liste qu'on renvoit
   --si on le trouve dans la liste alors on fait juste augmenter le nbOcc

   FUNCTION Query_NbOcc (
         L : TListe_Couple;
         M : String)
     RETURN Integer;
   --Requete renvoyant le nombre d'occurence du mot m dans le texte

   PROCEDURE Query_NbPref (
         L     : IN     TListe_Couple;
         S     : IN     String;
         NbMot :    OUT Integer;
         NbOcc :    OUT Integer);
   --Requete renvoyant le nombre de mot ayant s pour pr�fixe et le nombre d'occurence de s (Appel de query_NbOcc(s))

   PROCEDURE Query_NbSuff (
         L     : IN     TListe_Couple;
         S     : IN     String;
         NbMot :    OUT Integer;
         NbOcc :    OUT Integer);
   --Requete renvoyant le nombre de mot ayant s pour suffixe et le nombre d'occurence de s      (Appel de query_NbOcc(s))

   PROCEDURE Query_NbFact (
         L     : IN     TListe_Couple;
         S     : IN     String;
         NbMot :    OUT Integer;
         NbOcc :    OUT Integer);
   --Requete renvoyant le nombre de mot ayant s pour facteur et le nombre d'occurence de s (Appel de query_NbOcc(s))

   PROCEDURE Creer_Fichier_Listemot (
         L : IN     TListe_Couple);
   --Procedure qui cr�e le fichier "liste-mot.txt" a partir de la liste de couple l
   --Le Fichier cr�� est de la forme suivante
   ------------------------------------------
   --Mot1 Nbocc1
   --Mot2 NbOcc2
   --etc ...
   ------------------------------------------

   FUNCTION Existe (
         Name : IN     String)
     RETURN Boolean;

   PROCEDURE Recup_Liste (
         L : IN OUT TListe_Couple);
   --procedure qui recr�e la liste de couple a partir du fichier "liste-mot.txt"
   --le fichier n'est pas pass� en parametre car il sera cr�� auparavant par la fonction Creer_Fichier_Listemot
   --et donc le fichier existera forcement et pourra etre ouvert dans le corps de la fonction
   --declenche une exception si le fichier n'existe pas
   
procedure AffichageN (
         L : in     TListe_Couple;
         N : in     Integer);
      -- affiche les N premiers mots de la liste


END Analyse_Lexicale;

