class Message {
    private final Utilisateur auteur;
    private final Utilisateur destinataire;
    private String contenu;

    public Message(Utilisateur a, Utilisateur d, String c) {
        auteur = a;
        destinataire = d;
        contenu = c;
    }

    public String getContenu(Utilisateur u) {
        if (destinataire == u) {
            return contenu;
        }
        else {
            return "Erreur: Vous n'etes pas destinataire du message.";
        }
    }

    public Utilisateur getAuteur() { return auteur; }

    public Utilisateur getDestinataire() { return destinataire; }

    public String prettyPrint() { return auteur.getPseudonyme() + ": " + contenu; }
}
