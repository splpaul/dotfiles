class Test {
    public static void main(String[] args) {
        Robot pierre = new Robot("Pierre", "Je m'appelle Pierre");
        Robot luc = new Robot("Luc", "Je m'appelle Luc");
        Robot Jacquie = new Robot("Jacquie", "Je m'appelle Jacquie");

        TableRonde table = new TableRonde(pierre);
        table.ajouteRobot(luc);
        table.ajouteRobot(Jacquie);

        DiscussionEntreRobots.discussionEntreRob(table);
    }
}