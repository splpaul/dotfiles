class Test {
    public static void main(String[] args) {
        Confiture c = new Confiture("Fraise", 70, 150);
        Confiture c2 = new Confiture("Framboise", 80, 130);
        Confiture c3 = new Confiture("Orange", 50, 100);
        System.out.println(c.description());
        System.out.println(c.calorieProportion(50));
        Pot p = new Pot(c, 300);
        Pot p2 = new Pot(c2, 350);
        Pot p3 = new Pot(c3, 300);
        System.out.println(p.description());
        System.out.println(p2.description());
        System.out.println(p3.description());
        System.out.println(Pot.dernierNum());
    }
}
