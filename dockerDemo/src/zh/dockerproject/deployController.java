package zh.dockerproject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

/**
 * Created by zhanghao on 2018/9/7.
 */
@Controller
public class deployController {
    @RequestMapping(value = "/deploytest",method = RequestMethod.GET)
    public ModelAndView deploy(){
        return new ModelAndView("deploy","command",new deployInfo());
//        return "deploy";
    }
//    @RequestMapping(value = "make_image",method = RequestMethod.GET)
//    public String docker_image_made(){
//        return "docker_image_made";
//    }
//
//    @RequestMapping(value = "select_image",method = RequestMethod.GET)
//    public String docker_image_select(){
//        return "docker_image_select";
//    }

    @RequestMapping(value = "/deployOperation",method = RequestMethod.POST)
    public String deployOperation(@ModelAttribute("SpringWeb") deployInfo deployinfo,
                                  String deployButton,
                                  HttpServletResponse response) throws InterruptedException, IOException {
        String serverIp = deployinfo.getServerIp();
        String [] serverIpList = serverIp.split(",");
        String dockerImages = deployinfo.getDockerImage();
        String [] imageList = dockerImages.split(",");
//
//        for (int i=0;i<serverIpList.length;i++){
//            System.out.println(serverIpList[i]);
//        }
//        for (int j=0;j<imageList.length;j++){
//            System.out.println(imageList[j]);
//        }
        String strategy1 = "strategy_1";
        String strategy2 = "strategy_2";
        String strategy3 = "strategy_3";

        if (deployButton.equals(strategy1)){
            System.out.println("策略1");
            String imageName = imageList[0];
            String cmd = "docker pull 10.10.108.60:5000/"+imageName;
            for (int i = 0;i<serverIpList.length;i++){
                Runnable runnable = new multiThreadCMD(serverIpList[i],cmd);
                Thread thread = new Thread(runnable);
                thread.start();
            }
            Boolean flag = true;
            PrintWriter out = response.getWriter();
            out.println(flag);
        }else if (deployButton.equals(strategy2)){
            System.out.println("策略2");
            //ArrayList<Element> arrayList = new ArrayList<Element>(Arrays.asList(array));
            ArrayList<String> useServer = new ArrayList<>(Arrays.asList(serverIpList));
            String imageName = imageList[0];
            ArrayList<String> hasContainResource = new ArrayList<>();
            hasContainResource.add("10.10.108.60");
            int indexstart = 0;
            int step = 1;
            int length1 = hasContainResource.size();
            int indexend = indexstart+length1;
            String midString = imageName+".tar.bz2 ";
            while (length1<useServer.size()){
                if (length1>useServer.size()-indexend) {
                    for (int i = indexstart;i<useServer.size();i++){
                        String senderIp = hasContainResource.get(i-indexstart);
                        String targetIp = useServer.get(i);
                        String cmds = "expect copy_targz.sh " + midString + targetIp;
                        multiThreadCmdS2 m3 = new multiThreadCmdS2(senderIp, cmds);
                        Runnable runnable = m3;
                        Thread t = new Thread(runnable);
                        t.start();
                        hasContainResource.add(targetIp);
                    }
                    length1 = hasContainResource.size();

                }else {
                    for (int i = indexstart; i < indexend; i++) {
                        String senderIp = hasContainResource.get(i - indexstart);
                        String targetIp = useServer.get(i);
                        String cmds = "expect copy_targz.sh " + midString + targetIp;
                        multiThreadCmdS2 m3 = new multiThreadCmdS2(senderIp, cmds);
                        Runnable runnable = m3;
                        new Thread(runnable).start();
                        hasContainResource.add(targetIp);
                    }
                    System.out.println("循环开始");
                    while (true) {
                        globalValue glo = new globalValue();
//                    ArrayList<String> arr = glo.getNum_success();
                        int l = glo.getV();
                        System.out.println("hasContainLength:"+l);
                        if (l == Math.pow(2, step)) {
                            break;
                        }
                    }
                    System.out.println("循环结束");
                    indexstart = indexend;
                    step += 1;
                    length1 = hasContainResource.size();
                    indexend = indexstart + length1;
                }
            }
            Boolean flag = true;
            PrintWriter out = response.getWriter();
            out.println(flag);
        }else if (deployButton.equals(strategy3)){
            System.out.println("策略3");
            String imageName = imageList[0];
            BlockingQueue<String> serverQueue = new ArrayBlockingQueue<String>(100);
            for (int i=0;i<serverIpList.length;i++){
                String sss = serverIpList[i];
                serverQueue.put(sss);
            }
            IncreaseQueue increaseQueue = new IncreaseQueue();
            increaseQueue.putOp("10.10.108.60");
            int serverLength = serverQueue.size();
            while (serverLength>0){
                String sender = increaseQueue.takeOp();
                String target = serverQueue.take();
                multiThreadCmdS3 m3 = new multiThreadCmdS3(sender,target,imageName);
                Runnable runnable = m3;
                Thread thread = new Thread(runnable);
                thread.start();
                serverLength = serverQueue.size();
                System.out.println(serverLength);
            }
            Boolean flag = true;
            PrintWriter out = response.getWriter();
            out.println(flag);
        }
        if (deployButton.equals("delete all images")){
            System.out.println("删除");
            for (int i=0;i<serverIpList.length;i++){
                String ip = serverIpList[i];
                Runnable runnable = new multiThreadCmdDeleteImage(ip);
                Thread thread = new Thread(runnable);
                thread.start();
            }
            Boolean flag = true;
            PrintWriter out = response.getWriter();
            out.println(flag);
        }
        return "deploy";
    }
}
