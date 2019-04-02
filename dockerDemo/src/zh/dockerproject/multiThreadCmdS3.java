package zh.dockerproject;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

/**
 * Created by zhanghao on 2018/10/31.
 */

class IncreaseQueue{
    public static BlockingQueue<String> queue1 = new ArrayBlockingQueue<String>(100);
    public static BlockingQueue<String> getQueue1() {
        return queue1;
    }
    public synchronized void putOp(String ip) throws InterruptedException {
        queue1.put(ip);
    }
    public synchronized String takeOp() throws InterruptedException {
        String ip = queue1.take();
        return ip;
    }


}

public class multiThreadCmdS3 implements Runnable{
    private String root = "root";
    private String password = "vt1111";
    private String senderIp ;
    private String temp ;
    private String targetIp;
    private String imageName;
    //cmds 包括将要传输到的节点
    multiThreadCmdS3(String senderIP,String targetIp,String imageName){
        this.senderIp = senderIP;
        this.targetIp = targetIp;
        this.imageName = imageName;
    }
    @Override
    public void run() {
        IncreaseQueue increaseQueue = new IncreaseQueue();
//        long begintime = System.nanoTime();
        RemoteExecuteCmds r3 = new RemoteExecuteCmds(senderIp,root,password);
        try {
            String sMid = imageName+".tar.bz2 ";
            String cmds = "expect copy_targz.sh " + sMid +targetIp;
            temp = r3.exec(cmds);
//            System.out.println("返回值："+temp);
            if (temp.equals("")){
                increaseQueue.putOp(senderIp);
                increaseQueue.putOp(targetIp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
