-- #################################################################################
-- #                                                                               #
-- #   Nom : main.adb                                                              #
-- #   Auteur : DREYER Quentin                                                     #
-- #   Date de cr�ation : 12/12/2009                                               #
-- #   Date de modification : 25/01/2010                                           #   
-- #                                                                               #
-- #################################################################################

with Analyse_Lexicale, Trie, Text_Stat, Mot, Couple, Liste_Couple, Liste_Triplet, Arbre_Binaire_Couple, Arbre_Binaire_Triplet, Ada.Text_Io, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use Analyse_Lexicale, Trie, Text_Stat, Mot, Couple, Liste_Couple, Liste_Triplet, Arbre_Binaire_Couple, Arbre_Binaire_Triplet, Ada.Text_Io, Ada.Integer_Text_IO, Ada.Float_Text_IO;

procedure Main is

   Menu, SMenu, NomFic : Boolean;
   Choix, NbMot, Num, NumMotTot, NumOccTot, LongTot, NumMotSupN : Integer;
   L : TListe_Couple;
   LT : TListe_Triplet;
   AB : TABR_Couple;
   ABT : TABR_Triplet;
   T1, T2 : T_Trie;
   Buffer, Chaine : String(1 .. 30);
   Last : Natural;
   C1, C2 : T_Couple;
   M : T_Mot;

   use Liste_Couple.L;
   use Liste_Triplet.Lt;
   use Arbre_Binaire_Triplet.ABT;
   use Arbre_Binaire_Couple.AB;

begin

   Put_Line("******************************************************************");
   Put_line("******************************************************************");
   Put_line("** ____            _      _               _                     **");
   Put_line("**|  _ \ _ __ ___ (_) ___| |_    __ _  __| | __ _               **");
   Put_line("**| |_) | '__/ _ \| |/ _ \ __|  / _` |/ _` |/ _` |              **");
   Put_line("**|  __/| | | (_) | |  __/ |_  | (_| | (_| | (_| |              **");
   Put_line("**|_|   |_|  \___// |\___|\__|  \__,_|\__,_|\__,_|              **");
   Put_line("**               |__/                                           **");
   Put_Line("**                                                              **");
   Put_Line("**                                                              **");
   Put_Line("**                   ANALYSEUR LEXICALE v2                      **");
   Put_Line("**                       PROJET ADA S5                          **");
   Put_Line("**                                                              **");
   Put_Line("** Auteurs :                                                    **");
   Put_Line("**   JAMBET PIERRE                                              **");
   Put_Line("**   DREYER QUENTIN                                             **");
   Put_Line("**                                                              **");
   Put_Line("******************************************************************");
   Put_line("******************************************************************");
   New_Line;

   Menu := True;
   while Menu loop

      Put_Line("1 -> Entrez 1 pour utiliser la structure de donnee " & Character'Val(34) & "Liste" & Character'Val(34) & ".");
      Put_Line("2 -> Entrez 2 pour utiliser la structure de donnee " & Character'Val(34) & "ABR" & Character'Val(34) & ".");
      Put_Line("3 -> Entrez 3 pour utiliser la structure de donnee " & Character'Val(34) & "Trie" & Character'Val(34) & ".");
      Put_Line("0 -> Entrez 0 pour quitter.");
      New_Line;
      Get(Choix);
      Skip_Line;
      New_Line;

      case Choix is

         when 0 =>

            Menu := False;

         when 1 =>

            SMenu := True;
            Put_Line("Signification de l'etat memoire :");
            Put_Line(" (*) -> Il y a une liste de couples en memoire");
            Put_Line(" (**) -> Il y a une liste de triplets en memoire");
            New_Line;
            while SMenu loop

               Put("Etat memoire :");
               if not EstVide(L) then
                  Put(" (*)");
               end if;
               if not EstVide(LT) then
                  Put(" (**)");
               end if;

               New_Line;
               Put_Line("1 -> Entrez 1 pour analyser un texte.");
               Put_Line("2 -> Entrez 2 pour effectuer des requetes.");
               Put_Line("3 -> Entrez 3 pour enregistrer la liste dans le fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
               Put_Line("4 -> Entrez 4 pour recuperer la liste a partir du fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
               Put_Line("5 -> Entrez 5 pour afficher la liste des couples.");
               Put_Line("6 -> Entrez 6 pour effacer la liste des couples.");
               New_Line;
               Put_Line("7 -> Entrez 7 pour comparer 2 textes");
               Put_Line("8 -> Entrez 8 pour effectuer des requetes.");
               Put_Line("9 -> Entrez 9 pour enregistrer la liste dans le fichier " & Character'Val(34) & "liste-mots2.txt" & Character'Val(34) & ".");
               Put_Line("10 -> Entrez 10 pour recuperer la liste a partir du fichier " & Character'Val(34) & "liste-mots2.txt" & Character'Val(34) & ".");
               Put_Line("11 -> Entrez 11 pour afficher la liste des triplets.");
               Put_Line("12 -> Entrez 12 pour effacer la liste des triplets.");
               New_Line;
               Put_Line("0 -> Entrez 0 pour retourner au menu principal.");
               New_Line;
               Get(Choix);
               Skip_Line;
               New_Line;

               case Choix is

                  when 0 =>

                     SMenu := False;

                  when 1 =>

                     NomFic := True;
                     while NomFic loop -- '0'
                        Put_Line("Veuillez entrer le nom du fichier.");
                        Get_Line(Buffer, Last);
                        New_Line;
                        if Existe(Buffer(1 .. Last)) then
                           NomFic := False;
                           Query_Struct(L, Buffer(1 .. Last)); --Remplissage de la liste avec les mots significatifs du texte
                        elsif Buffer(Buffer'First) = Character'Val(48) then -- '0'
                           NomFic := False;
                        else
                           Put_Line("Nom de fichier invalide ! Entrez 0 pour quitter.");
                           New_Line;
                        end if;
                     end loop;

                  when 2 =>

                     Put_Line("Nombre de mot total :" & Integer'Image(Num_Mot_Tot(L)) & ".");
                     Put("Nombre d'occurence moyen :"); Put(Num_Occ_Moy(L), 2, 1, 0); Put_Line(".");
                     Put("Longueur moyenne des mots :"); Put(Long_Moy(L), 2, 1, 0); Put_Line(".");
                     New_Line;                     
                     
                     Put_Line("Affichage des mots superieur a un entier N :");
                     Put_Line("Veuillez entrer un entier N.");
                     Get(Num);
                     New_Line;
                     Put_Line("Nombre de mot superieur a" & Integer'Image(Num) & " :" & Integer'Image(Num_Mot_Sup(L, Num)) & ".");
                     New_Line;                     

                     Put_Line("Affichage des N premiers mots en fonction de leur nombre d'occurence :");
                     Put_Line("Veuillez entrer le nombre N de mots a afficher.");
                     Get(NbMot);
                     AffichageN(L, NbMot);

                     Skip_Line;
                     Put_Line("Veuillez entrer le premier mot.");
                     Get_Line(Buffer, Last);
                     New_Line;
                     M := Creer_Mot(Buffer(1 .. Last));
                     Set_Mot(C1, M);

                     Put_Line("Veuillez entrer le deuxieme mot.");
                     Get_Line(Buffer, Last);
                     New_Line;
                     M := Creer_Mot(Buffer(1 .. Last));
                     Set_Mot(C2, M);

                     begin
                        Fusion_Couple(L, C1, C2);
                     exception
                        when Constraint_Error =>
                           Put_Line("Erreur de contrainte");
                        when Liste_Couple.L.Listevideexception =>
                           Put_Line("Probleme : Elements non trouves dans la liste");
                     end;
                     New_Line;

                  when 3 =>

                     Creer_Fichier(L);

                  when 4 =>

                     Recup_Fichier(L);

                  when 5 =>

                     Affiche(L);

                  when 6 =>

                     ViderListe(L);

                  when 7 =>

                     NomFic := True;
                     while NomFic loop
                        Put_Line("Veuillez entrer le nom du premier fichier.");
                        Get_Line(Buffer, Last);
                        New_Line;
                        if Existe(Buffer(1 .. Last)) then
                           NomFic := False;
                           Query_Struct_Txt1(LT, Buffer(1 .. Last)); --Remplissage de la liste avec les mots significatifs du texte
                        elsif Buffer(Buffer'First) = Character'Val(48) then -- '0'
                           NomFic := False;
                        else
                           Put_Line("Nom de fichier invalide ! Entrez 0 pour quitter.");
                           New_Line;
                        end if;
                     end loop;

                     NomFic := True;
                     while NomFic loop
                        Put_Line("Veuillez entrer le nom du deuxieme fichier.");
                        Get_Line(Buffer, Last);
                        New_Line;
                        if Existe(Buffer(1 .. Last)) then
                           NomFic := False;
                           Query_Struct_Txt2(LT, Buffer(1 .. Last));--Remplissage de la liste avec les mots significatifs du texte
                        elsif Buffer(Buffer'First) = Character'Val(48) then -- '0'
                           NomFic := False;
                        else
                           Put_Line("Nom de fichier invalide ! Entrez 0 pour quitter.");
                           New_Line;
                        end if;
                     end loop;

                  when 8 =>

                     Put_Line("Nombre de mot total :" & Integer'Image(Num_Mot_Tot(LT)) & ".");
                     Put("Nombre d'occurence moyen :"); Put(Num_Occ_Moy(LT), 2, 1, 0); Put_Line(".");
                     Put("Longueur moyenne des mots :"); Put(Long_Moy(LT), 2, 1, 0); Put_Line(".");
                     New_Line;                     
                     
                     Put_Line("Affichage des mots superieur a un entier N :");
                     Put_Line("Veuillez entrer un entier N.");
                     Get(Num);
                     New_Line;
                     Put_Line("Nombre de mot superieur a" & Integer'Image(Num) & " :" & Integer'Image(Num_Mot_Sup(LT, Num)) & ".");
                     New_Line;

                     Put_Line("Affichage des N premiers mots en fonction de leur nombre d'occurence :");
                     Put_Line("Veuillez entrer le nombre N de mots a afficher.");
                     Get(NbMot);
                     AffichageN(LT, NbMot);

                     Skip_Line;
                     Put_Line("Veuillez entrer un mot afin de connaitre son nombre d'occurence dans chacun des textes.");
                     Get_Line(Buffer, Last);
                     New_Line;
                     M := Creer_Mot(Buffer(1 .. Last));

                     Put_Line("Le nombre d'occurence de " & Character'Val(34) & Buffer(1 .. Last) & Character'Val(34) & " du premier texte est :" & Integer'Image(Query_NbOcc_Txt1(LT, M)) & ".");
                     Put_Line("Le nombre d'occurence de " & Character'Val(34) & Buffer(1 .. Last) & Character'Val(34) & " du deuxieme texte est :" & Integer'Image(Query_NbOcc_Txt2(LT, M)) & ".");

                     Skip_Line;
                     Put_Line("Les mots employes par les deux auteurs sont :");
                     Query_Intersection(LT);

                     Skip_Line;
                     Put_Line("Les mots employes par un auteur et pas par l'autre sont :");
                     Query_Difference(LT);

                  when 9 =>

                     Creer_Fichier(LT);

                  when 10 =>

                     Recup_Fichier(LT);

                  when 11 =>

                     Affiche(LT);

                  when 12 =>

                     ViderListe(LT);

                  when others =>

                     Put_Line("Valeur non valide !");
                     New_Line;

               end case;

            end loop;

         when 2 =>

            SMenu := True;
            Put_Line("Signification de l'etat memoire :");
            Put_Line(" (*) -> Il y a un arbre binaire de couples en memoire");
            Put_Line(" (**) -> Il y a un arbre binaire de triplets en memoire");
            New_Line;
            while SMenu loop

               Put("Etat memoire :");
               if not Arbre_Vide(AB) then
                  Put(" (*)");
               end if;
               if not Arbre_Vide(ABT) then
                  Put(" (**)");
               end if;

               New_Line;
               Put_Line("1 -> Entrez 1 pour analyser un texte.");
               Put_Line("2 -> Entrez 2 pour effectuer des requetes.");
               Put_Line("3 -> Entrez 3 pour enregistrer l'arbre dans le fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
               Put_Line("4 -> Entrez 4 pour recuperer l'arbre a partir du fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
               Put_Line("5 -> Entrez 5 pour afficher l'arbre des couples.");
               Put_Line("6 -> Entrez 6 pour effacer l'arbre des couples.");
               New_Line;
               Put_Line("7 -> Entrez 7 pour comparer 2 textes");
               Put_Line("8 -> Entrez 8 pour effectuer des requetes.");
               Put_Line("9 -> Entrez 9 pour enregistrer l'arbre dans le fichier " & Character'Val(34) & "liste-mots2.txt" & Character'Val(34) & ".");
               Put_Line("10 -> Entrez 10 pour recuperer l'arbre a partir du fichier " & Character'Val(34) & "liste-mots2.txt" & Character'Val(34) & ".");
               Put_Line("11 -> Entrez 11 pour afficher l'arbre des triplets.");
               Put_Line("12 -> Entrez 12 pour effacer l'arbre des triplets.");
               New_Line;
               Put_Line("0 -> Entrez 0 pour retourner au menu principal.");
               New_Line;
               Get(Choix);
               Skip_Line;
               New_Line;

               case Choix is

                  when 0 =>

                     SMenu := False;

                  when 1 =>  

                     NomFic := True;
                     while NomFic loop
                        Put_Line("Veuillez entrer le nom du fichier.");
                        Get_Line(Buffer, Last);
                        New_Line;
                        if Existe(Buffer(1 .. Last)) then
                           NomFic := False;
                           Query_Struct(AB, Buffer(1 .. Last)); --Remplissage de l'arbre avec les mots significatifs du texte
                        elsif Buffer(Buffer'First) = Character'Val(48) then -- '0'
                           NomFic := False;
                        else
                           Put_Line("Nom de fichier invalide ! Entrez 0 pour quitter.");
                           New_Line;
                        end if;
                           
                        if Est_Equilibre(Ab) then
                           Put_Line("L'arbre est equilibre");
                        else
                           Put_Line("L'arbre n'est pas equilibre");
                        end if;
                        Put_Line("L'arbre a" & Integer'Image(Nombre_Elt(AB)) & " mots");
                        New_Line;                                  
                    end loop;

                  when 2 =>

                     Put_Line("Nombre de mot total :" & Integer'Image(Num_Mot_Tot(AB)) & ".");
                     Put("Nombre d'occurence moyen :"); Put(Num_Occ_Moy(AB), 2, 1, 0); Put_Line(".");
                     Put("Longueur moyenne des mots :"); Put(Long_Moy(AB), 2, 1, 0); Put_Line(".");
                     New_Line;                     
                     
                     Put_Line("Affichage des mots superieur a un entier N :");
                     Put_Line("Veuillez entrer un entier N.");
                     Get(Num);
                     New_Line;
                     Put_Line("Nombre de mot superieur a" & Integer'Image(Num) & " :" & Integer'Image(Num_Mot_Sup(AB, Num)) & ".");
                     New_Line;

                     Put_Line("Affichage des N premiers mots en fonction de leur nombre d'occurence :");
                     Put_Line("Veuillez entrer le nombre N de mots a afficher.");
                     Get(NbMot);
                     AffichageN(AB, NbMot);

                     Skip_Line;
                     Put_Line("Veuillez entrer le premier mot.");
                     Get_Line(Buffer, Last);
                     New_Line;
                     M := Creer_Mot(Buffer(1 .. Last));
                     Set_Mot(C1, M);

                     Put_Line("Veuillez entrer le deuxieme mot.");
                     Get_Line(Buffer, Last);
                     New_Line;
                     M := Creer_Mot(Buffer(1 .. Last));
                     Set_Mot(C2, M);

                     --begin
                     --Fusion_Couple(AB, C1, C2);
                     --   exception
                     --   when Constraint_Error => Put_Line("Erreur de contrainte");
                     --   when Liste_Couple.L.Listevideexception => Put_Line("Probleme : Element non trouv�s dans la liste");
                     --end;

                  when 3 =>

                     Creer_Fichier(AB);

                  when 4 =>

                     Recup_Fichier(AB);

                  when 5 =>

                     Affiche_Inf(AB);
                     New_Line;   

                  when 6 =>

                     Vider_Arbre(AB);

                  when 7 =>

                     NomFic := True;
                     while NomFic loop
                        Put_Line("Veuillez entrer le nom du premier fichier.");
                        Get_Line(Buffer, Last);
                        New_Line;
                        if Existe(Buffer(1 .. Last)) then
                           NomFic := False;
                           Query_Struct_Txt1(ABT, Buffer(1 .. Last)); -- Remplissage de la liste avec les mots significatifs du texte
                        elsif Buffer(Buffer'First) = Character'Val(48) then -- '0'
                           NomFic := False;
                        else
                           Put_Line("Nom de fichier invalide ! Entrez 0 pour quitter.");
                           New_Line;
                        end if;
                     end loop;

                     NomFic := True;
                     while NomFic loop
                        Put_Line("Veuillez entrer le nom du deuxieme fichier.");
                        Get_Line(Buffer, Last);
                        New_Line;
                        if Existe(Buffer(1 .. Last)) then
                           NomFic := False;
                           Query_Struct_Txt2(ABT, Buffer(1 .. Last)); -- Remplissage de la liste avec les mots significatifs du texte
                        elsif Buffer(Buffer'First) = Character'Val(48) then -- '0'
                           NomFic := False;
                        else
                           Put_Line("Nom de fichier invalide ! Entrez 0 pour quitter.");
                           New_Line;
                        end if;
                     end loop;

                  when 8 =>

                     Put_Line("Nombre de mot total :" & Integer'Image(Num_Mot_Tot(ABT)) & ".");
                     Put("Nombre d'occurence moyen :"); Put(Num_Occ_Moy(ABT), 2, 1, 0); Put_Line(".");
                     Put("Longueur moyenne des mots :"); Put(Long_Moy(ABT), 2, 1, 0); Put_Line(".");
                     New_Line;                     
                     
                     Put_Line("Affichage des mots superieur a un entier N :");
                     Put_Line("Veuillez entrer un entier N.");
                     Get(Num);
                     New_Line;
                     Put_Line("Nombre de mot superieur a" & Integer'Image(Num) & " :" & Integer'Image(Num_Mot_Sup(ABT, Num)) & ".");
                     New_Line;

                     Put_Line("Affichage des N premiers mots en fonction de leur nombre d'occurence :");
                     Put_Line("Veuillez entrer le nombre N de mots a afficher.");
                     Get(NbMot);
                     AffichageN(ABT, NbMot);

                     Skip_Line;
                     Put_Line("Veuillez entrer un mot afin de connaitre son nombre d'occurence dans chacun des textes.");
                     Get_Line(Buffer, Last);
                     New_Line;
                     M := Creer_Mot(Buffer(1 .. Last));   

                     Put_Line("Le nombre d'occurence de " & Character'Val(34) & Buffer(1 .. Last) & Character'Val(34) & " du premier texte est :" & Integer'Image(Query_NbOcc_Txt1(ABT, M)) & ".");
                     Put_Line("Le nombre d'occurence de " & Character'Val(34) & Buffer(1 .. Last) & Character'Val(34) & " du deuxieme texte est :" & Integer'Image(Query_NbOcc_Txt2(ABT, M)) & ".");
                     New_Line;

                     Skip_Line;
                     Put_Line("Les mots employes par les deux auteurs sont :");
                     Query_Intersection(ABT);

                     Skip_Line;
                     Put_Line("Les mots employes par un auteur et pas par l'autre sont :");
                     Query_Difference(ABT);

                  when 9 =>

                     Creer_Fichier(ABT);

                  when 10 =>

                     Recup_Fichier(ABT);

                  when 11 =>

                     Affiche_Inf(ABT);
                     New_Line;

                  when 12 =>

                     Vider_Arbre(ABT);

                  when others =>

                     Put_Line("Valeur non valide !");
                     New_Line;

               end case;

            end loop;

         when 3 =>

            SMenu := True;
            Put_Line("Signification de l'etat memoire :");
            Put_Line(" (*) -> Il y a un trie contenant 1 texte en memoire");
            Put_Line(" (**) -> Il y a un trie contenant 2 textes en memoire");               
            New_Line;
            while SMenu loop

               Put("Etat memoire :");
               if not TrieVide(T1) then
                  Put(" (*)");
               end if;
               if not TrieVide(T2) then
                  Put(" (**)");
               end if;

               New_Line;
               Put_Line("1 -> Entrez 1 pour analyser un texte.");
               Put_Line("2 -> Entrez 2 pour effectuer des requetes.");
               Put_Line("3 -> Entrez 3 pour enregistrer le trie dans le fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
               Put_Line("4 -> Entrez 4 pour recuperer le trie a partir du fichier " & Character'Val(34) & "liste-mots.txt" & Character'Val(34) & ".");
               Put_Line("5 -> Entrez 5 pour afficher le trie.");
               Put_Line("6 -> Entrez 6 pour effacer le trie.");
               New_Line;
               Put_Line("7 -> Entrez 7 pour comparer 2 textes");
               Put_Line("8 -> Entrez 8 pour effectuer des requetes.");
               Put_Line("9 -> Entrez 9 pour enregistrer le trie dans le fichier " & Character'Val(34) & "liste-mots2.txt" & Character'Val(34) & ".");
               Put_Line("10 -> Entrez 10 pour recuperer le trie a partir du fichier " & Character'Val(34) & "liste-mots2.txt" & Character'Val(34) & ".");
               Put_Line("11 -> Entrez 11 pour afficher le trie.");
               Put_Line("12 -> Entrez 12 pour effacer le trie.");
               New_Line;
               Put_Line("0 -> Entrez 0 pour retourner au menu principal.");
               New_Line;
               Get(Choix);
               Skip_Line;
               New_Line;

               case Choix is

                  when 0 =>

                     SMenu := False;

                  when 1 =>

                     NomFic := True;
                     while NomFic loop
                        Put_Line("Veuillez entrer le nom du fichier.");
                        Get_Line(Buffer, Last);
                        New_Line;
                        if Existe(Buffer(1 .. Last)) then
                           NomFic := False;
                           Query_Struct_Txt1(T1, Buffer(1 .. Last)); -- Remplissage de la liste avec les mots significatifs du texte
                        elsif Buffer(Buffer'First) = Character'Val(48) then -- '0'
                           NomFic := False;
                        else
                           Put_Line("Nom de fichier invalide ! Entrez 0 pour quitter.");
                           New_Line;
                        end if;
                     end loop;

                  when 2 =>

                     NumMotTot := 0;
                     Num_Mot_Tot_Txt1(T1, NumMotTot);
                     Put_Line("Nombre de mot total :" & Integer'Image(NumMotTot) & ".");
                     
                     NumOccTot := 0;
                     Num_Occ_Tot_Txt1(T1, NumOccTot);   
                     Put("Nombre d'occurence moyen :"); Put(Div_Float(NumOccTot, NumMotTot), 2, 1, 0); Put_Line(".");
                     
                     LongTot := 0;
                     Long_Tot_Txt1(T1, LongTot);   
                     Put("Longueur moyenne des mots :"); Put(Div_Float(LongTot, NumMotTot), 2, 1, 0); Put_Line(".");
                     New_Line;                     
                     
                     NumMotSupN := 0;
                     Put_Line("Affichage des mots superieur a un entier N :");
                     Put_Line("Veuillez entrer un entier N.");
                     Get(Num);
                     New_Line;
                     Num_Mot_Sup_Txt1(T1, Num, NumMotSupN);
                     Put_Line("Nombre de mot superieur a" & Integer'Image(Num) & " :" & Integer'Image(NumMotSupN) & ".");
                     New_Line;

                     Put_Line("Affichage des N premiers mots en fonction de leur nombre d'occurence :");
                     Put_Line("Veuillez entrer le nombre N de mots a afficher.");
                     Get(NbMot);
                     New_Line;   
                     AffichageN_Txt1(T1, NbMot, Chaine, 0);
                     New_Line;   

                     Skip_Line;
                     Put_Line("Veuillez entrer le premier mot.");
                     Get_Line(Buffer, Last);
                     New_Line;
                     M := Creer_Mot(Buffer(1 .. Last));
                     Set_Mot(C1, M);
                        
                     Put_Line("Veuillez entrer le deuxieme mot.");
                     Get_Line(Buffer, Last);
                     New_Line;
                     M := Creer_Mot(Buffer(1 .. Last));
                     Set_Mot(C2, M);

                     --Fusion?!
                        
                  when 3 =>

                     Creer_Fichier_Txt1(T1);

                  when 4 =>

                     Recup_Fichier_Txt1(T1);

                  when 5 =>

                     AfficheTrie_Txt1(T1, Chaine, 0);
                     New_Line;

                  when 6 =>

                     ViderTrie(T1);

                  when 7 =>

                     NomFic := True;
                     while NomFic loop
                        Put_Line("Veuillez entrer le nom du premier fichier.");
                        Get_Line(Buffer, Last);
                        New_Line;
                        if Existe(Buffer(1 .. Last)) then
                           NomFic := False;
                           Query_Struct_Txt1(T2, Buffer(1 .. Last)); -- Remplissage du trie avec les mots significatifs du texte 1
                        elsif Buffer(Buffer'First) = Character'Val(48) then -- '0'
                           NomFic := False;
                        else
                           Put_Line("Nom de fichier invalide ! Entrez 0 pour quitter.");
                           New_Line;
                        end if;
                     end loop;

                     NomFic := True;
                     while NomFic loop
                        Put_Line("Veuillez entrer le nom du deuxieme fichier.");
                        Get_Line(Buffer, Last);
                        New_Line;
                        if Existe(Buffer(1 .. Last)) then
                           NomFic := False;
                           Query_Struct_Txt2(T2, Buffer(1 .. Last)); -- Remplissage du trie avec les mots significatifs du texte 2
                        elsif Buffer(Buffer'First) = Character'Val(48) then -- '0'
                           NomFic := False;
                        else
                           Put_Line("Nom de fichier invalide ! Entrez 0 pour quitter.");
                           New_Line;
                        end if;
                     end loop;

                  when 8 =>

                     NumMotTot := 0;
                     Num_Mot_Tot_Txt2(T2, NumMotTot);
                     Put_Line("Nombre de mot total :" & Integer'Image(NumMotTot) & ".");
                        
                     NumOccTot := 0;                     
                     Num_Occ_Tot_Txt2(T2, NumOccTot);
                     Put("Nombre d'occurence moyen :"); Put(Div_Float(NumOccTot, NumMotTot), 2, 1, 0); Put_Line(".");
                     
                     LongTot := 0;
                     Long_Tot_Txt2(T2, LongTot);
                     Put("Longueur moyenne des mots :"); Put(Div_Float(LongTot, NumMotTot), 2, 1, 0); Put_Line(".");
                     New_Line;                     
                     
                     NumMotSupN := 0;
                     Put_Line("Affichage des mots superieur a un entier N :");
                     Put_Line("Veuillez entrer un entier N.");
                     Get(Num);
                     New_Line;
                     Num_Mot_Sup_Txt2(T2, Num, NumMotSupN);
                     Put_Line("Nombre de mot superieur a" & Integer'Image(Num) & " :" & Integer'Image(NumMotSupN) & ".");
                     New_Line;

                     Put_Line("Affichage des N premiers mots en fonction de leur nombre d'occurence :");
                     Put_Line("Veuillez entrer le nombre N de mots a afficher.");
                     Get(NbMot);
                     New_Line;   
                     AffichageN_Txt2(T2, NbMot, Chaine, 0);
                     New_Line;   

                     Skip_Line;
                     Put_Line("Veuillez entrer un mot afin de connaitre son nombre d'occurence dans chacun des textes.");
                     Get_Line(Buffer, Last);
                     M := Creer_Mot(Buffer(1 .. Last));
                     New_Line;

                     Put_Line("Le nombre d'occurence de " & Character'Val(34) & Buffer(1 .. Last) & Character'Val(34) & " du premier texte est :" & Integer'Image(Query_NbOcc_Txt1(T2, M)) & ".");
                     Put_Line("Le nombre d'occurence de " & Character'Val(34) & Buffer(1 .. Last) & Character'Val(34) & " du deuxieme texte est :" & Integer'Image(Query_NbOcc_Txt2(T2, M)) & ".");

                     Skip_Line;
                     Put_Line("Les mots employes par les deux auteurs sont :");
                     Query_Intersection(T2, Chaine, 0);

                     Skip_Line;
                     Put_Line("Les mots employes par un auteur et pas par l'autre sont :");
                     Query_Difference(T2, Chaine, 0);
                     New_Line;   

                  when 9 =>

                     Creer_Fichier_Txt2(T2);

                  when 10 =>

                     Recup_Fichier_Txt2(T2);

                  when 11 =>

                     AfficheTrie_Txt2(T2, Chaine, 0);
                     New_Line;

                  when 12 =>

                     ViderTrie(T2);

                  when others =>

                     Put_Line("Valeur non valide !");
                     New_Line;

               end case;

            end loop;

         when others =>

            Put_Line("Valeur non valide !");
            New_Line;

      end case;

   end loop;

end;
