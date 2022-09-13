class Robot {
    static int nbRob = 0;
    int id;
    int np;
    String texte;
    String nom;

    public Robot(String n, String text) {
        nbRob++;
        id = nbRob;
        texte = text;
        np = texte.length();
        nom = n;
    }

    public boolean finiDeParler() { return np<=0; }

    public int parle(int n) {
        int point = texte.length() - np;
        int max = texte.length();
        if (point + n >= texte.length()) max = texte.length() - 1;
        for (int i = point; i < max; i++) {
            System.out.print(texte.charAt(i));
        }
        return np - n;
    }

    public String description() {
        return "Robot " + nom + " avec identifiant " + id;
    }
}
