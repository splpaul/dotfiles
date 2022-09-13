public class Cellule {
    private int valeur;
    private Cellule next;

    public int getValeur() { return valeur; }
    public Cellule getNext() { return next; }

    public Cellule(int i) {
        valeur = i;
        next = null;
    }

    public Cellule(int i, Cellule c) {
        valeur = i;
        next = c;
    }

    public String description() {
        String res = "(";
        Cellule temp = this;
        while (temp != null) {
            res += valeur + (temp.next == null ? ")" : ";");
            temp = temp.next;
        }
        return res;
    }
}
