with Ada.Text_Io; use Ada.Text_Io;
with Ada.Unchecked_Deallocation;

generic
   type T_Elem is private;
   with procedure Imprime(X: in T_Elem);
   --Affiche L'element X


package ListeGen is
   --Implementation d'une structure de donn�es de type liste
   --doublement chain�e avec structure de controle(les modifications sont en cours).
   --Les elements stock�es par la liste sont de type generiques

   type T_Liste is private;
   ListeVideException: exception;
   Elt_Inexistant: Exception;

   function Valeur(L: T_Liste) return T_Elem;
   --Renvoie l'element contenu dans L
   --Declenche une ListeVideException si L est null

   function Suivant(L: T_Liste) return T_Liste;
   --Renvoie le suivant de L si il existe
   --Declenche une ListeVideException si L est null ou si son suivant est null

   function Precedent(L: T_Liste) return T_Liste;
   --Renvoie le precedent de L si il existe
   --Declenche une ListeVideException si L est null ou si son precedent est null

   function CreerListe return T_Liste;
   --Cr�e une liste vide

   function EstVide(L: T_Liste) return Boolean;
   --Teste la vacuit� de la liste L, vrai si elle est vide, faux sinon

   procedure Affiche(L: in T_Liste);
   --Affiche la liste dans la console
   --Utilise Imprime qui est generic

   procedure AjoutFin(L: in out T_Liste;X: in T_Elem);
   --Ajoute l'element � la fin de la liste L

   procedure AjoutDebut(L: in out T_Liste;X: in T_Elem);
   --Ajoute l'entier X avant le premier element de la liste L

   function Premier(L: T_Liste) return T_Elem;
   --Renvoie la valeur(de type Entier) du premier element de L
   --erreur dans le cas de la liste vide

   function Dernier(L: T_Liste) return T_Elem;
   --Renvoie la valeur(de type Entier) du dernier element de L
   --erreyr dans le cas de la liste vide

   function NbOcc(L: T_Liste;X: T_Elem) return Integer;
   --Renvoie le nombre d'occurence de X dans L
   --renvoie 0 dans le cas d'une liste vide

   procedure InsererAvant(L: in out T_Liste;X: in T_Elem;Y: T_Elem);
   --Insere l'element X directement avant l'element Y dans la liste L
   --erreur si Y n'est pas dans L

   procedure InsererApres(L: in out T_Liste;X: in T_Elem;Y: T_Elem);
   --Insere l'element X directement apres l'element Y dans la liste L
   --erreur si Y n'est pas dans L

   procedure Supprimer(L: in out T_Liste;X: in T_Elem);
   --Supprime la premiere occurence de X dans la liste L
   --n'a aucun effet dans le cas d'une liste vide

   function Index(L: T_Liste;X: T_Elem) return Integer;
   --Renvoie l'indice de la premiere occurende de l'element X de la liste L
   --L'indexage commence a partir de 0

   function EltInd(L: T_Liste;X: Integer) return T_Elem;
   --Renvoie l'element se trouvant a l'index X de la liste L
   --L'indexage commence a partir de 0

   procedure RetireInd(L: in out T_Liste;X: in Integer);
   --Retire de la liste l'element se trouvant a l'indice X

   function EtendListe(L1: T_Liste;L2: T_Liste)return T_Liste;
   --Concatene les listes L et P
   --En sortie on obtient L = [L,P]

   generic
      with procedure InsererTriee(L: in out T_Liste;X: in T_Elem);
   function CopieTriee(L: T_Liste) return T_Liste;
   --Fonction qui renvoit une deuxieme liste L2 qui contient
   --les memes elements que L mais tri� par ordre croissant
   --La fonction apelle la procedure InsererTri�e ci dessous

   generic
       with function ">"(T1,T2: T_Elem)return Boolean is <>;
       with function "="(T1,T2: T_Elem)return Boolean is <>;
       with function "<"(T1,T2: T_Elem)return Boolean is <>;
   procedure InsererTriee(L: in out T_Liste;X: in T_Elem);
   --L est tri�e par ordre croissant
   --Insere X dans L de maniere a conserver le tri de L

   generic
      with procedure Modif_Fusion(L1,L2: in out T_Liste);
   procedure Fusion(L: in out T_Liste; L1,L2: in out T_Liste);
   --Fusionne m2 dans m1 en supprimant m2 et augmentant l'occurence de m1
   --precondition : L1,L2 /= null
   --L'element point� par L2 est fusionn� dans L2
   --Fusionne L2 dans L1 en supprimant L2 et en appliquant a L1 la procedure modif_Fusion
   --Comme on modifie le champ point� par L1 en y fusionnant L2, il faut y faire des modifications
   --Ces modifications sont d�crites dans la procedure generique Modif_Fusion

   function CopieInverse(L: T_Liste)return T_Liste;
   --Modifie L de maniere a ce que tous les elements soient dans l'ordre
   --inverse par rapport a la liste originale




private
   type Cellule;
   type T_Liste is access Cellule;
   type Cellule is record
      Val: T_Elem;
      Prec: T_Liste;
      Suiv: T_Liste;
   end record;

end ListeGen;
