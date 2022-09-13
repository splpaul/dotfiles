class Automate {
    private Cellule premiere;
    private Cellule derniere;
    private boolean majorityRule; // Défini la règle utilisée

    public Automate(boolean maj) {
        premiere = null;
        derniere = null;
        majorityRule = maj;
    }

    public Automate(String str, boolean maj) {
        new Automate(maj);
        for (int i = 0; i < str.length(); i++) {
            addLast(charToBool(str.charAt(i)));
        }
    }

    public void add(boolean b) {
        if (premiere == null) {
            premiere = new Cellule(b);
            derniere = premiere;
        }
        else {
            Cellule temp = premiere;
            premiere = new Cellule(b, temp, null);
        }
    }

    public void addLast(boolean b) {
        if (premiere == null) {
            premiere = new Cellule(b);
            derniere = premiere;
        }
        else {
            derniere = derniere.addLast(b);
        }
    }

    public void affiche() {
        if (premiere == null) return;
        else premiere.affiche();
    }

    public boolean charToBool(char c) {
        if (c == '-') return true;
        else return false;
    }

    public void prochainEtape() {
        if (premiere != null) premiere.prochainEtape(majorityRule);
    }

    public void miseAJour() {
        if (premiere != null) premiere.miseAJour();
    }

    public void uneEtape() {
        prochainEtape();
        miseAJour();
    }

    public void nEtapes(int n) {
        for (int i = 0; i < n; i++) {
            uneEtape();
        }
    }
}
