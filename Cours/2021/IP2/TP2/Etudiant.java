public class Etudiant {
    final String prenom;
    final String nom;
    private double note;

    private static int nombreDEtudiants;
    private static double sommeDesNotes;

    public double getNote() { return note;}
    public static int getNbEtudiants() { return nombreDEtudiants;}
    public static double getSommeDesNotes() { return sommeDesNotes;}

    public Etudiant(String prenom, String nom, double note) {
        this.prenom = prenom;
        this.nom = nom;
        this.note = note;

        Etudiant.nombreDEtudiants++;
        Etudiant.sommeDesNotes += note;
    }

    public void afficher() {
        System.out.println("<" + nom + "> " + "<" + prenom + "> : " + "<" + note + ">");
    }

    public static void afficher(Etudiant e) {
        System.out.println("<" + e.nom + "> " + "<" + e.prenom + "> : " + "<" + e.note + ">");
    }

    public boolean estAdmis() {
        return (note >= 10);
    }

    public static double moyenne() {
        return getSommeDesNotes() / getNbEtudiants();
    }

    public boolean estMeilleurQueLaMoyenne() {
        return (note > Etudiant.moyenne());
    }

    public void modifierNote(double nouvelleNote) {
        sommeDesNotes = sommeDesNotes - note + nouvelleNote;
        note = nouvelleNote;
    }
}
