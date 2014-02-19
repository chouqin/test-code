import java.util.Date;
import java.util.LinkedList;
import java.util.Queue;



class SleepBarber {
    public static void main(String[] arg) {
        Chair ch = new Chair(5);
        Barber barber = new Barber(ch);
        Customer customer = new Customer(ch);
        barber.start();
        customer.start();
    }
}

class Chair {
    Queue<String> chs = new LinkedList<String>();

    private int chairNumber = 0;
    private int count = 0;

    public Chair(int num) {
        count = 0;
        chairNumber = num;
    }

    public synchronized void enQueue(int customer) {
        if (count >= chairNumber){
            System.out.println("there is no Chair, the customer " + customer +" leaves");
            return;
        }
        count ++;
        System.out.println("the customer " + customer +" enter the waiting chair");
        chs.offer(Integer.toString(customer));
        notify();
    }

    public synchronized int deQueue() {
        while (count <= 0){
            try{wait(); } catch(InterruptedException e) {};
        }
        count --;
        int customer = Integer.parseInt(chs.poll());
        notify();
        return customer;
    }
}

class Barber extends Thread{
    private Chair chair;

    public Barber(Chair ch){
        chair = ch;
    }

    public void run(){
        int customer;
        try{
            while(true){
                System.out.println("Barber trying to get a customer " + new Date());
                customer = chair.deQueue();
                System.out.println("Barber get a customer " + customer + " "+ new Date());
                Thread.sleep(3000);
            }
        }catch(InterruptedException e){}
    }
}

class Customer extends Thread{
    private Chair chair;

    public Customer(Chair ch){
        chair = ch;
    }

    public void run(){
        int customer;
        try{
            for(int i = 1; i < 20; ++i){
                System.out.println("Customer " + i + " trying to get cut.");
                chair.enQueue(i);
                Thread.sleep(2000);
            }
        }catch(InterruptedException e) {}
    }
}


