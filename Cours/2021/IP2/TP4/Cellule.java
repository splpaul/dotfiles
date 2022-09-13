public class Cellule {
    private Robot robot;
    private Cellule suivant;

    public Cellule(Robot r, Cellule c) {
        robot = r;
        suivant = c;
    }

    public Cellule(Robot r) {
        // new Cellule(r, null);
        robot = r;
        suivant = null;
    }

    public Robot getRobot() { return robot; }
    public Cellule getSuivant() { return suivant; }

    public void affiche() {
        Cellule cell = this;
        while (cell != null) {
            System.out.println(cell.robot.description());
            cell = cell.suivant;
        }
    }

    public void ajouteNouveau(Robot r) {
        Cellule cell = this;
        while (cell.suivant != null) { // On traverse jusqu'a la derniere cellule
            cell = cell.suivant;
        }
        cell.suivant = new Cellule(r);
    }

    public String bandName() {
        String res = "";
        Cellule cell = this;
        while (cell != null) {
            res += cell.robot.getNom();
            cell = cell.suivant;
        }
        return res;
    }

    public int numerologie() {
        int res = 0;
        Cellule cell = this;
        while (cell != null) {
            res += cell.robot.getNom() - 96;
            cell = cell.suivant;
        }
        return res % 9;
    }

    public void chantez() {
        Cellule cell = this;
        while (cell != null) {
            cell.robot.chante();
            cell = cell.suivant;
        }
    }

    public Groupe couperAPartirDe(char nom) {
        Groupe res;
        Cellule cell = this;
        while (cell != null && cell.robot.getNom() != nom) {
            cell = cell.suivant;
        }
        if (cell != null) {
            if (cell.suivant != null) {
                res = new Groupe(cell.suivant);
                cell.suivant = null;
                return res;
            }
        }
        return null;
    }

    public Groupe prendrePause() {
        Groupe res = new Groupe();
        Cellule cell = this;
        while (cell != null) {
            if (cell.robot.getEnergie() == 0) {
                res.ajouteNouveau(cell.robot); // On ajoute le robot au groupe de retour
                if (cell.suivant != null) {
                    // Check si suivant est null pour éviter comportements indéfinis
                    cell.robot = cell.suivant.robot;
                    cell.suivant = cell.suivant.suivant;
                } else {
                    cell = null; // Si le robot de fin de file n'a plus d'énergie la cellule devient null
                }
            } else {
                cell = cell.suivant;
            }
        }
        return res;
    }

    public int effectif() {
        int res = 0;
        Cellule cell = this;
        while (cell != null) {
            res++;
            cell = cell.suivant;
        }
        return res;
    }
}
