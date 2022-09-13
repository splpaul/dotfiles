class TableRonde {
    private CellRob courant;

    public CellRob getCourant() { return courant; }

    public TableRonde(Robot rob) {
        courant = new CellRob(rob, null, null);
    }

    void affiche() {
        courant.affiche();
    }

    public void ajouteRobot(Robot r) {
        if (courant.getSuivant() == null) courant.setSuivant(new CellRob(r, courant, courant));
        else courant.ajouteRobot(r);
    }

    public boolean supprimer(int id) {
        if (courant.getRobot().id == id) {
            CellRob p = courant.getPrecedent();
            CellRob s = courant.getSuivant();
            p.setSuivant(s);
            courant = s;
            courant.setPrecedent(p);
            return true;
        }
        else return courant.getSuivant().supprimer(id);
    }

    public boolean supprimer(String nom) {
        if (courant.getRobot().nom.equals(nom)) {
            CellRob p = courant.getPrecedent();
            CellRob s = courant.getSuivant();
            p.setSuivant(s);
            courant = s;
            courant.setPrecedent(p);
            return true;
        }
        else return courant.getSuivant().supprimer(nom);
    }
}
