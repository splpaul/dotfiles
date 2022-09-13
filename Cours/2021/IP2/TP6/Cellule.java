public class Cellule {
    private boolean noire;
    private boolean prochainEtat;
    private Cellule suivante;
    private Cellule precedente;

    public boolean getNoire() { return noire; }
    public Cellule getSuivante() { return suivante; }
    public Cellule getPrecedente() { return precedente; }

    public Cellule(boolean b) {
        noire = b;
        suivante = null;
        precedente = null;
        prochainEtat = false;
    }

    public Cellule(boolean b, Cellule c1, Cellule c2) {
        noire = b;
        suivante = c1;
        precedente = c2;
        prochainEtat = false;
    }

    public Cellule addLast(boolean b) {
        suivante = new Cellule(b, null, this);
        return suivante;
    }

    public void afficher() {
        System.out.print(noire ? '-' : '#');
    }

    public void affiche() {
        Cellule temp = this;
        while (temp != null) {
            temp.afficher();
            temp = temp.suivante;
        }
        System.out.println(); // Ajouté pour visibilité lors de mes tests
    }

    public void updateNextState() {
        boolean a,b;
        if (precedente != null) a = precedente.noire;
        else a = false;
        if (suivante != null) b = suivante.noire;
        else b = false;
        if (a == b && a == noire) { prochainEtat = false; return; }
        else prochainEtat = true;
    }

    public void updateNextStateMajority() {
        boolean a,b;
        if (precedente != null) a = precedente.noire;
        else a = false;
        if (suivante != null) b = suivante.noire;
        else b = false;
        if (a == b) prochainEtat = a; // Si 2 sont égaux majorité atteinte
        else prochainEtat = noire; // Si a != b alors on sait que la majorité sera celle de self
    }

    public void prochainEtape(boolean maj) {
        Cellule temp = this;
        while (temp != null) {
            if (maj) temp.updateNextStateMajority();
            else temp.updateNextState();
            temp = temp.suivante;
        }
    }

    public void miseAJour() {
        Cellule temp = this;
        while (temp != null) {
            temp.noire = temp.prochainEtat;
            temp = temp.suivante;
        }
    }
}