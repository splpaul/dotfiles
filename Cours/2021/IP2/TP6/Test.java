class Test {
    public static void main(String[] args) {
        // Automate automate = new Automate();
        // automate.addLast(false);
        // automate.add(true);
        // automate.add(true);
        // automate.add(true);
        // automate.addLast(false);
        Automate automate = new Automate("------#------", true);
        automate.affiche();
        for (int i = 0; i < 4; i++) {
            automate.uneEtape();
            automate.affiche();
        }
    }
}
