public class Tableau {
    private Groupe[] groupes;

    public Tableau(int i) {
        groupes = new Groupe[i];
    }

    public void setGroupeByIndex(Groupe g, int i) { groupes[i] = g; }

    public int[] effectifs() {
        int n = groupes.length;
        int[] res = new int[n];
        for (int i = 0; i < n; i++) {
            res[i] = groupes[i].effectif();
        }
        return res;
    }
}
