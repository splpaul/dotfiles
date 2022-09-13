public class Exo2 {

}

public class ListeCircDouble {
    private Cellule2 tete;
    public ListeCircDouble() { tete = null; }

    public void retireLastCell() {
        if (next == null) return;
        Cellule2 tete = this;
        Cellule2 temp = this;
        while (temp.next != tete) {
            temp = temp.next;
        }
        temp.prev.next = tete;
        tete.prev = temp.prev;
    }

    public ListeCircDouble fusionneAvec(ListeCircDouble l) {
        if (tete != null) return tete.fusionneAvec(l);
        return this;
    }
}

public class Cellule2 {
    private int content;
    private Cellule2 prev;
    private Cellule2 next;
    private Cellule2 getNext() { return next; }
    private Cellule2 getPrev() { return prev; }
    private Cellule2 setNext(Cellule2 c) { next = c; }
    private Cellule2 setPrev(Cellule2 c) { prev = c; }

    public void fusionneAvec(ListeCircDouble l) {
        Cellule2 tete = this;
        Cellule2 temp = this;
        while (temp.next != tete) {
            temp = temp.next;
        }
        temp.next = l.getTete();
        while (temp.next != l.getTete()) {
            temp = temp.next;
        }
        temp.next = tete;
        tete.prev = temp;
    }
}
