public class Liste {
    private Cellule premier;

    public Cellule getPremier() { return premier; }

    public Liste() {
        premier = null;
    }

    public void add(int x) {
        if (premier == null) premier = new Cellule(x);
        else {
            Cellule temp = premier;
            premier = new Cellule(x, temp);
        }
    }

    public String description() {
        if (premier == null) return "La liste est vide";
        else return "(" + premier.description();
    }

    public int taille() {
        if (premier == null) return 0;
        else return premier.taille();
    }

    public int somme() {
        if (premier == null) return 0;
        else return premier.somme();
    }

    public boolean egal(Liste l) {
        if (premier == null ^ l.premier == null) return false; // Si seulement 1 est null => faux
        if (premier == null && l.premier == null) return true;
        return premier.egal(l.getPremier());
    }

    public void ajouter_en_i(int x, int i) {
        if (i <= 0) { // Si l'index est <= 0 on ajoute en tete
            Cellule temp = premier;
            premier = new Cellule(x, temp);
        }
        else {
            premier.ajouter_en_i(x, i);
        }
    }

    public boolean supprimer_en_i(int i) {
        if (i < 0 || premier == null) return false;
        if (i == 0) {
            premier = premier.getSuivante();
            return true;
        }
        else return premier.supprimer_en_i(i);
    }

    public int supprimer_k_premieres_occ(int k, int v) {
        int res = 0;
        if (k == 0 || premier == null) return 0;
        while (premier.getValeur() == v) {
            if (premier.getSuivante() != null) {
                premier = premier.getSuivante();
                res++;
            }
            else {
                premier = null;
                return res + 1;
            }
        }
        return premier.supprimer_k_premieres_occ(k, v, res);
    }
}
