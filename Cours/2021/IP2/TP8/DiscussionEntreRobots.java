class DiscussionEntreRobots {
    public static void discussionEntreRob(TableRonde table) {
        CellRob temp = table.getCourant();
        while (table.getCourant() != null) {
            Robot rob = temp.getRobot();
            if (rob.finiDeParler()) {
                table.supprimer(rob.id);
                temp = table.getCourant();
            }
            else {
                rob.np = rob.parle(5);
                temp = temp.getSuivant();
            }
        }
    }
}
