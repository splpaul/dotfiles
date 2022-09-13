class Chat {
    private Salon[] salons;
    private int nbSalons = 0;

    public Chat() {
        salons = new Salon[10];
    }

    public void ajouterSalon(Salon s) {
        if (nbSalons == 10)
            return;
        salons[nbSalons] = s;
        nbSalons++;
    }

    public boolean estPresent(Utilisateur u) {
        for (int i = 0; i < salons.length; i++) {
            Salon s = salons[i];
            if (s.estPresent(u))
                return true;
        }
        return false;
    }

    // Pas besoin de tester si l'user est présent car parcourerait tous les salons (comme cette fonction) donc
    // aucun gain de performance et si l'user n'est pas présent on retourne 0
    public int nombreMessages(Utilisateur u) {
        int res = 0;
        for (int i = 0; i < salons.length; i++) {
            Salon s = salons[i];
             for (int j = 0; j < s.getNbMessages(); j++) {
                Message msg = s.getMessages()[j];
                if (msg.getAuteur() == u)
                    res++;
            }
        }
        return res;
    }

    public Utilisateur bavard() throws Exception {
        Utilisateur res;
        if (nbSalons == 0) {
            throw new Exception("Aucun salon dans ce chat");
        }
        else
            res = salons[0].getUsers()[0];
        int temp= 0;
        for (Salon s: salons) {
            Utilisateur[] users = s.getUsers();
            for (int i = 0; i < users.length; i++) {
                Utilisateur u = users[i];
                if (nombreMessages(u) > temp) {
                    temp = nombreMessages(u);
                    res = u;
                }
            }
        }
        return res;
    }
}