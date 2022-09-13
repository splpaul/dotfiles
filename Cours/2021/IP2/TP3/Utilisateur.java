class Utilisateur {
    private String pseudo;
    private String motDePasse;
    private final String adresseMail;

    public Utilisateur(String p, String m, String a) {
        pseudo = p;
        motDePasse = m;
        adresseMail = a;
    }

    public boolean testMotDePasse(String s) {
        return (s.equals(motDePasse));
    }

    public void changerMotDePasse(String ancien, String nouveau) {
        if (ancien.equals(motDePasse))
            motDePasse = nouveau;
    }

    public String getPseudonyme() { return pseudo; }

    public void setPseudonyme(String s, String nouveauPseudo) {
        if (testMotDePasse(s)) {
                pseudo = nouveauPseudo;
            }
    }

    public String getMail() { return adresseMail; }
}
