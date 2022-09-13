public class Trio {
    private Etudiant[] membres;

    public Trio(Etudiant e1, Etudiant e2, Etudiant e3) {
        membres = new Etudiant[3];
        membres[0] = e1;
        membres[1] = e2;
        membres[2] = e3;
    }

    public Etudiant premier() {
        double max = 0;
        for (int i = 1;  i < 3; i++) {
            if (membres[i].getNote() > membres[(int)max].getNote())
                max = membres[i].getNote();
        }
        return membres[(int)max];
    }

    /* Pour la méthode classement, on favorise l'étudiant passé en argument en cas d'ex aequo */
    public int classement(String prenom, String nom) {
        int res = 3;
        for (int i = 0; i < 3; i++) {
            if (prenom.equals(membres[i].prenom) && nom.equals(membres[i].nom)) {
                for (int j = 0; j < 3; j++) {
                    if (j == i) // Ne pas comparer avec soi meme
                        continue;
                    if (membres[i].getNote() >= membres[j].getNote())
                        res--;
                }
                return res;
            }
        }
        return 0; // Si l'étudiant n'est pas dans le trio
    }

    public double moyenne() {
        double res = 0;
        for (Etudiant e: membres) {
            res += e.getNote();
        }
        return res / 3;
    }

    public boolean estMeilleurQueLaMoyenne() {
        return (moyenne() > Etudiant.moyenne());
    }
}
