public class Exo3 {

}

public class Arbre {
    private Noeud racine;

    public Arbre() {
        racine = null;
    }

    public void printBFS() {
        if (racine != null) racine.printBFS();
    }

    public int nbCheminsPoids() {
        if (racine == null) return 0;
        else return racine.nbCheminsPoids();
    }
}

public class Noeud {
    private int etiquette;
    private Noeud gauche;
    private Noeud droite;

    public Noeud(int i) {
        etiquette = i;
        gauche = null;
        droite = null;
    }

    public void printBFS() {
        MaFile f = new MaFile();
        Noeud temp;
        f.add(this);
        while (!f.isEmpty()) {
            temp = f.get();
            System.out.println(temp.etiquette);
            if (temp.gauche != null) f.add(gauche);
            if (temp.droite != null) f.add(droite);
        }
    }

    public int nbCheminsPoids(int x) {
        int res = 0;
        Noeud temp = this;
        while ()
    }
}