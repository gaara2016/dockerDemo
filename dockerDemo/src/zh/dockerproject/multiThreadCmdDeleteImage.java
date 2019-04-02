package zh.dockerproject;

/**
 * Created by zhanghao on 2018/10/31.
 */
public class multiThreadCmdDeleteImage implements Runnable{
    private String serverIp;
    private String serverName = "root";
    private String serverPassword = "vt1111";
    multiThreadCmdDeleteImage(String serverIp){
        this.serverIp = serverIp;
    }

    @Override
    public void run() {
        RemoteExecuteCmds rdelete = new RemoteExecuteCmds(serverIp,serverName,serverPassword);
        try {
            rdelete.exec("rm -rf /dockerDb/layers/*");
            rdelete.exec("docker stop $(docker ps -a -q)");
            rdelete.exec("docker rm $(docker ps -a -q)");
            rdelete.exec("docker rmi $(docker images -q)");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
