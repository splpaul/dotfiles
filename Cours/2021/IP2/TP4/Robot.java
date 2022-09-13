public class Robot {
    private final char nom;
    private int energie;
    private final String texte;

    public char getNom() { return nom; }
    public int getEnergie() { return energie; }
    public String getParoles() { return texte; }

    public Robot(char n, String paroles) {
        nom = n;
        energie = 10 + (int) (Math.random() * 11);
        texte = paroles;
    }

    public String description() {
        return "Robot " + nom + " dit " + texte + " et a " + energie + " points d'énergie.";
    }

    public boolean nomCorrect() {
        return (nom <= 'z' && nom >= 'a');
    }

    public void chante() {
        int repet = nom - 96; // A = 97 dans la table ascii
        for (int i = 0; i < repet; i++) {
            System.out.print(texte);
        }
        if (energie < 10) energie = 0;
        else energie -= 10;
    }
}
