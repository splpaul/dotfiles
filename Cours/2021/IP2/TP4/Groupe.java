public class Groupe {
    public Cellule chefDeFile;

    public Groupe() {
        chefDeFile = null;
    }

    public Groupe(Cellule cell) {
        chefDeFile = cell;
    }

    public void prendreTete(Robot r) {
        if (r.nomCorrect()) {
            chefDeFile = new Cellule(r, chefDeFile);
        }
    }

    public void affiche() {
        if (chefDeFile != null) chefDeFile.affiche();
    }

    public void ajouteNouveau(Robot r) {
        if (chefDeFile == null) chefDeFile = new Cellule(r);
        else chefDeFile.ajouteNouveau(r);
    }

    public String bandName() {
        if (chefDeFile == null) return "";
        else return chefDeFile.bandName();
    }

    public int numerologie() {
        if (chefDeFile == null) return 0;
        else return chefDeFile.numerologie();
    }

    public void chantez() {
        if (chefDeFile != null) chefDeFile.chantez();
    }

    public Groupe couperAPartirDe(char nom) {
        if (chefDeFile == null) return null;
        else return chefDeFile.couperAPartirDe(nom);
    }

    public Groupe prendrePause() {
        if (chefDeFile == null) return null;
        else return chefDeFile.prendrePause();
    }

    public int effectif() {
        if (chefDeFile == null) return 0;
        else return chefDeFile.effectif();
    }
}
