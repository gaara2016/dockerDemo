package zh.dockerproject;

import ch.ethz.ssh2.Connection;
import org.apache.commons.io.IOUtils;
import ch.ethz.ssh2.ChannelCondition;
import ch.ethz.ssh2.Session;
import ch.ethz.ssh2.StreamGobbler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.io.IOException;
import java.util.concurrent.CountDownLatch;

import ch.ethz.ssh2.SCPClient;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import

/**
 * Created by zhanghao on 2018/9/5.
 */
@Controller
public class configureController {
    private int port = 22;
    private String username = "root";
    private String password = "vt1111";
    private String charset = Charset.defaultCharset().toString();
    private static final int TIME_OUT = 1000 * 5 * 60;
    private String processStream(InputStream in, String charset) throws Exception {
        byte[] buf = new byte[1024];
        StringBuilder sb = new StringBuilder();
        while (in.read(buf) != -1) {
            sb.append(new String(buf, charset));
        }
        return sb.toString();
    }


    @RequestMapping(value = "/confitest",method = RequestMethod.GET)
    public ModelAndView configureFun(){
        return new ModelAndView("configure","command",new serverInfo());
        //return "configure";
    }

    @RequestMapping(value = "/configureOperation",method = RequestMethod.POST)
    public String configureOperation(@ModelAttribute("SpringWeb") serverInfo server,
                                     String getSteps,
                                     HttpServletRequest request,
                                     HttpServletResponse response) throws IOException, InterruptedException {
        String ip = server.getIp();
        System.out.println("ip:"+ip);
        String[] ipList = ip.split(",");
        //getting install_docker shell script automatically
        if (getSteps.equals("automate get scripts")){
            String localFile = "/Users/zhanghao/IdeaProjects/dockerDemo/ScriptFiles/install_docker.sh";
            String target = "/root";
            System.out.println("automate get scripts");
            for (int i=0;i<ipList.length;i++){
                System.out.println(ipList[i]);
                try {
                    Connection connection = new Connection(ipList[i],port);
                    connection.connect();
                    boolean isAuth = connection.authenticateWithPassword(username,password);
                    if (!isAuth){
                        System.out.println("Authenticate failed");
                    }
                    SCPClient client = new SCPClient(connection);
                    client.put(localFile,target);
                    connection.close();
                }catch (IOException ioe){
                    ioe.printStackTrace();
                    System.out.println(ipList[i]+" connect failed!!!");
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
            boolean flag = true;
            PrintWriter out = response.getWriter();
            out.println(flag);
//            Out.Print(flag);

        }else if (getSteps.equals("install docker")){
            int ret = -1;
            int count = 0;
            InputStream stdOut = null;
            InputStream stdErr = null;
            String outStr = "";
            String outErr = "";
            System.out.println("install docker");
            String cmds = "sh install_docker.sh";
//            String cmds = "sh test.sh";
            for (int i=0;i<ipList.length;i++){
                System.out.println("server"+i+":"+ipList[i]);
                Connection connection = new Connection(ipList[i]);
                try {
                    connection.connect();
                    boolean login = connection.authenticateWithPassword(username,password);
                    if (login){
                        Session session = connection.openSession();
                        session.execCommand(cmds);
                        stdOut = new StreamGobbler(session.getStdout());
                        outStr = processStream(stdOut,charset);
                        stdErr = new StreamGobbler(session.getStderr());
                        outErr = processStream(stdErr,charset);
                        session.waitForCondition(ChannelCondition.EXIT_STATUS, TIME_OUT);
                        System.out.println("outStr=" + outStr);
                        System.out.println("outErr=" + outErr);
                        ret = session.getExitStatus();
                        count += ret;
                    }
                }catch (IOException ioe){
                    System.out.println("install docker IOException!!");
                    ioe.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                }finally {
                    if (connection != null) {
                        connection.close();
                    }
                    IOUtils.closeQuietly(stdOut);
                    IOUtils.closeQuietly(stdErr);
                }
            }
            if (count == ipList.length){
                System.out.println("install finished!!!");
                boolean flag = true;
                PrintWriter out = response.getWriter();
                out.println(flag);
            }
        }
        else if (getSteps.equals("start docker and configure daemon")){
            String command = "systemctl daemon-reload & systemctl restart docker";
            int length = ipList.length;
            CountDownLatch startlatch = new CountDownLatch(length);
            CountDownLatch endlatch = new CountDownLatch(length);
            for (int i=0;i<ipList.length;i++){
                String s = ipList[i];
                String locate1 = "/Users/zhanghao/IdeaProjects/dockerDemo/src/files/daemon.json";
                String target1 = "/etc/docker/";
                Runnable runnable = new MultiCopyShell(s,locate1,target1,startlatch,endlatch);
                Thread thread = new Thread(runnable);
                thread.start();
                startlatch.countDown();
//                Connection connection = new Connection(ipList[i]);
//                try {
//                    connection.connect();
//                    boolean isLogin = connection.authenticateWithPassword(username,password);
//                    if (isLogin){
//                        Session session = connection.openSession();
//                        session.execCommand(command);
//                    }
//                }catch (IOException e){
//                    e.printStackTrace();
//                }
            }
            endlatch.await();
            CountDownLatch s2 = new CountDownLatch(length);
            CountDownLatch e2 = new CountDownLatch(length);
            for (int i=0;i<length;i++){
                String string = ipList[i];
                String locate2 = "/Users/zhanghao/IdeaProjects/dockerDemo/src/files/restartDocker.sh";
                String target2 = "/root/";
                Runnable runnable = new MultiCopyShell(string,locate2,target2,s2,e2);
                new Thread(runnable).start();
                s2.countDown();
            }
            e2.await();
            for (int i=0;i<length;i++){
                String s = ipList[i];
                String cmds = "sh restartDocker.sh";
                Runnable runnable = new multiThreadCMD(s,cmds);
                new Thread(runnable).start();
            }
            Boolean flag = true;
            PrintWriter out = response.getWriter();
            out.println(flag);
            System.out.println("configure daemon");
        }
        return "configure";
    }
}
