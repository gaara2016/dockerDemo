package zh.dockerproject;

/**
 * Created by zhanghao on 2018/10/30.
 */
public class multiThreadCMD implements Runnable{
    private String serverIp;
    private String serverName = "root";
    private String serverPassword = "vt1111";
    private String cmd;
    multiThreadCMD(String serverIp,String cmd){
        this.serverIp = serverIp;
        this.cmd = cmd;
    }
    @Override
    public void run() {
        RemoteExecuteCmds r1 = new RemoteExecuteCmds(serverIp,serverName,serverPassword);
        try {
            r1.exec(cmd);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
