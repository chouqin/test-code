import java.util.Iterator;


public class Backtrack implements Runnable{

    Queen b;
    int level;

    public Backtrack (Queen b, int l) { this.b = b; level = l;}

    public void run(){
        Iterator i = b.moves(level);
        while (i.hasNext()) {
            Object move = i.next();
            if (b.valid(level, move)) {
                b.record(level, move);
                if (b.done(level)){
                    b.display();
                }
                else {
                    Queen q = new Queen(b);
                    Thread t = new Thread(new Backtrack(q, level + 1));
                    t.start();
                } // if done
                b.undo(level, move);
            } // if valid
        } // while
    }
}
