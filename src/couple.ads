-- #################################################################################
-- #                                                                               #
-- #   Nom : couple.ads                                                            #
-- #   Auteur : JAMBET Pierre                                                      #
-- #   Date de cr�ation : 06/12/2009                                               #
-- #   Date de modification : 23/01/2010                                           #   
-- #                                                                               #
-- #################################################################################

-- Le type Couple est un agr�gat d'un T_Mot et du nombre d'occurence de ce mot

with Mot;
use Mot;

package Couple is

   type T_Couple is private;

   function Creer_Couple(M : in T_Mot; N : in Integer) return T_Couple;
   -- Cr�e un couple
   
   procedure Imprime_Couple(C : in T_Couple);
   -- Procedure permettant d'afficher le T_Couple

   function ToString(C : in T_Couple) return String;
   -- Fonction qui transforme le T_Couple en String

   -- #################################################################################
   
   -- Accesseurs en �criture aux �lements du T_Couple
   
   procedure Set_Mot(C : in out T_Couple; M : in T_Mot); -- Get_Mot(Set_Mot(C,M))=M
   procedure Set_NbOcc(C : in out T_Couple; E : in Integer); -- Get_Nbocc(Set_NbOcc(C,E))=E

   -- #################################################################################
   
   -- Accesseurs en lecture aux �l�ments du T_Couple
   
   function Get_Mot(C : T_Couple) return T_Mot;
   function Get_NbOcc(C : T_Couple) return Integer;

   -- #################################################################################
   
   -- Red�finition des fonctions "<", ">" et "=" (Tri par ordre lexicographique)
   
   function Inferieur_Couple_Lex(Couple1 : T_Couple; Couple2 : T_Couple) return Boolean;
   function Superieur_Couple_Lex(Couple1 : T_Couple; Couple2 : T_Couple) return Boolean;
   function Egale_Couple_Lex(Couple1 : T_Couple; Couple2 : T_Couple) return Boolean;

   -- #################################################################################
   
   -- Red�finition des fonctions "<", ">" et "=" (Tri par nombre d'occurence d�croissante)
   
   function Inferieur_Couple_Occ(Couple1 : T_Couple; Couple2 : T_Couple) return Boolean;
   function Superieur_Couple_Occ(Couple1 : T_Couple; Couple2 : T_Couple) return Boolean;
   function Egale_Couple_Occ(Couple1 : T_Couple; Couple2 : T_Couple) return Boolean;

private

   type T_Couple is record
      Mot: T_Mot;
      NbOcc: Integer;
   end record;

end Couple;
