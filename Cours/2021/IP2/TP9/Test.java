public class Test {
    public static void main(String[] args) {
        Noeud a = new Noeud(6, null, new Noeud(8));
        Noeud b = new Noeud(9, new Noeud(2), a);
        Noeud c = new Noeud(5, b, null);
        Noeud d = new Noeud(1, new Noeud(4), null);
        Noeud e = new Noeud(7, new Noeud(0), d);
        Noeud f = new Noeud(3, c, e);

        Arbre g = new Arbre(f);
        int[] tab = {6,1,2,3,7,5};
        Arbre h = new Arbre(tab);
        h.affichePrefixe();
        h.afficheInfixe();
        // System.out.println(g.recherche(7));
        // System.out.println(g.recherche(1));
        // System.out.println(g.recherche(2));
        // System.out.println(g.recherche(6));
        // System.out.println(g.recherche(10));
        // System.out.println("Affiche Arbre original: ");
        // g.afficheInfixe();
        // Arbre h = new Arbre(g);
        // System.out.println("Affiche copie: ");
        // h.afficheInfixe();
        // System.out.println("Affiche Suffixe:");
        // g.afficheSuffixe();
        // System.out.println("Affiche Prefixe:");
        // g.affichePrefixe();
        // System.out.println("Profondeur de l'arbre: " + g.profondeur());
    }
}
