public class Test {
    public static void main(String[] args) {
    Liste liste = new Liste();
    Liste autre_liste = new Liste();
    liste.add(2);
    liste.add(0);
    liste.add(4);
    liste.add(1);
    liste.add(2);
    liste.add(3);
    liste.add(5);
    liste.add(0);
    liste.add(2);
    liste.add(2);
    liste.add(4);
    liste.add(6);
    liste.add(10);
    liste.add(2);
    System.out.println(liste.description());
    // liste.ajouter_en_i(5, 2);
    // liste.supprimer_en_i(0);
    System.out.println("Nombre de délétions: " + liste.supprimer_k_premieres_occ(3, 2));
    System.out.println(liste.description());
    // System.out.println(liste.taille());
    // System.out.println(liste.somme());
    // System.out.println(liste.egal(autre_liste));
    }
}
