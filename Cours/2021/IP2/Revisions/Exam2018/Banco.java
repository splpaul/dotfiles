public class Banco {

    public static final int prix = 1;
    private static int nbTickets = 0;
    private final int numSerie;
    private int gain;
    private int nul;
    private boolean gain_scraped = false;
    private boolean nul_scraped = false;

    public Banco() {
        nbTickets++;
        numSerie = nbTickets;
        nul = Math.Random(100, 1000) + Math.random(10, 100) + Math.random(0, 10);
        gain = Math.random(1, 1000) * (Math.random(1, 10) / 10);
    }

    public void scrape_gain() {
        gain_scraped = true;
    }

    public void scrape_nul() {
        nul_scraped = true;
    }

    public int getGain() {
        if (gain_scraped) return gain;
        else return -1;
    }

    public int getNul() {
        if (nul_scraped) return nul;
        else return -1;
    }
}
