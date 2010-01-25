with Mot;
use Mot;

package Trie is

   type T_Trie is private;  
   subtype Tindice is character range Character'Val(39) .. Character'Val(255); -- ''' .. 'z';
      
   function CreerTrie return T_Trie;
   procedure ViderTrie (T : in out T_Trie);
   
   function TrieVide (T : in T_Trie) return Boolean;
   function STVide (T : in T_Trie; I : in Tindice) return Boolean;

   function Get_ST (T : in T_Trie; I : in Tindice) return T_Trie;
   function Get_MotsTxt1 (T : in T_Trie) return Integer;
   function Get_MotsTxt2 (T : in T_Trie) return Integer;
   function Get_Prefixes (T : in T_Trie) return Integer;
   
   function AjouterMot_Txt1 (T : in T_Trie; M : in T_Mot; N : in Integer) return T_Trie;
   function AjouterMot_Txt2 (T : in T_Trie; M : in T_Mot; N : in Integer) return T_Trie;

   procedure AfficheTrie_Txt1(T : in T_Trie; C : in String; F : in Natural);
   procedure AfficheTrie_Txt2(T : in T_Trie; C : in String; F : in Natural); 
   
   function CompteMotsTxt1 (T : in T_Trie; M : in T_Mot) return Integer;   
   function CompteMotsTxt2 (T : in T_Trie; M : in T_Mot) return Integer;  

   private

   type Tab is array (Tindice) of T_Trie;    
   type Cellule;
   type T_Trie is access Cellule;
   type Cellule is record
      ST : Tab;
      MotsTxt1 : Integer;
      MotsTxt2 : Integer;
      Prefixes : Integer;
   end record;

end Trie;
