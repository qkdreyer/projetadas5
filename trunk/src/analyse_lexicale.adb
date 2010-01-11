with Ada.Text_IO, Couple, Triplet, Ada.Characters.Handling;
use Ada.Text_IO, Couple, Triplet, Ada.Characters.Handling;

package body Analyse_Lexicale is

   function CaractereAutorise (
         C : in     Character)
     return Boolean is
      -- Renvoit vrai si le caractere est autorise en tant que caractere d'un mot, faux sinon
   begin
      if C = Character'Val(32) then -- ' '
         return False;
      elsif C = Character'Val(33) then -- '!'
         return False;
      elsif C = Character'Val(34) then -- '"'
         return False;
      elsif C = Character'Val(35) then -- '#'
         return False;
      elsif C = Character'Val(36) then -- '$'
         return False;
      elsif C = Character'Val(37) then -- '%'
         return False;
      elsif C = Character'Val(38) then -- '&'
         return False;
      elsif C = Character'Val(40) then -- '('
         return False;
      elsif C = Character'Val(41) then -- ')'
         return False;
      elsif C = Character'Val(42) then -- '*'
         return False;
      elsif C = Character'Val(43) then -- '+'
         return False;
      elsif C = Character'Val(44) then -- ','
         return False;
      elsif C = Character'Val(46) then -- '.'
         return False;
      elsif C = Character'Val(47) then -- '/'
         return False;
      elsif C = Character'Val(58) then -- ':'
         return False;
      elsif C = Character'Val(59) then -- ';'
         return False;
      elsif C = Character'Val(60) then -- '<'
         return False;
      elsif C = Character'Val(61) then -- '='
         return False;
      elsif C = Character'Val(62) then -- '>'
         return False;
      elsif C = Character'Val(63) then -- '?'
         return False;
      elsif C = Character'Val(64) then -- '@'
         return False;
      elsif C = Character'Val(91) then -- '['
         return False;
      elsif C = Character'Val(92) then -- '\'
         return False;
      elsif C = Character'Val(93) then -- ']'
         return False;
      elsif C = Character'Val(94) then -- '^'
         return False;
      elsif C = Character'Val(95) then -- '_'
         return False;
      elsif C = Character'Val(96) then -- '`'
         return False;
      elsif C = Character'Val(10) then -- LF
         return False;
      elsif C = Character'Val(13) then -- CR
         return False;
      else
         return True;
      end if;
   end;

   procedure Query_Liste_Couple (
         L      : in out TListe_Couple;
         NomFic : in     String) is
      --Renvoit une liste comprenant tous les couples(mot;occurence) du fichier texte NomFic
      Orig   : File_Type;        -- Fichier source
      C      : Character;
      Mot    : String (1 .. 30);
      Indice : Integer;
      Couple : T_Couple;
      M      : T_Mot;
   begin
      Indice := 0;
      C := Character'Val(0);
      Open(Orig, In_File, NomFic);
      Put("Debut lecture");
      while not End_Of_File(Orig) loop
         if End_Of_Line(Orig) then
            Indice := 0;
            Skip_Line(Orig);
         else -- non(End_Of_Line(Orig))
            Get(Orig, C);
            if CaractereAutorise(C) then -- On cr�e le mot
               Indice := Indice + 1;
               if Is_Upper(C) then
                  C := To_Lower(C);
               end if;
               Mot(Indice) := C;
            else -- non(CaractereAutorise(C))
               -- TEST Put_Line("Mot 1 .." & Integer'Image(Indice) & " : " & Mot(1 .. Indice));
               Put(".");
               M := Creer_Mot(Mot(1 .. Indice));
               if EstMotSignificatif(M) then
                  Set_Mot(Couple, M);
                  Set_NbOcc(Couple, 1);
                  --Set_Fin(Couple, Indice);
                  InsererTriee_Couple_Lex(L, Couple); -- Ajoute dans la liste le premier mot significatif
               end if;
               Indice := 0;
               C := Character'Val(0);
            end if;
         end if;
      end loop;
      Close(Orig);
      New_Line;
      Put_Line("Fin lecture !");
      Skip_Line;
   end;
   
   procedure Query_Liste_Triplet_Txt1 (
         L      : in out TListe_Triplet;
         NomFic : in     String) is
      --Renvoit une liste comprenant tous les couples(mot;occurence) du fichier texte NomFic
      Orig   : File_Type;        -- Fichier source
      C      : Character;
      Mot    : String (1 .. 30);
      Indice : Integer;
      Triplet : T_Triplet;
      M      : T_Mot;
   begin
      Indice := 0;
      C := Character'Val(0);
      Open(Orig, In_File, NomFic);
      Put("Debut lecture");
      while not End_Of_File(Orig) loop
         if End_Of_Line(Orig) then
            Indice := 0;
            Skip_Line(Orig);
         else -- non(End_Of_Line(Orig))
            Get(Orig, C);
            if CaractereAutorise(C) then -- On cr�e le mot
               Indice := Indice + 1;
               if Is_Upper(C) then
                  C := To_Lower(C);
               end if;
               Mot(Indice) := C;
            else -- non(CaractereAutorise(C))
               -- TEST Put_Line("Mot 1 .." & Integer'Image(Indice) & " : " & Mot(1 .. Indice));
               Put(".");
               M := Creer_Mot(Mot(1 .. Indice));
               if EstMotSignificatif(M) then
                  Triplet := Creer_Triplet(M, 1, 0);
                  --Set_Fin(Couple, Indice);
                  InsererTriee_Triplet_Lex_Txt1(L, Triplet); -- Ajoute dans la liste le premier mot significatif
               end if;
               Indice := 0;
               C := Character'Val(0);
            end if;
         end if;
      end loop;
      Close(Orig);
      New_Line;
      Put_Line("Fin lecture !");
      Skip_Line;
   end;
   
   procedure Query_Liste_Triplet_Txt2 (
         L      : in out TListe_Triplet;
         NomFic : in     String) is
      --Renvoit une liste comprenant tous les couples(mot;occurence) du fichier texte NomFic
      Orig   : File_Type;        -- Fichier source
      C      : Character;
      Mot    : String (1 .. 30);
      Indice : Integer;
      Triplet : T_Triplet;
      M      : T_Mot;
   begin
      Indice := 0;
      C := Character'Val(0);
      Open(Orig, In_File, NomFic);
      Put("Debut lecture");
      while not End_Of_File(Orig) loop
         if End_Of_Line(Orig) then
            Indice := 0;
            Skip_Line(Orig);
         else -- non(End_Of_Line(Orig))
            Get(Orig, C);
            if CaractereAutorise(C) then -- On cr�e le mot
               Indice := Indice + 1;
               if Is_Upper(C) then
                  C := To_Lower(C);
               end if;
               Mot(Indice) := C;
            else -- non(CaractereAutorise(C))
               -- TEST Put_Line("Mot 1 .." & Integer'Image(Indice) & " : " & Mot(1 .. Indice));
               Put(".");
               M := Creer_Mot(Mot(1 .. Indice));
               if EstMotSignificatif(M) then
                  Triplet := Creer_Triplet(M, 0, 1);
                  --Set_Fin(Couple, Indice);
                  InsererTriee_Triplet_Lex_Txt2(L, Triplet); -- Ajoute dans la liste le premier mot significatif
               end if;
               Indice := 0;
               C := Character'Val(0);
            end if;
         end if;
      end loop;
      Close(Orig);
      New_Line;
      Put_Line("Fin lecture !");
      Skip_Line;
   end;

   function Query_NbOcc (
         L : TListe_Couple;
         M : String)
     return Integer is
      --Requete renvoyant le nombre d'occurence du mot m dans le texte
   begin
      if EstVide(L) then
         return 0;
      elsif Compare_Chaine_Mot(M,Get_Mot(Valeur(L))) then
         return Get_NbOcc(Valeur(L));
      else
         return Query_NbOcc(Suivant(L), M);
      end if;
   end;

   function Query_NbOcc_Txt1 (
         L : TListe_Triplet;
         M : String)
     return Integer is
      --Requete renvoyant le nombre d'occurence du mot m dans le texte 1
   begin
      if EstVide(L) then
         return 0;
      elsif Compare_Chaine_Mot(M, Get_Mot_T(Valeur(L))) then
         return Get_NbOcc1(Valeur(L));
      else
         return Query_NbOcc_Txt1(Suivant(L), M);
      end if;
   end;

   function Query_NbOcc_Txt2 (
         L : TListe_Triplet;
         M : String)
     return Integer is
      --Requete renvoyant le nombre d'occurence du mot m dans le texte 2
   begin
      if EstVide(L) then
         return 0;
      elsif Compare_Chaine_Mot(M, Get_Mot_T(Valeur(L))) then
         return Get_NbOcc2(Valeur(L));
      else
         return Query_NbOcc_Txt2(Suivant(L), M);
      end if;
   end;

   procedure Query_NbPref (
         L     : in     TListe_Couple;
         S     : in     String;
         NbMot :    out Integer;
         NbOcc :    out Integer) is
      --Requete renvoyant le nombre de mot ayant s pour pr�fixe et le nombre d'occurence de s (Appel de query_NbOcc(s))
      Temp : TListe_Couple;
      Res  : Integer;
      MotS : T_Mot;
   begin
      Res := 0;
      Temp := L;
      MotS := Creer_Mot(S);
      while not EstVide(Temp) loop
         if Estprefixede(Get_Mot(Valeur(Temp)), MotS) then
            Res := Res + 1;
         end if;
         Temp := Suivant(Temp);
      end loop;
      NbMot := Res;
      NbOcc := Query_NbOcc(L,S);
   end;

   procedure Query_NbSuff (
         L     : in     TListe_Couple;
         S     : in     String;
         NbMot :    out Integer;
         NbOcc :    out Integer) is
      --Requete renvoyant le nombre de mot ayant s pour suffixe et le nombre d'occurence de s (Appel de query_NbOcc(s))
      Temp : TListe_Couple;
      Res  : Integer;
      MotS : T_Mot;
   begin
      Res := 0;
      Temp := L;
      MotS := Creer_Mot(S);
      while not Estvide(Temp) loop
         if Estsuffixede(Get_Mot(Valeur(Temp)), MotS) then
            Res := Res + 1;
         end if;
         Temp := Suivant(Temp);
      end loop;
      NbMot := Res;
      NbOcc := Query_NbOcc(L,S);
   end;

   procedure Query_NbFact (
         L     : in     TListe_Couple;
         S     : in     String;
         NbMot :    out Integer;
         NbOcc :    out Integer) is
      --Requete renvoyant le nombre de mot ayant s pour facteur et le nombre d'occurence de s (Appel de query_NbOcc(s))
      Temp : TListe_Couple;
      Res  : Integer;
      MotS : T_Mot;
   begin
      Res := 0;
      Temp := L;
      MotS := Creer_Mot(S);
      while not EstVide(Temp) loop
         if Estfacteurde(Get_Mot(Valeur(Temp)), MotS) then
            Res := Res + 1;
         end if;
         Temp := Suivant(Temp);
      end loop;
      NbMot := Res;
      NbOcc := Query_NbOcc(L,S);
   end;

   procedure Creer_Fichier_Listemot (
         L : in     TListe_Couple) is
      --Procedure qui cr�e le fichier liste-mot.txt a partir de la liste de couple l
      --Le Fichier cr�� est de la forme suivante
      ------------------------------------------
      --Mot1 Nbocc1
      --Mot2 NbOcc2
      --etc ...
      ------------------------------------------
      Dest : File_Type;
      Temp : TListe_Couple;
   begin
      Temp := L;
      Create(Dest, Name => "liste-mot.txt");
      Put("Debut creation");
      while not EstVide(Temp) loop
         Put(Dest, Get_Chaine(Get_Mot(Premier(Temp)))(1 .. Get_Fin(Get_Mot(Premier(Temp)))));
         Put_Line(Dest, Integer'Image(Get_NbOcc(Premier(Temp))));
         Temp := Suivant(Temp);
         Put(".");
      end loop;
      New_Line(Dest);
      Close(Dest);
      New_Line;
      Put_Line("Fin creation !");
      Skip_Line;
   end;

   procedure Creer_Fichier_Listemot_T (
         L : in     TListe_Triplet) is
      --Procedure qui cr�e le fichier liste-mot.txt-y a partir de la liste de triplet l
      --Le Fichier cr�� est de la forme suivante
      ------------------------------------------
      --Mot1 NboccTxt1 NbOccTxt2
      --Mot2 NbOccTxt1 NbOccTxt2
      --etc ...
      ------------------------------------------
      Dest : File_Type;
      Temp : TListe_Triplet;
   begin
      Temp := L;
      Create(Dest, Name => "liste-mot-t.txt");
      Put("Debut creation");
      while not EstVide(Temp) loop
         Put(Dest, Get_Chaine(Get_Mot_T(Premier(Temp)))(1 .. Get_Fin(Get_Mot_T(Premier(Temp)))));
         Put_Line(Dest, Integer'Image(Get_NbOcc1(Premier(Temp))) & Integer'Image(Get_NbOcc2(Premier(Temp))));
         Temp := Suivant(Temp);
         Put(".");
      end loop;
      New_Line(Dest); -- antibug
      Close(Dest);
      New_Line;
      Put_Line("Fin creation !");
      Skip_Line;
   end;

   function Existe (
         Name : in     String)
     return Boolean is
      File : File_Type;
   begin
      Open(File, In_File, Name);
      Close(File);
      return True;
   exception
      when Name_Error =>
         return False;
      when others =>
         raise;
   end Existe;

   procedure Recup_Liste (
         L : in out TListe_Couple) is
      --procedure qui recr�e la liste de couple a partir du fichier "liste-mot.txt"
      --le fichier n'est pas pass� en parametre car il sera cr�� auparavant par la fonction Creer_Fichier_Listemot
      --et donc le fichier existera forcement et pourra etre ouvert dans le corps de la fonction
      --declenche une exception si le fichier n'existe pas
      Orig   : File_Type;
      C      : Character;
      Mot    : String (1 .. 30);
      Indice : Integer;
      Couple : T_Couple;
      M      : T_Mot;
   begin
      Indice := 0;
      if Existe("liste-mot.txt") then
         Open(Orig, In_File, "liste-mot.txt");
         Put("Debut recuperation");
         while not End_Of_File(Orig) loop
            if End_Of_Line(Orig) then
               InsererTriee_Couple_Lex(L, Couple);
               Put(".");
               Skip_Line(Orig);
            else
               Get(Orig, C);
               if C = Character'Val(32) then -- C = ' '
                  -- TEST Put("Mot 1 .." & Integer'Image(Indice) & " : " & Mot(1 .. Indice));
                  M := Creer_Mot(Mot(1 .. Indice));
                  Set_Mot(Couple, M);
                  --Set_Fin(Couple, Indice);
                  Indice := 0;
                  while not End_Of_Line(Orig) loop
                     Get(Orig, C);
                     Indice := Indice + 1;
                     Mot(Indice) := C;
                  end loop;
                  -- TEST Put_Line(" - NbOcc : " & Mot(1 .. Indice));
                  Set_NbOcc(Couple, Integer'Value(Mot(1 .. Indice)));
                  Indice := 0;
               else
                  Indice := Indice + 1;
                  Mot(Indice) := C;
               end if;
            end if;
         end loop;
         Close(Orig);
         New_Line;
         Put_Line("Fin recuperation !");
         Skip_Line;
      else
         Put_Line("Le fichier " & Character'Val(34) & "liste-mot.txt" & Character'Val(34) & " n'existe pas !");
      end if;
   end;

   procedure Recup_Liste_T (
         L : in out TListe_Triplet) is
      --procedure qui recr�e la liste de couple a partir du fichier "liste-mot-t.txt"
      --le fichier n'est pas pass� en parametre car il sera cr�� auparavant par la fonction Creer_Fichier_Listemot_T
      --et donc le fichier existera forcement et pourra etre ouvert dans le corps de la fonction
      --declenche une exception si le fichier n'existe pas
      Orig   : File_Type;
      C      : Character;
      Mot    : String (1 .. 30);
      Indice : Integer;
      NbOcc1 : Integer;
      NbOcc2 : Integer;
      Triplet : T_Triplet;
      M      : T_Mot;
   begin
      Indice := 0;
      if Existe("liste-mot-t.txt") then
         Open(Orig, In_File, "liste-mot-t.txt");
         Put("Debut recuperation");
         while not End_Of_File(Orig) loop
            if End_Of_Line(Orig) then
	       Triplet := Creer_Triplet(M, NbOcc1, NbOcc2);
               InsererTriee_Triplet_Lex_Txt1(L, Triplet);
               Put(".");
               Skip_Line(Orig);
            else
               Get(Orig, C);
               if C = Character'Val(32) then -- C = ' '
                  -- TEST Put("Mot 1 .." & Integer'Image(Indice) & " : " & Mot(1 .. Indice));
                  M := Creer_Mot(Mot(1 .. Indice));
                  Indice := 0;
                  while not (C = Character'Val(32)) loop -- C = ' '
                     Get(Orig, C);
                     Indice := Indice + 1;
                     Mot(Indice) := C;
                  end loop;
                  -- TEST Put_Line(" - NbOcc : " & Mot(1 .. Indice));
                  NbOcc1 := Integer'Value(Mot(1 .. Indice));
                  Get(Orig, C);
                  Indice := 0;
                  while not End_Of_Line(Orig) loop
                     Get(Orig, C);
                     Indice := Indice + 1;
                     Mot(Indice) := C; 
                  end loop;
                  NbOcc2 := Integer'Value(Mot(1 .. Indice));
                  Indice := 0;
               else
                  Indice := Indice + 1;
                  Mot(Indice) := C;
               end if;
            end if;
         end loop;
         Close(Orig);
         New_Line;
         Put_Line("Fin recuperation !");
         Skip_Line;
      else
         Put_Line("Le fichier " & Character'Val(34) & "liste-mot.txt" & Character'Val(34) & " n'existe pas !");
      end if;
   end;

   procedure AffichageN (
         L : in     TListe_Couple;
         N : in     Integer) is
      -- affiche les N premiers mots de la liste
      Compteur : Integer;
      Temp     : TListe_Couple;
   begin
      Compteur := 0;
      Temp := CopieTriee_Couple_Occ(L);
      while not EstVide(Temp) and then Compteur < N loop
         Imprime_Couple(Premier(Temp));
         Compteur := Compteur + 1;
         Temp := Suivant(Temp);
      end loop;
      New_Line;
   end;

   procedure Query_Intersection (
         T : in TListe_Triplet) is
      Temp : TListe_Triplet;
   begin
      Temp := T;
      while not EstVide(Temp) loop
         if (Get_NbOcc1(Premier(Temp)) /= 0) and then (Get_NbOcc2(Premier(Temp)) /= 0) then
            Imprime_Triplet(Premier(Temp));
         end if;
         Temp := Suivant(Temp);
      end loop;
      New_Line;
   end;

   procedure Query_Difference (
         T : in TListe_Triplet) is
      Temp : TListe_Triplet;
   begin
      Temp := T;
      while not EstVide(Temp) loop
         if (Get_NbOcc1(Premier(Temp)) /= 0) xor (Get_NbOcc2(Premier(Temp)) /= 0) then
            Imprime_Triplet(Premier(Temp));
         end if;
         Temp := Suivant(Temp);
      end loop;
      New_Line;
   end;
   
end Analyse_Lexicale;
