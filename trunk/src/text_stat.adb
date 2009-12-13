package body Text_Stat is

   function Num_Mot_Tot(L: TListe_Couple) return Integer is
      n: Integer;
      Ltemp: TListe_Couple;
   begin
      Ltemp := L;
      while not EstVide(ltemp) loop
         -- interdit : Ltemp est du type TlisteCouple, autre nompour le type priv� Tlist de couples
         -- or vous l'utilisez comme un type acces !!
         -- il faut ecrire
         -- while not estvide(ltemp) loop
         N:=N+1;
          Ltemp := Suivant(Ltemp); -- meme remarque : il va fallier ajouter une fonction suivant...
      end loop;
      return N;
   end;

   function Num_Occ_Moy(L: TListe_Couple) return Float is
      n,total: Integer;
      Ltemp: TListe_Couple;
   begin
      N:=0;Total:=0;
      Ltemp := L;
      while not EstVide(Ltemp) loop
         N:=N+Get_Nbocc(Valeur(Ltemp));
         Total:=Total+1;
         Ltemp := Suivant(Ltemp);
      end loop;
      return Float(N)/Float(Total);
   end;

   function Long_Moy(L: TListe_Couple) return Float is
      n,total: Integer;
      Ltemp: TListe_Couple;
   begin
      N:=0;Total:=0;
      Ltemp := L;
      while not EstVide(Ltemp) loop
         N:=N+Get_Mot(Valeur(Ltemp))'Length;
         Total:=Total+1;
         Ltemp := Suivant(Ltemp);
      end loop;
      return Float(N)/Float(Total);
   end;

   function Num_Mot_Sup(L: TListe_Couple;N: Integer) return Integer is
      x: Integer;
      Ltemp: TListe_Couple;
   begin
      x :=0;
      Ltemp:= L;
      while not EstVide(Ltemp) loop
         if Get_Mot(Valeur(Ltemp))'Length > N then x:=x+1;
         end if;
         Ltemp := Suivant(Ltemp);
      end loop;
      return X;
   end;

end text_stat;
