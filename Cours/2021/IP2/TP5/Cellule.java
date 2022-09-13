public class Cellule {
    private int valeur;
    private Cellule suivante;

    public int getValeur() { return valeur; }
    public Cellule getSuivante() { return suivante; }

    public Cellule(int i) {
        valeur = i;
        suivante = null;
    }

    public Cellule(int i, Cellule c) {
        valeur = i;
        suivante = c;
    }

    public String description() {
        if (suivante == null) {
            return valeur + ")";
        } else {
            return valeur + ";" + suivante.description();
        }
    }

    public int taille() {
        if (suivante != null) return 1 + suivante.taille();
        else return 1;
    }

    public int somme() {
        if (suivante != null) return valeur + suivante.somme();
        else return valeur;
    }

    public boolean egal(Cellule c) {
        if (valeur != c.valeur) return false;
        if (suivante == null) {
            if (c.suivante == null) return true;
            else return false;
        }
        return suivante.egal(c.suivante);
    }

    public void ajouter_en_i(int x, int i) {
        if (suivante == null) { // Si i plus grand que la liste on ajoute en fin
            suivante = new Cellule(x);
        }
        else {
            if (i == 0) {
                Cellule temp = new Cellule(valeur, suivante);
                valeur = x;
                suivante = temp;
            }
            else {
                suivante.ajouter_en_i(x, i-1);
            }
        }
    }

    public boolean supprimer_en_i(int i) {
        if (i == 1) { // On s'arrete avant la cellule a supprimer
            suivante = suivante.suivante;
            return true;
        }
        else if (suivante != null) return suivante.supprimer_en_i(i - 1);
        return false;
    }

    public int supprimer_k_premieres_occ(int k, int v, int res) {
        if (suivante == null || res == k) return res;
        else if (suivante.valeur == v) {
            if (suivante.suivante != null) {
                suivante = suivante.suivante;
                return supprimer_k_premieres_occ(k, v, res + 1);
            }
            else {
                suivante = null;
                return res + 1;
            }
        }
        return suivante.supprimer_k_premieres_occ(k, v, res);
    }
}
