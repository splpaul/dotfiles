import java.util.Arrays;
public class Arbre {
    private Noeud sommet;

    public Arbre(Noeud s) {
        sommet = s;
    }

    public Arbre() {
        sommet = null;
    }

    public Arbre(Arbre a) {
        sommet = a.sommet.copie();
    }

    public Arbre(int[] tab) {
        int n = tab.length;
        int r = n / 2;
        if (n == 1) {
            sommet = new Noeud(tab[r], null, null);
        }
        else {
            int[] tabGauche = Arrays.copyOfRange(tab, 0, r);
            int[] tabDroite = Arrays.copyOfRange(tab, r + 1, n);
            sommet = new Noeud(tab[r], new Arbre(tabGauche).sommet, new Arbre(tabDroite).sommet);
        }
    }

    public void afficheInfixe() {
        if (sommet == null) System.out.println("Arbre vide.");
        else sommet.afficheInfixe();
    }

    public void afficheSuffixe() {
        if (sommet == null) System.out.println("Arbre vide.");
        else sommet.afficheSuffixe();
    }

    public void affichePrefixe() {
        if (sommet == null) System.out.println("Arbre vide.");
        else sommet.affichePrefixe();
    }

    public int nbNoeuds() {
        if (sommet == null) return 0;
        else return sommet.nbNoeuds();
    }

    public int somme() {
        if (sommet == null) return 0;
        else return sommet.somme();
    }

    public int profondeur() {
        if (sommet == null) return 0;
        else return sommet.profondeur();
    }

    public boolean recherche(int e) {
        if (sommet == null) return false;
        else return sommet.recherche(e);
    }
}
