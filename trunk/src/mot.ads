-- #################################################################################
-- #                                                                               #
-- #   Nom : mot.ads                                                               #
-- #   Auteur : JAMBET Pierre                                                      #
-- #   Date de cr�ation : 17/12/2009                                               #
-- #   Date de modification : 18/01/2010                                           #   
-- #                                                                               #
-- #################################################################################

--Nous avons choisi de definir le type mot par une chaine de 30 caracteres
--En effet dans la langue francaise le plus long mot �tant de 26 lettre, nous avons
--choisi une taille maximale legerement superieure pour eviter tout probleme.
--Les �ventuels mots de plus de 30 lettres ne seront donc pas enregistr�s dans leur totalit�

with Ada.Text_IO;
use Ada.Text_IO;

package Mot is
  
   type T_Mot is private;

   function Creer_Mot(S : String) return T_Mot;
   function MotVide(M : T_Mot) return Boolean;

   -- #################################################################################
   
   -- Accesseurs en lecture aux �l�ments du T_Mot
   
   function Get_Chaine(M : T_Mot) return String;
   function Get_Fin(M : T_Mot) return Integer;
   
   -- #################################################################################
   
   -- Accesseurs en �criture aux �l�ments du T_Mot
   
   procedure Set_Chaine(M : in out T_Mot; S : in String);
   procedure Set_Fin(M : in out T_Mot; I : in Integer);
   
   -- #################################################################################
   
   function Get_Char(M : T_Mot) return Character;
   -- Renvoie le premier element de M  
   
   function Get_CharSuffixe(M : T_Mot) return T_Mot;
   -- Renvoie le T_Mot priv� du premier element
	  
   -- #################################################################################
   
   --- Red�finition des fonctions "<", ">" et "=" pour un T_Mot
   
   function Superieur_Mot(M1, M2 : T_Mot) return Boolean;
   function Inferieur_Mot(M1, M2 : T_Mot) return Boolean;
   function Egale_Mot(M1, M2 : T_Mot) return Boolean;
   
   -- #################################################################################
   
   function Compare_Mots(M1, M2 : T_Mot) return Boolean;
   function Compare_Chaine_Mot(S : String; M : T_Mot) return Boolean;
   --Compare une chaine avec le mot contenu dans T_Couple
   --renvoie vrai si S = M.mot
   --renvoie faux sinon
   --On a besoin de cette fonction pour utiliser l'indice de fin contenu dans le couple

   function EstMotSignificatif(M : T_Mot) return Boolean;
   --Renvoie vrai si le mot T est significatif. un mot est significatif si il
   --est de longueur supérieur a 3 ou si il est de longeur de 3 et qu'il est
   --est un "petit mot important" (cf petits-mots.txt)

   function EstLongMot(M : T_Mot) return Boolean;
   --Renvoie vrai si le mot T est de longueur strictement supérieur a 3

   function EstPetitMotImp(M : T_Mot) return Boolean;
   --Renvoie true si T est de longueur 3 et qu'il fait parti du fichier
   --petits-mots.txt

   function EstSuffixeDe(M1 : T_Mot; M2 : T_Mot) return Boolean;
   --precondition : taille(M1) < taille(M2)
   --Renvoie true si M1 est suffixe de M2, false sinon
   --exemple : M1 : "ment" M2 = "lentement"
   --La fonction renvoie vrai

   function EstPrefixeDe(M1 : T_Mot; M2 : T_Mot) return Boolean;
   --precondition : taille(M1) < taille(M2)
   --Renvoie true si M1 est prefixe de M2, false sinon
   --exemple : M1 = "lent" M2="lentement"
   --La fonction renvoie vrai

   function EstFacteurDe(M1 : T_Mot; M2 : T_Mot) return boolean;
   --precondition : taille(M1)<taille(M2)
   --Renvoie true si M2 est facteur de M2, false sinon
   --exemple : M1 = "bbb" M2 = "abbba"
   --La fonction renvoie vrai

private

      type T_Mot is record
         Chaine : String(1 .. 30);
         Fin: Integer;
      end record;

end Mot;
