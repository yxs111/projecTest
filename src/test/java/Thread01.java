public class Thread01 extends Thread  {
    public Thread01(){
    }
    public void run(){
        System.out.println(Thread.currentThread().getName());
    }
    public static void main(String[] args){
        Thread01 thread01 = new Thread01();
        thread01.setName("继承Thread类的线程1");
        thread01.start();
        System.out.println(Thread.currentThread().toString());
    }
}
