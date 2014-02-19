public class Test {
    public static void main(String[ ] args) {
        Queen eight = new Queen(8);
        Thread t = new Thread(new Backtrack(eight, 0));
        t.start();
    }
}

