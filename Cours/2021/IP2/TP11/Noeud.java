public class Noeud {
    private String etiquette;
    private Noeud gauche;
    private Noeud droite;

    public Noeud(String s) {
        etiquette = s;
        gauche = null;
        droite = null;
    }

    public Noeud(String s, Noeud g, Noeud d) {
        etiquette = s;
        gauche = g;
        droite = d;
    }

    public Arbre simplifier() {
        Arbre res = new Arbre(this.copie());
        res.simplifyReplace();
        return res;
    }

    public void simplifyReplace() {
        if (gauche != null) gauche.simplifyReplace();
        if (droite != null) droite.simplifyReplace();

        if (gauche != null && droite != null) {
            if (gauche.isLeaf() && droite.isLeaf()) {
                if (gauche.isNotVariable() && droite.isNotVariable()) {
                    etiquette = "" + this.eval();
                    gauche = null;
                    droite = null;
                }
            }
        }
    }

    public boolean isNotVariable() {
        return (!etiquette.equals("x"));
    }

    public boolean isLeaf() {
        return (gauche == null && droite == null);
    }

    public double evaluer(double z) {
        switch (etiquette) {
        case "+": return gauche.evaluer(z) + droite.evaluer(z);
        case "-": return (gauche == null ? droite.evaluer(z) : gauche.evaluer(z) - droite.evaluer(z));
        case "*": return gauche.evaluer(z) * droite.evaluer(z);
        case "/": return gauche.evaluer(z) / droite.evaluer(z);
        case "x": return z;
        default: return Double.parseDouble(etiquette);
        }
    }

    public double eval() {
        switch (etiquette) {
        case "+": return gauche.eval() + droite.eval();
        case "-": return (gauche == null ? droite.eval() : gauche.eval() - droite.eval());
        case "*": return gauche.eval() * droite.eval();
        case "/": return gauche.eval() / droite.eval();
        default: return Double.parseDouble(etiquette);
        }
    }

    public void afficheExpression() {
        if (gauche != null) {
            System.out.print("(");
            gauche.afficheExpression();
        }
        System.out.print(etiquette);
        if (droite != null) {
            droite.afficheExpression();
            System.out.print(")");
        }
    }

    public boolean verif() {
        switch (etiquette) {
        case "+":
        case "*":
        case "/":
            return (gauche.verif() && droite.verif());
        case "-":
            return droite.verif();
        case "x":
            return (gauche == null && droite == null); // On ne peut avoir x que sur une feuille
        default:
            return Arbre.estNombre(etiquette);
        }
    }

    public Noeud copie() { //
        Noeud g = null, d = null;
        if (gauche != null) g = gauche.copie();
        if (droite != null) d = droite.copie();
        return new Noeud(etiquette, g, d);
    }

}
