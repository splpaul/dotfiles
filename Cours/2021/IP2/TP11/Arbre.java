public class Arbre {
    private Noeud sommet;

    public Arbre() {
        sommet = null;
    }

    public Arbre(Noeud n) {
        sommet = n;
    }

    public Arbre simplifier() {
        if (sommet == null) return this;
        else return sommet.simplifier();
    }

     public void simplifyReplace() {
        if (sommet != null) sommet.simplifyReplace();
    }

    public double eval() {
        if (sommet == null) return 0;
        else return sommet.eval();
    }

    public double evaluer(double z) { // calcule f(z)
        if (sommet == null) return 0;
        else return sommet.evaluer(z);
    }

    public void afficheExpression() {
        if (sommet != null) sommet.afficheExpression();
    }

    public boolean verif() {
        if (sommet == null) return false;
        else return sommet.verif();
    }

    public static boolean estNombre(String s) {
        if (s.length() == 0) return false;
        char c = s.charAt(0);
        boolean dotBefore = false;

        if (c != '+' && c != '-' && !isDigit(c)) return false;

        for (int i = 1; i < s.length(); i++) {
            c = s.charAt(i);
            if (!isDigit(c)) {
                if (c == '.') {
                    if (dotBefore) return false; // 2 points
                    else {
                        dotBefore = true;
                        if (i == s.length() - 1) return false; // finit par un point
                    }
                }
            }
        }
        return true;
    }

    public static boolean isDigit(char c) {
        return (c >= 48 && c <= 57);
    }
}
