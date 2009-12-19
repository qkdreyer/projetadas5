WITH Ada.Text_IO, Couple;
USE Ada.Text_IO, Couple;

PACKAGE BODY Analyse_Lexicale IS

   FUNCTION CaractereAutorise (
         C : IN     Character)
     RETURN Boolean IS
      -- Renvoit vrai si le caractere est autorise en tant que caractere d'un mot, faux sinon
   BEGIN
      IF C = Character'Val(32) THEN -- ' '
         RETURN False;
      ELSIF C = Character'Val(33) THEN -- '!'
         RETURN False;
      ELSIF C = Character'Val(34) THEN -- '"'
         RETURN False;
      ELSIF C = Character'Val(35) THEN -- '#'
         RETURN False;
      ELSIF C = Character'Val(36) THEN -- '$'
         RETURN False;
      ELSIF C = Character'Val(37) THEN -- '%'
         RETURN False;
      ELSIF C = Character'Val(38) THEN -- '&'
         RETURN False;
      ELSIF C = Character'Val(40) THEN -- '('
         RETURN False;
      ELSIF C = Character'Val(41) THEN -- ')'
         RETURN False;
      ELSIF C = Character'Val(42) THEN -- '*'
         RETURN False;
      ELSIF C = Character'Val(43) THEN -- '+'
         RETURN False;
      ELSIF C = Character'Val(44) THEN -- ','
         RETURN False;
      ELSIF C = Character'Val(46) THEN -- '.'
         RETURN False;
      ELSIF C = Character'Val(47) THEN -- '/'
         RETURN False;
      ELSIF C = Character'Val(58) THEN -- ':'
         RETURN False;
      ELSIF C = Character'Val(59) THEN -- ';'
         RETURN False;
      ELSIF C = Character'Val(60) THEN -- '<'
         RETURN False;
      ELSIF C = Character'Val(61) THEN -- '='
         RETURN False;
      ELSIF C = Character'Val(62) THEN -- '>'
         RETURN False;
      ELSIF C = Character'Val(63) THEN -- '?'
         RETURN False;
      ELSIF C = Character'Val(64) THEN -- '@'
         RETURN False;
      ELSIF C = Character'Val(91) THEN -- '['
         RETURN False;
      ELSIF C = Character'Val(92) THEN -- '\'
         RETURN False;
      ELSIF C = Character'Val(93) THEN -- ']'
         RETURN False;
      ELSIF C = Character'Val(94) THEN -- '^'
         RETURN False;
      ELSIF C = Character'Val(95) THEN -- '_'
         RETURN False;
      ELSIF C = Character'Val(96) THEN -- '`'
         RETURN False;
      ELSIF C = Character'Val(10) THEN -- LF
         RETURN False;
      ELSIF C = Character'Val(13) THEN -- CR
         RETURN False;
      ELSE
         RETURN True;
      END IF;
   END;

   PROCEDURE Query_Liste_Couple (
         L      : IN OUT TListe_Couple;
         NomFic : IN     String) IS
      --Renvoit une liste comprenant tous les couples(mot;occurence) du fichier texte NomFic
      Orig   : File_Type;        -- Fichier source
      C      : Character;
      Mot    : String (1 .. 30);
      Indice : Integer;
      Couple : T_Couple;
   BEGIN
      Indice := 0;
      C := Character'Val(0);
      Open(Orig, In_File, NomFic);
      Put("Debut lecture");
      WHILE NOT End_Of_File(Orig) LOOP
         IF End_Of_Line(Orig) THEN
            Indice := 0;
            Skip_Line(Orig);
         ELSE -- non(End_Of_Line(Orig))
            Get(Orig, C);
            IF CaractereAutorise(C) THEN -- On cr�e le mot
               Indice := Indice + 1;
               Mot(Indice) := C;
            ELSE -- non(CaractereAutorise(C))
               -- TEST Put_Line("Mot 1 .." & Integer'Image(Indice) & " : " & Mot(1 .. Indice));
               Put(".");
               IF EstMotSignificatif(Mot(1 .. Indice)) THEN
                  Set_Mot(Couple, Mot(1 .. Indice));
                  Set_NbOcc(Couple, 1);
                  Set_Fin(Couple, Indice);
                  InsererTriee_Couple(L, Couple); -- Ajoute dans la liste le premier mot significatif
               END IF;
               Indice := 0;
               C := Character'Val(0);
            END IF;
         END IF;
      END LOOP;
      Close(Orig);
      New_Line;
      Put_Line("Fin lecture !");
      Skip_Line;
   END;

   FUNCTION Query_NbOcc (
         L : TListe_Couple;
         M : String)
     RETURN Integer IS
      --Requete renvoyant le nombre d'occurence du mot m dans le texte
   BEGIN
      IF EstVide(L) THEN
         RETURN 0;
      ELSIF Get_Mot(Valeur(L)) = M THEN
         RETURN 1+Query_NbOcc(Suivant(L), M);
      ELSE
         RETURN Query_NbOcc(Suivant(L), M);
      END IF;
   END;

   PROCEDURE Query_NbPref (
         L     : IN     TListe_Couple;
         S     : IN     String;
         NbMot :    OUT Integer;
         NbOcc :    OUT Integer) IS
      --Requete renvoyant le nombre de mot ayant s pour pr�fixe et le nombre d'occurence de s (Appel de query_NbOcc(s))
      Temp : TListe_Couple;
      Res  : Integer;
   BEGIN
      Res := 0;
      Temp := L;
      WHILE NOT EstVide(Temp) LOOP
         IF Estprefixede(Get_Mot(Valeur(Temp)), S) THEN
            Res := Res + 1;
         END IF;
         Temp := Suivant(Temp);
      END LOOP;
      NbMot := Res;
      NbOcc := Query_NbOcc(L,S);
   END;

   PROCEDURE Query_NbSuff (
         L     : IN     TListe_Couple;
         S     : IN     String;
         NbMot :    OUT Integer;
         NbOcc :    OUT Integer) IS
      --Requete renvoyant le nombre de mot ayant s pour suffixe et le nombre d'occurence de s (Appel de query_NbOcc(s))
      Temp : TListe_Couple;
      Res  : Integer;
   BEGIN
      Res := 0;
      Temp := L;
      WHILE NOT Estvide(Temp) LOOP
         IF Estsuffixede(Get_Mot(Valeur(Temp)), S) THEN
            Res := Res + 1;
         END IF;
         Temp := Suivant(Temp);
      END LOOP;
      NbMot := Res;
      NbOcc := Query_NbOcc(L,S);
   END;

   PROCEDURE Query_NbFact (
         L     : IN     TListe_Couple;
         S     : IN     String;
         NbMot :    OUT Integer;
         NbOcc :    OUT Integer) IS
      --Requete renvoyant le nombre de mot ayant s pour facteur et le nombre d'occurence de s (Appel de query_NbOcc(s))
      Temp : TListe_Couple;
      Res  : Integer;
   BEGIN
      Res := 0;
      Temp := L;
      WHILE NOT EstVide(Temp) LOOP
         IF Estfacteurde(Get_Mot(Valeur(Temp)), S) THEN
            Res := Res + 1;
         END IF;
         Temp := Suivant(Temp);
      END LOOP;
      NbMot := Res;
      NbOcc := Query_NbOcc(L,S);
   END;

   PROCEDURE Creer_Fichier_Listemot (
         L : IN     TListe_Couple) IS
      --Procedure qui cr�e le fichier liste-mot.txt a partir de la liste de couple l
      --Le Fichier cr�� est de la forme suivante
      ------------------------------------------
      --Mot1 Nbocc1
      --Mot2 NbOcc2
      --etc ...
      ------------------------------------------
      Dest : File_Type;
      Temp : TListe_Couple;
      Mot : String(1 .. 30);
      Fin : Integer;
   BEGIN
      Temp := L;
      Create(Dest, Name => "liste-mot.txt");
      Put("Debut creation");
      WHILE NOT EstVide(Temp) LOOP
         Put(Dest, Get_Mot(Premier(Temp))(1 .. Get_Fin(Premier(Temp))));
         Put_Line(Dest, Integer'Image(Get_NbOcc(Premier(Temp))));
         Temp := Suivant(Temp);
         Put(".");
      END LOOP;
      Close(Dest);
      New_Line;
      Put_Line("Fin creation !");
      Skip_Line;
   END;

   FUNCTION Existe (
         Name : IN     String)
     RETURN Boolean IS
      File : File_Type;
   BEGIN
      Open(File, In_File, Name);
      Close(File);
      RETURN True;
   EXCEPTION
      WHEN Name_Error =>
         RETURN False;
      WHEN OTHERS =>
         RAISE;
   END Existe;

   PROCEDURE Recup_Liste (
         L : IN OUT TListe_Couple) IS
      --procedure qui recr�e la liste de couple a partir du fichier "liste-mot.txt"
      --le fichier n'est pas pass� en parametre car il sera cr�� auparavant par la fonction Creer_Fichier_Listemot
      --et donc le fichier existera forcement et pourra etre ouvert dans le corps de la fonction
      --declenche une exception si le fichier n'existe pas
      Orig   : File_Type;
      C      : Character;
      Mot    : String (1 .. 30);
      Indice : Integer;
      Couple : T_Couple;
   BEGIN
      Indice := 0;
      IF Existe("liste-mot.txt") THEN
         Open(Orig, In_File, "liste-mot.txt");
         Put("Debut recuperation");
         WHILE NOT End_Of_File(Orig) LOOP
            IF End_Of_Line(Orig) THEN
               InsererTriee_Couple(L, Couple);
               Put(".");
               Skip_Line(Orig);
            ELSE
               Get(Orig, C);
               IF C = Character'Val(32) THEN -- C = ' '
                  -- TEST Put("Mot 1 .." & Integer'Image(Indice) & " : " & Mot(1 .. Indice));
                  Set_Mot(Couple, Mot(1 .. Indice));
                  Set_Fin(Couple, Indice);
                  Indice := 0;
                  WHILE NOT End_Of_Line(Orig) LOOP
                     Get(Orig, C);
                     Indice := Indice + 1;
                     Mot(Indice) := C;
                  END LOOP;
                  -- TEST Put_Line(" - NbOCcc : " & Mot(1 .. Indice));
                  Set_NbOcc(Couple, Integer'Value(Mot(1 .. Indice)));
                  Indice := 0;
               ELSE
                  Indice := Indice + 1;
                  Mot(Indice) := C;
               END IF;
            END IF;
         END LOOP;
         Close(Orig);
         New_Line;
         Put_Line("Fin recuperation !");
         Skip_Line;
      ELSE
         Put_Line("Le fichier " & Character'Val(34) & "liste-mot.txt" & Character'Val(34) & " n'existe pas !");
      END IF;
   END;

END Analyse_Lexicale;