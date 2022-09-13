class Test {
    public static void main(String[] args) {
        Utilisateur u = new Utilisateur("Paul", "mon super mot de passe", "paul@mail.xyz");
        //System.out.println(u.getPseudonyme());
        // u.setPseudonyme("mon super mot de passe", "mon nouveau pseudo");
        // System.out.println(u.getPseudonyme());
        Utilisateur u2 = new Utilisateur("Pierre", "son super mot de passe", "piere@mail.xyz");
        Utilisateur u3 = new Utilisateur("Jacques", "son autre super mot de passe", "jacques@mail.xyz");
        Utilisateur u4 = new Utilisateur("Michel ", "password", "michel@mail.xyz");
        Message msg = new Message(u, u2, "Salut ca va ?");
        Message msg2 = new Message(u2, u3, "Oui");
        Message msg3 = new Message(u4, u3, "Bonjour");
        Message msg4 = new Message(u, u3, "Bonjour Michel!");
        // System.out.println(msg.getContenu(u2));
        Salon salon = new Salon(u);
        salon.ajouterUtilisateur(u2);
        salon.ajouterUtilisateur(u3);
        salon.ajouterUtilisateur(u4);
        salon.ajouterMessage(msg);
        salon.ajouterMessage(msg2);
        salon.ajouterMessage(msg3);
        salon.ajouterMessage(msg4);
        Chat chat = new Chat();
        chat.ajouterSalon(salon);
        System.out.println("PREMIER SALON -----------");
        salon.afficher();
        try {
            System.out.println(chat.bavard().getPseudonyme());
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        // salon.exclure(u);
        // System.out.println("DEUXIEME SALON -----------");
        // salon.afficher();
    }
}
