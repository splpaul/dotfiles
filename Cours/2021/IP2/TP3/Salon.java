class Salon {
    private Utilisateur[] utilisateurs = new Utilisateur[10];
    private Message[] messages = new Message[10];
    private int nbMessages = 0;
    private int nbUsers;

    public Salon(Utilisateur u) {
        nbUsers = 1;
        utilisateurs[0] = u;
    }

    public boolean estPresent(Utilisateur u) {
        for (Utilisateur user : utilisateurs) {
            if (u == user)
                return true;
        }
        return false;
    }

    public void ajouterUtilisateur(Utilisateur u) {
        if (estPresent(u) || nbUsers == 10)
            return;
        utilisateurs[nbUsers] = u;
        nbUsers++;
    }

    public void ajouterMessage(Message msg) {
        if (nbMessages == 10)
            return;
        if (estPresent(msg.getAuteur())) {
            messages[nbMessages] = msg;
            nbMessages++;
        }
    }

    public void afficher() {
        for (int i = 0; i < nbMessages; i++) {
            System.out.println(messages[i].prettyPrint());
        }
    }

    public void exclure(Utilisateur u) {
        if (!estPresent(u)) {
            return;
        }
        int count = 0;
        int index = 0;
        for (int i = 0; i < nbMessages; i++) {
            if (messages[i].getAuteur() == u) {
                count++;
            }
        }
        Message[] temp = new Message[nbMessages - count];
        for (int i = 0; i < nbMessages; i++) {
            if (messages[i].getAuteur() != u) {
                temp[index] = messages[i];
                index++;
            }
        }
        messages = temp;
        nbMessages -= count;
        nbUsers--;
    }

    public Message[] getMessages() {

        Message[] res = new Message[nbMessages];
        for (int i = 0; i < nbMessages; i++) {
            res[i] = messages[i];
        }
        return res;
    }
    public Utilisateur[] getUsers() { return utilisateurs; }
    public int getNbMessages() { return nbMessages; }
}
