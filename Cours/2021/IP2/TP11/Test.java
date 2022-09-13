public class Test {
    public static void main(String[] args) {
        Noeud a = new Noeud("x");
        Noeud b = new Noeud("2");
        Noeud c = new Noeud("+", a, b);
        Noeud d = new Noeud("6");
        Noeud e = new Noeud("3");
        Noeud f = new Noeud("/", d, e);
        Noeud g = new Noeud("4");
        Noeud h = new Noeud("-", f, g);
        Noeud i = new Noeud("*", c, h);
        Noeud z = new Noeud("-", null, i);
        Arbre arbre = new Arbre(z);

        System.out.println("Expression :");
        arbre.afficheExpression();
        System.out.println("\n Expression simplifiée :");
        arbre.simplifier().afficheExpression();
    }
}
