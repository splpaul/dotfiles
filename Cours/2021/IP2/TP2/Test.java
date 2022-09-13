public class Test {
    public static void main(String[] args) {
        Etudiant e1 = new Etudiant("Luke", "Skywalker", 8.25);
        Etudiant e2 = new Etudiant("Leia", "Skywalker", 11.75);
        Etudiant e3 = new Etudiant("Paul", "Spielmann", 17);
        System.out.println("nb d'étudiants : " + Etudiant.getNbEtudiants());
        System.out.println("somme des notes : " + Etudiant.getSommeDesNotes());
        Etudiant.afficher(e1);
        e2.afficher();
        e3.afficher();
        System.out.println(Etudiant.moyenne());
        Trio trio = new Trio(e1, e2, e3);
    }

    /*
     * Réponses
     * 2) Les attributs private ne sont pas accessibles sauf par les méthodes de la classe
     * les attributs static sont communs a tous les objets de la classe
     *
     * 4) Afin d'empêcher la modification des champs, nombreDetudiants et sommeDesnotes
     * sont passé en private et on ajoute des getters (pas besoin de setter car on ne
     * souhaite pas changer les valeurs sauf par les méthodes de la classe)
     */
}
