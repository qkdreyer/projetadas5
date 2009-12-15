package body analyse_lexicale is

   procedure query_liste_couple(L: in out TListe_Couple; NomFic: in String) is
      --Renvoit une liste comprenant tous les couples(mot;occurence) du fichier texte NomFic
      Orig : File_Type; -- Fichier source
      Ligne : String(0..100);
      Last : Natural;
      C : Character;
      Mot : String(0..30);
   begin
      Open(Orig, In_File, NomFic);
      While not End_Of_File(Orig) loop
         if End_Of_Line(Orig) then
            Skip_Line(Orig);
         else
            while C /= ' ' or else C /= ',' loop -- On cr�e le mot
               Get(Orig, C);
               Mot := Mot + C;
            end loop;
            if EstMotSignificatif(Mot) then
               --faut pas ajouter le mot mais un couple
               AjoutFin(L, Mot); -- Ajoute dans la liste le premier mot significatif
            end if;
            Mot := "";
         end if;
      end loop;
      Close(Orig);
   end;

   function query_NbOcc(l: TListe_Couple; m: T_Mot) return Integer is
   --Requete renvoyant le nombre d'occurence du mot m dans le texte
   begin
      if EstVide(l) then
         return 0;
      elsif Get_Mot(Valeur(L)) = m then
         return 1+query_NbOcc(Suivant(L), m);
      else
         return query_NbOcc(Suivant(L), m);
      end if;
   end;

   procedure query_NbPref(l: in TListe_Couple; s: in T_Mot; nbMot: out Integer; nbOcc: out Integer) is
   --Requete renvoyant le nombre de mot ayant s pour pr�fixe et le nombre d'occurence de s (Appel de query_NbOcc(s))
   temp : TListe_Couple;
   res : Integer;
   begin
      temp := l;
      while not EstVide(Temp) loop
         if Estprefixede(Get_Mot(Valeur(Temp)), s) then
            res := res + 1;
         end if;
         temp := Suivant(Temp);
      end loop;
      nbMot := res;
      nbOcc := query_nbOcc(L,s);
   end;

   procedure query_NbSuff(l: in TListe_Couple; s: in T_Mot; nbMot: out Integer; nbOcc: out Integer) is
   --Requete renvoyant le nombre de mot ayant s pour suffixe et le nombre d'occurence de s (Appel de query_NbOcc(s))
   temp : TListe_Couple;
   res : Integer;
   begin
      temp := l;
      while not Estvide(Temp) loop
         if Estsuffixede(Get_Mot(Valeur(Temp)), s) then
            res := res + 1;
         end if;
         temp := Suivant(Temp);
      end loop;
      nbMot := res;
      nbOcc := query_nbOcc(L,s);
   end;

   procedure query_NbFact(l: in TListe_Couple; s: in T_Mot; nbMot: out Integer; nbOcc: out Integer) is
   --Requete renvoyant le nombre de mot ayant s pour facteur et le nombre d'occurence de s (Appel de query_NbOcc(s))
   temp : TListe_Couple;
   res : Integer;
   begin
      temp := l;
      while not EstVide(Temp) loop
         if Estfacteurde(Get_Mot(Valeur(Temp)), s) then
            res := res + 1;
         end if;
         temp := Suivant(Temp);
      end loop;
      nbMot := res;
      nbOcc := query_nbOcc(L,s);
   end;

   procedure Creer_Fichier_Listemot(L: in TListe_Couple) is
   --Procedure qui cr�e le fichier listeMot a partir de la liste de couple l
   --Le Fichier cr�� est de la forme suivante
   ------------------------------------------
   --Mot1 Nbocc1
   --Mot2 NbOcc2
   --etc ...
   ------------------------------------------
   begin
      --TODO
      null;
   end;

   procedure Recup_Liste(L: out TListe_Couple) is
   --procedure qui recr�e la liste de couple a partir du fichier "liste-mot.txt"
   --le fichier n'est pas pass� en parametre car il sera cr�� auparavant par la fonction Creer_Fichier_Listemot
   --et donc le fichier existera forcement et pourra etre ouvert dans le corps de la fonction
   --declenche une exception si le fichier n'existe pas
   begin
      --TODO
      null;
   end;


end analyse_lexicale;

