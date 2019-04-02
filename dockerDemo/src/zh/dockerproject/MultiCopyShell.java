package zh.dockerproject;

import java.util.concurrent.CountDownLatch;

/**
 * Created by zhanghao on 2018/12/7.
 */
public class MultiCopyShell implements Runnable{
    private String ip;
    private String username = "root";
    private String password = "vt1111";
    private String locateFile;
    private String targetFile;
    private CountDownLatch startlatch;
    private CountDownLatch endlatch;

    MultiCopyShell(String ip,String locateFile,String targetFile,
                   CountDownLatch startlatch,CountDownLatch endlatch){
        this.ip = ip;
        this.locateFile = locateFile;
        this.targetFile = targetFile;
        this.startlatch = startlatch;
        this.endlatch = endlatch;
    }

    @Override
    public void run() {
        copy_shell c = new copy_shell(ip,username,password);
        c.putFile(locateFile,targetFile);
        endlatch.countDown();
    }
}
