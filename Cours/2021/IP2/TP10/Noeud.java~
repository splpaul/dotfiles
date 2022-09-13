public class Noeud {
    private int etiquette;
    private Noeud gauche;
    private Noeud droite;

    public Noeud(int e, Noeud g, Noeud d) {
        etiquette = e;
        gauche = g;
        droite = d;
    }

    public Noeud(int e) {
        this(e, null, null);
    }

    public void afficheInfixe() {
        if (gauche != null) gauche.afficheInfixe();
        System.out.println(etiquette);
        if (droite != null) droite.afficheInfixe();
    }

    public void afficheSuffixe() {
        if (gauche != null) gauche.afficheSuffixe();
        if (droite != null) droite.afficheSuffixe();
        System.out.println(etiquette);
    }

    public void affichePrefixe() {
        System.out.println(etiquette);
        if (gauche != null) gauche.affichePrefixe();
        if (droite != null) droite.affichePrefixe();
    }

    public int nbNoeuds() {
        int res = 0;
        res ++;
        if (gauche != null) res += gauche.nbNoeuds();
        if (droite != null) res += droite.nbNoeuds();
        return res;
    }

    public int somme() {
        int res = 0;
        res += etiquette;
        if (gauche != null) res += gauche.somme();
        if (droite != null) res += droite.somme();
        return res;
    }

    public int hauteur() {
        if (gauche == null && droite == null) return 1;
        int  resd = 0, resg = 0;
        if (gauche != null) resg = gauche.hauteur();
        if (droite != null) resd = droite.hauteur();
        return 1 + max(resg, resd);
    }

    public int profondeur() { return hauteur() - 1;}

    public boolean recherche(int e) {
        if (etiquette == e) return true;
        boolean a = false, b = false;
        if (gauche != null) a = gauche.recherche(e);
        if (droite != null) b = droite.recherche(e);
        return (a || b);
    }

    //------------//
    public Noeud copie() { // Utilisé sur noeud N, copie récursivement l'arbre en dessous de N
        Noeud g = null, d = null;
        if (gauche != null) g = gauche.copie();
        if (droite != null) d = droite.copie();
        return new Noeud(etiquette, g, d);
    }

    public int max(int a, int b) {
        if (a < b) return b;
        else return a;
    }
}
