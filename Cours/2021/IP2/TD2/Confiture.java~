class Confiture {
    private final String fruit;
    private int proportion;
    private int cal;
    public static int sugar = 387;

    public String getFruit() { return fruit; }
    public void setCal(int c) { cal =  c;  }
    public void setProportion(int p) { proportion = p; }

    public Confiture(String f, int p, int c) {
        fruit = f;
        proportion = p;
        cal = c;
    }

    public Confiture(String f, int c) {
        fruit = f;
        cal = c;
        proportion = 50;
    }

    public String description() {
        return "Confiture de " + fruit + ", " + proportion + "% de fruit, " + cal + " calories aux 100 grammes";
    }

    public int calorieProportion(int quantite) {
        return cal / (100 / quantite);
    }

    public boolean egal(Confiture c) {
        return (fruit.equals(c.fruit) && proportion == c.proportion && cal == c.cal);
    }
}
