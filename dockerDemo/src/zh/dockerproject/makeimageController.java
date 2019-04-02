package zh.dockerproject;

import jxl.demo.Write;
import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * Created by zhanghao on 2018/10/31.
 */
@Controller
public class makeimageController {
    @RequestMapping(value = "make_image",method = RequestMethod.GET)
    public ModelAndView docker_image_made(){
        return new ModelAndView("docker_image_made","command",new makeimageInfo());
    }
    @RequestMapping(value = "/make_image_operation",method = RequestMethod.POST)
    public String make_image_operation(@ModelAttribute("SpringWeb")makeimageInfo makeimageinfo,
                                       String makeimageButton,
                                       HttpServletResponse response) throws InterruptedException, IOException {
        //gcc gcc-c++(g++) gdb redhat-lsb net-tools vim vsftpd ctags fuse-ntfs-3g
        //rhythmbox emacs evince gnome-utils totem gnome-system-monitor
        //# yum install openoffice.org-writer// word
        //# yum install openoffice.org-calc// Excel
        //# yum install openoffice.org-impress// PPT

        String serverIp = makeimageinfo.getServerIp();
        String applicationName = makeimageinfo.getApplicationName();
        String[] serveripList = serverIp.split(",");
        String filename;
        String realname;
        if (applicationName.equals("ppt")){
            realname = "openoffice.org-impress";
        }else if (applicationName.equals("excel")){
            realname = "openoffice.org-calc";
        }else if (applicationName.equals("word")){
            realname = "openoffice.org-writer";
        }else if (applicationName.equals("g++")){
            realname = "gcc-c++";
        }else {
            realname = applicationName;
        }
        filename = applicationName+".dockerfile";
        String path = "/Users/zhanghao/IdeaProjects/dockerDemo/src/myDockerFile/";
        String newfilename = path+filename;
        File file = new File(newfilename);
        String content = "";
        try {
            file.delete();
            if (!file.exists()){
                file.createNewFile();
                FileOutputStream fileOutputStream = new FileOutputStream(file);
                OutputStreamWriter outputStreamWriter = new OutputStreamWriter(fileOutputStream);
                BufferedWriter writer = new BufferedWriter(outputStreamWriter);
                String str1 = "FROM centos \n";
                content = content+str1;
                writer.write(str1);
                String str2 = "RUN yum -y install "+realname;
                writer.write(str2);
                content = content +str2;
                writer.close();

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        //content 用来展示

        if (content!=""){

            PrintWriter out = response.getWriter();
            out.println(content);

        }



        // 远程拷贝
        if (makeimageButton.equals("Model File")) {
            for (int i = 0; i < serveripList.length; i++) {
                String ip = serveripList[i];
                String locateFile = newfilename;
                String targetFile = "/root/myDockerFiles/";
                Runnable runnable = new multiThreadCopyShell(ip, locateFile, targetFile);
                Thread thread = new Thread(runnable);
                thread.start();
            }





        }else if (makeimageButton.equals("run")){
            //docker build -t 10.10.108.60:centos -f myDockerFiles/ctags.dockerfile ./myDockerFiles/
            String command = "docker build -t 10.10.108.60:centos -f myDockerFiles/"+filename+" ./myDockerFiles/";
            for (int i=0;i<serveripList.length;i++){
                String ip = serveripList[i];
                Runnable runnable = new multiThreadCMD(ip,command);
                Thread thread = new Thread(runnable);
                thread.start();
            }

        }
        return "docker_image_made";
    }

//    @RequestMapping(value = "/run_image_operation",method = RequestMethod.POST)
//    public String run_image_operation(){
//
//
//
//    }







}
