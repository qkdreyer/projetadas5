-- #################################################################################
-- #                                                                               #
-- #   Nom : anaylyse_lexicale.ads                                                 #
-- #   Auteur : DREYER Quentin                                                     #
-- #   Date de cr�ation : 06/12/2009                                               #
-- #   Date de modification : 25/01/2010                                           #   
-- #                                                                               #
-- #################################################################################

with Mot, Liste_Couple, Liste_Triplet, Arbre_Binaire_Couple, Arbre_Binaire_Triplet, Trie, Ada.Text_IO;
use Mot, Liste_Couple, Liste_Triplet, Arbre_Binaire_Couple, Arbre_Binaire_Triplet, Trie, Ada.Text_IO;

package Analyse_Lexicale is

   function CaractereAutorise (C : in Character) return Boolean;
   -- Renvoit vrai si le caractere est autorise en tant que caractere d'un mot, faux sinon
   
   function Existe (Name : in String) return Boolean;
   -- Renvoit vrai si le fichier Name existe, faux sinon

   -- #################################################################################
 
   -- Renvoit une liste(ou autre structure de donn�es) comprenant tous les couples(mot;occurence) du texte, la
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
   
   -- Procedure auxiliaire liee a Creer_Fichier
   
   procedure Ecriture_Dest_Txt1(T : in T_Trie; C : in String; F : in Natural; D : in File_Type);
   procedure Ecriture_Dest_Txt2(T : in T_Trie; C : in String; F : in Natural; D : in File_Type);
   procedure Ecriture_Dest_Txt1(Ab : in Tabr_Couple; D : in File_Type);
   procedure Ecriture_Dest_Txt2(Ab : in Tabr_Triplet; D : in File_Type);
   
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
   
   -- Procedure qui affiche N elements de la structure en fonction du nombre d'occurence
   
   procedure AffichageN (L : in TListe_Couple; N : in Integer); 
   procedure AffichageN (L : in TListe_Triplet; N : in Integer);
   procedure AffichageN (A : in TABR_Couple; N : in Integer);
   procedure AffichageN (A : in TABR_Triplet; N : in Integer);
   procedure AffichageN_Txt1 (T : in T_Trie; N : in Integer);
   procedure AffichageN_Txt2 (T : in T_Trie; N : in Integer);
   
   -- #################################################################################
      
   -- Renvoit le nombre d'occurence du mot M dans le texte 1 ou 2
   
   function Query_NbOcc (L : in TListe_Couple; M : in T_Mot) return Integer;
   function Query_NbOcc_Txt1 (L : in TListe_Triplet; M : in T_Mot) return Integer;
   function Query_NbOcc_Txt2 (L : in TListe_Triplet; M : in T_Mot) return Integer;
   function Query_NbOcc (A : in TABR_Couple; M : in T_Mot) return Integer;
   function Query_NbOcc_Txt1 (A : in TABR_Triplet; M : in T_Mot) return Integer;
   function Query_NbOcc_Txt2 (A : in TABR_Triplet; M : in T_Mot) return Integer;
   function Query_NbOcc_Txt1 (T : in T_Trie; M : in T_Mot) return Integer;   
   function Query_NbOcc_Txt2 (T : in T_Trie; M : in T_Mot) return Integer;
   
   -- #################################################################################
   
   -- Renvoit le nombre de mot ayant M pour pr�fixe

   function Query_NbPref (L : in TListe_Couple; M : in T_Mot) return Integer;
   function Query_NbPref_Txt1 (L : in TListe_Triplet; M : in T_Mot) return Integer;
   function Query_NbPref_Txt2 (L : in TListe_Triplet; M : in T_Mot) return Integer;
   function Query_NbPref (A : in TABR_Couple; M : in T_Mot) return Integer;
   function Query_NbPref_Txt1 (A : in TABR_Triplet; M : in T_Mot) return Integer;
   function Query_NbPref_Txt2 (A : in TABR_Triplet; M : in T_Mot) return Integer;
   procedure Query_NbPref_Txt1 (T : in T_Trie; C : in String; F : in Natural; M : in T_Mot; S : in out Integer);
   procedure Query_NbPref_Txt2 (T : in T_Trie; C : in String; F : in Natural; M : in T_Mot; S : in out Integer);
   
   -- #################################################################################

   -- Renvoit le nombre de mot ayant M pour suffixe

   function Query_NbSuff (L : in TListe_Couple; M : in T_Mot) return Integer;
   function Query_NbSuff_Txt1 (L : in TListe_Triplet; M : in T_Mot) return Integer;
   function Query_NbSuff_Txt2 (L : in TListe_Triplet; M : in T_Mot) return Integer;
   function Query_NbSuff (A : in TABR_Couple; M : in T_Mot) return Integer;
   function Query_NbSuff_Txt1 (A : in TABR_Triplet; M : in T_Mot) return Integer;
   function Query_NbSuff_Txt2 (A : in TABR_Triplet; M : in T_Mot) return Integer;
   procedure Query_NbSuff_Txt1 (T : in T_Trie; C : in String; F : in Natural; M : in T_Mot; S : in out Integer);
   procedure Query_NbSuff_Txt2 (T : in T_Trie; C : in String; F : in Natural; M : in T_Mot; S : in out Integer);

   -- #################################################################################

   -- Renvoit le nombre de mot ayant M pour facteur

   function Query_NbFact (L : in TListe_Couple; M : in T_Mot) return Integer;
   function Query_NbFact_Txt1 (L : in TListe_Triplet; M : in T_Mot) return Integer;
   function Query_NbFact_Txt2 (L : in TListe_Triplet; M : in T_Mot) return Integer;
   function Query_NbFact (A : in TABR_Couple; M : in T_Mot) return Integer;
   function Query_NbFact_Txt1 (A : in TABR_Triplet; M : in T_Mot) return Integer;
   function Query_NbFact_Txt2 (A : in TABR_Triplet; M : in T_Mot) return Integer;
   procedure Query_NbFact_Txt1 (T : in T_Trie; C : in String; F : in Natural; M : in T_Mot; S : in out Integer);
   procedure Query_NbFact_Txt2 (T : in T_Trie; C : in String; F : in Natural; M : in T_Mot; S : in out Integer);

   -- #################################################################################

   -- Procedure qui affiche les mots communs de deux auteurs
   
   procedure Query_Intersection (L : in TListe_Triplet);
   procedure Query_Intersection (A : in TABR_Triplet);
   procedure Query_Intersection (T : in T_Trie; C : in String; F : in Natural);
      
   -- #################################################################################
   
   -- Procedure qui affiche les mots d'un auteur et pas de l'autre (et vice versa)
   
   procedure Query_Difference (L : in TListe_Triplet);
   procedure Query_Difference (A : in TABR_Triplet);
   procedure Query_Difference (T : in T_Trie; C : in String; F : in Natural);
   
end Analyse_Lexicale;
