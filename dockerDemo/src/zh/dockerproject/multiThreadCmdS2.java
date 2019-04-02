package zh.dockerproject;

/**
 * Created by zhanghao on 2018/10/31.
 */

class globalValue{
    public static int v = 1;
    public synchronized void addOne(){
        v++;
    }

    public static int getV() {
        return v;
    }
}

public class multiThreadCmdS2 implements Runnable{
    private String serverName = "root";
    private String serverPassword = "vt1111";
    private String senderIp;
    private String cmd;
    private String temp;
    multiThreadCmdS2(String senderIp,String cmd){
        this.senderIp = senderIp;
        this.cmd = cmd;
    }

    @Override
    public void run() {
        globalValue g = new globalValue();
        RemoteExecuteCmds r2 = new RemoteExecuteCmds(senderIp,serverName,serverPassword);
        try {
            temp = r2.exec(cmd);
            System.out.println("返回值："+temp);
            if (temp.equals("")){
                g.addOne();
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
