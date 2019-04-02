package zh.dockerproject;

/**
 * Created by zhanghao on 2018/11/5.
 */
public class multiThreadCopyShell implements Runnable{
    private String serverIp;
    private String username = "root";
    private String password = "vt1111";
    private String localFile ;
    private String targetFile ;
    multiThreadCopyShell(String serverIp,String localFile,String targetFile){
        this.serverIp = serverIp;
        this.localFile = localFile;
        this.targetFile = targetFile;
    }
    @Override
    public void run() {
        copy_shell copyShell = new copy_shell(serverIp,username,password);
        try {
            copyShell.putFile(localFile, targetFile);
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
