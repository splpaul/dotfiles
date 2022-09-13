public class Liste {
    private Cellule head;

    public Liste() {
        head = null;
    }

    public void add(int x) {
        if (head == null) head = new Cellule(x);
        else {

        }
    }

    public String description() {
        if (head == null) return "La liste est vide.";
        else return head.description();
    }
}
