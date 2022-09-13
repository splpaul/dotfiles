public class Test {
    public static void main(String[] args) {
        Groupe groupe = new Groupe();
        Groupe groupe1 = new Groupe();
        Groupe groupe2 = new Groupe();
        Robot robot = new Robot('a', "pomme");
        Robot robot1 = new Robot('b', "fraise");
        Robot robot2 = new Robot('c', "peche");
        Robot robot3 = new Robot('d', "banane");
        Robot robot4 = new Robot('e', "abricot");
        Robot robot5 = new Robot('f', "myrtille");

        // groupe.ajouteNouveau(robot);
        // groupe.ajouteNouveau(robot1);
        // groupe.ajouteNouveau(robot2);
        // groupe.ajouteNouveau(robot3);
        // groupe.ajouteNouveau(robot4);
        // groupe.affiche();
        // System.out.println(groupe.numerologie());
        // System.out.println("SUPPRESION A PARTIR DE A");
        // System.out.println("GROUPE 1");
        // groupe.couperAPartirDe('a').affiche();
        // System.out.println("GROUPE 2");
        // groupe.affiche();
        // System.out.println("----------");
        // System.out.println("GROUPE INITIAL:");
        // groupe.affiche();
        // groupe.chantez();
        // System.out.println("----------");
        // System.out.println("GROUPE EXTRAIT:");
        // groupe.prendrePause().affiche();
        // System.out.println("GROUPE INITIAL:");
        // groupe.affiche();
        // groupe.chantez();
        // System.out.println("----------");
        // System.out.println("GROUPE EXTRAIT:");
        // groupe.prendrePause().affiche();

        groupe.ajouteNouveau(robot);
        groupe.ajouteNouveau(robot2);
        groupe1.ajouteNouveau(robot3);
        groupe1.ajouteNouveau(robot4);
        groupe2.ajouteNouveau(robot5);
        groupe2.ajouteNouveau(robot1);
        Tableau tab = new Tableau(3);
        tab.setGroupeByIndex(groupe, 0);
        tab.setGroupeByIndex(groupe1, 1);
        tab.setGroupeByIndex(groupe2, 2);
        for (int i: tab.effectifs()) {
            System.out.println("Effectif du groupe:" + i);
        }
    }
}
