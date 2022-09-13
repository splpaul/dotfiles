class CellRob {
    private Robot robot;
    private CellRob suivant;
    private CellRob precedent;

    public Robot getRobot() { return robot; }
    public void setRobot(Robot r) { robot = r; }

    public CellRob getSuivant() { return suivant; }
    public void setSuivant(CellRob c) { suivant = c; }

    public CellRob getPrecedent() { return precedent; }
    public void setPrecedent(CellRob c) { precedent = c; }

    public CellRob(Robot rob, CellRob suiv , CellRob prec) {
        robot = rob;
        suivant = suiv;
        precedent = prec;
    }

    public void affiche() {
        System.out.println(robot.description());
        CellRob stop = this;
        CellRob temp = this;
        while (temp.suivant != stop) {
            System.out.println(temp.suivant.robot.description());
            temp = temp.suivant;
        }
    }

    public void ajouteRobot(Robot r) {
        CellRob first = this;
        CellRob temp = this;
        while (temp.suivant != first) {
            temp = temp.suivant;
        }
        temp.suivant = new CellRob(r, first, temp);
        first.precedent = temp.suivant;
    }

    public boolean supprimer(int id) {
        CellRob courant = this.precedent;
        CellRob temp = this;

        while (temp != courant) {
            if (temp.robot.id == id) {
                CellRob p = temp.precedent;
                CellRob s = temp.suivant;
                p.setSuivant(s);
                temp.precedent = p;
                return true;
            }
            temp = temp.suivant;
        }
        return false;
    }


    public boolean supprimer(String nom) {
        CellRob courant = this.precedent;
        CellRob temp = this;

        while (temp != courant) {
            if (temp.robot.nom.equals(nom)) {
                CellRob p = temp.precedent;
                CellRob s = temp.suivant;
                p.setSuivant(s);
                temp.precedent = p;
                return true;
            }
            temp = temp.suivant;
        }
        return false;
    }
}
