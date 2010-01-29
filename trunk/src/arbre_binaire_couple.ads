-- #################################################################################
-- #                                                                               #
-- #   Nom : arbre_binaire_couple.ads                                              #
-- #   Auteur : JAMBET Pierre                                                      #
-- #   Date de cr�ation : 21/01/2010                                               #
-- #   Date de modification : 28/01/2010                                           #   
-- #                                                                               #
-- #################################################################################

with Arbre_Binaire, Couple;
use Couple;

package Arbre_Binaire_Couple is
   
   -- Instanciation du paquetage Arbre_Binaire
   package AB is new Arbre_Binaire(T_Elem => T_Couple, Imprime => Imprime_Couple, ">" => Superieur_Couple_Lex, "=" => Egale_Couple_Lex);
   
   use AB;
   subtype TABR_Couple is AB.T_ABR;

   -- #################################################################################
   
   -- Instanciation des fonctions g�n�riques
   
   procedure Traitement_Doublon_Couple(A: in out Tabr_Couple);
   -- Gere les actions a executer en cas de doublon dans l'arbre
   -- Quand on tombe sur un doublon, on increment le NbOcc1 du Triplet

   procedure Modif_Fusion_Couple(A : in out TABR_Couple; E1,E2 : in T_Couple);
   
   procedure Fusion_Couple is new Fusion(Modif_Fusion => Modif_Fusion_Couple);
   
   -- #################################################################################
   
   -- Instanciation des procedures relatives � l'affichage d'un �l�ment
   
   procedure Affiche_Couple(A: in TABR_Couple);
   procedure Affiche_Post is new Postfixe(Traitement => Affiche_Couple);
   procedure Affiche_Inf is new Infixe(Traitement => Affiche_Couple);
   
   -- #################################################################################
   
   -- Instanciation des procedures relatives � la v�rification de l'arbre
   
   procedure Verification_Arbre(A: in TABR_Couple);
   procedure Verification_Arbre_Inf is new Infixe(Traitement => Verification_Arbre);
   procedure Verification_Arbre_Pre is new Prefixe(Traitement => Verification_Arbre);
   procedure Verification_Arbre_Post is new Postfixe(Traitement => Verification_Arbre);

   -- #################################################################################
   
   -- Instanciation des procedures relatives � l'insertion d'un �l�ment
   
   procedure Inserer_ABR_Couple is new Inserer_ABR(Superieur_Couple_Lex, Egale_Couple_Lex, Inferieur_Couple_Lex, Traitement_Doublon_couple);
   procedure Inserer_ARN_Couple is new Inserer_ARN(Superieur_Couple_Lex, Egale_Couple_Lex, Inferieur_Couple_Lex, Traitement_Doublon_Couple);
   procedure Inserer_ARN_Couple_Occ is new Inserer_Arn(Superieur_Couple_Occ, Egale_Couple_Occ, Inferieur_Couple_Occ, Traitement_Doublon_Couple);
   
   procedure Copie_Triee_Couple_Occ is new CopieTriee(Inserer => Inserer_Arn_Couple_Occ);

end Arbre_Binaire_Couple;
