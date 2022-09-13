class Pot {
    private Confiture confiture;
    private int quantite;
    private static int total;
    private int num;

    public Pot(Confiture c, int q) {
        confiture = c;
        quantite = q;
        total++;
        num = total;
    }

    public static int dernierNum() { return total; }

    public String description() { return "Pot de " + quantite + " grammes de " + confiture.description(); }
}
