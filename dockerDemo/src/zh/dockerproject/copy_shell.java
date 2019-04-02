package zh.dockerproject;

import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.SCPClient;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * Created by zhanghao on 2018/9/21.
 */

public class copy_shell {
    private String ip;
    private String username;
    private String password;
    private final int port = 22;
    public copy_shell(String ip, String username, String password){
        this.ip = ip;
        this.username = username;
        this.password = password;
    }
    public void putFile(String localFile,String remotedirectory){
        Connection conn = new Connection(ip,port);
        try {
            conn.connect();
            boolean isAuth = conn.authenticateWithPassword(username,password);
            if (!isAuth){
                System.out.println("Authentication failed!");
            }
            SCPClient client = new SCPClient(conn);
            client.put(localFile,remotedirectory);
            conn.close();
        }catch (IOException e){
            e.printStackTrace();
        }

    }
}
