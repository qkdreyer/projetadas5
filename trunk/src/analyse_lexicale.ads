with Liste_Couple, Liste_Triplet, Arbre_Binaire_Couple, Arbre_Binaire_Triplet, Trie;
use Liste_Couple, Liste_Triplet, Arbre_Binaire_Couple, Arbre_Binaire_Triplet, Trie;

package Analyse_Lexicale is

   function CaractereAutorise (C : in Character) return Boolean;
   -- Renvoit vrai si le caractere est autorise en tant que caractere d'un mot, faux sinon
   
   function Existe (Name : in String) return Boolean;
   -- Renvoit vrai si le fichier Name existe, faux sinon

   -- #################################################################################
 
   -- Renvoit une liste comprenant tous les couples(mot;occurence) du texte, la
   -- liste est tri�e par ordre alphabetique
   
   procedure Query_Struct (L : in out TListe_Couple; NomFic : in String);
   procedure Query_Struct_Txt1 (L : in out TListe_Triplet; NomFic : in String);
   procedure Query_Struct_Txt2 (L : in out TListe_Triplet; NomFic : in String);
   procedure Query_Struct (A : in out TABR_Couple; NomFic : in String);
   procedure Query_Struct_Txt1 (A : in out TABR_Triplet; NomFic : in String);
   procedure Query_Struct_Txt2 (A : in out TABR_Triplet; NomFic : in String);        
   procedure Query_Struct_Txt1 (T : in out T_Trie; NomFic : in String);
   procedure Query_Struct_Txt2 (T : in out T_Trie; NomFic : in String);
   
   -- #################################################################################
   
   -- Procedure qui cr�e le fichier "liste-mot.txt" a partir de la structure creee
   -- Le fichier cree est de la forme suivante :
   -- Mot1 Nbocc1Txt1 (NbOcc1Txt2)
   -- Mot2 NbOcc2Txt2 (NbOcc2Txt2)
   
   procedure Creer_Fichier (L : in TListe_Couple);
   procedure Creer_Fichier (L : in TListe_Triplet);   
   procedure Creer_Fichier (A : in out TABR_Couple);
   procedure Creer_Fichier (A : in out TABR_Triplet);
   procedure Creer_Fichier_Txt1 (T : in T_Trie);
   procedure Creer_Fichier_Txt2 (T : in T_Trie);
   
   -- #################################################################################
   
   -- Procedure qui recr�e la liste de couple a partir du fichier "liste-mot.txt"
   -- le fichier n'est pas pass� en parametre car il sera cr�� auparavant par la fonction Creer_Fichier
   -- et donc le fichier existera forcement et pourra etre ouvert dans le corps de la fonction
   -- Declenche une exception si le fichier n'existe pas
   
   procedure Recup_Fichier (L : in out TListe_Couple);
   procedure Recup_Fichier (L : in out TListe_Triplet);
   procedure Recup_Fichier (A : in out TABR_Couple);
   procedure Recup_Fichier (A : in out TABR_Triplet);
   procedure Recup_Fichier_Txt1 (T : in out T_Trie);
   procedure Recup_Fichier_Txt2 (T : in out T_Trie);
   
   -- #################################################################################
   
   function Query_NbOcc_Txt1 (L : TListe_Triplet; M : String) return Integer;
   --Requete renvoyant le nombre d'occurence du mot m dans le texte 1

   function Query_NbOcc_Txt2 (L : TListe_Triplet; M : String) return Integer;
   --Requete renvoyant le nombre d'occurence du mot m dans le texte 2

   procedure Query_Intersection (T : in TListe_Triplet);
   -- affiche les mots communs de deux auteurs

   procedure Query_Difference (T : in TListe_Triplet);
   -- affiche les mots d'un auteur et pas de l'autre (et vice versa)

   procedure AffichageN(L : in TListe_Couple; N : in Integer);
   -- affiche les N premiers mots de la liste 
   
   procedure AffichageN_T (L : in TListe_Triplet; N : in Integer);
   -- affiche les N premiers mots de la liste    
   
end Analyse_Lexicale;
