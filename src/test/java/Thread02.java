public class Thread02 {
    public static void main(String[] args){
        System.out.println(Thread.currentThread().getName());
        Thread t2 = new Thread(new MyThread02());
        t2.start();
    }
}
class MyThread02 implements Runnable{
    @Override
    public void run() {
        System.out.println(Thread.currentThread().getName());
    }
}
