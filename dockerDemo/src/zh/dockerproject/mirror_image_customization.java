package zh.dockerproject;

/**
 * Created by zhanghao on 2018/10/31.
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class mirror_image_customization {
    @RequestMapping(value = "customization",method = RequestMethod.GET)
    public String customization(){
        return "docker_image_made";
    }

    @RequestMapping(value = "customization_select",method = RequestMethod.GET)
    public String customization_select(){
        return "docker_image_select";
    }
    int count=0;
    @RequestMapping("/imagetable_select")
    public void ajax(String type,HttpServletRequest req, HttpServletResponse resq) throws Exception{
        resq.setContentType("text/html;charset=utf-8");
//        System.out.println("####################进入imagetable_select");
//        System.out.println(type);
        //int count=0;
        if (type.equals("update")){
            count=count+1;
        }

        //gcc gcc-c++(g++) gdb redhat-lsb net-tools vim vsftpd ctags fuse-ntfs-3g
        //rhythmbox emacs evince gnome-utils totem gnome-system-monitor
        //# yum install openoffice.org-writer// word
        //# yum install openoffice.org-calc// Excel
        //# yum install openoffice.org-impress// PPT
            String data = "{" +
                    " \"draw\": 1," +
                    " \"recordsTotal\": 23," +
                    " \"recordsFiltered\": 23," +
                    " \"data\": [" +
                    " [" +
                    " \"ppt\"," +
                    " \"ppt\"" +
                    " ]," +
                    " [" +
                    " \"excel\"," +
                    " \"excel\"" +
                    " ]," +
                    " [" +
                    " \"word\"," +
                    " \"word\"" +
                    " ]," +
                    " [" +
                    " \"gnome-system-monitor\"," +
                    " \"gnome-system-monitor\"" +
                    " ]," +
                    " [" +
                    " \"totem\"," +
                    " \"totem\"" +
                    " ]," +
                    " [" +
                    " \"gnome-utils\"," +
                    " \"gnome-utils\"" +
                    " ]," +
                    " [" +
                    " \"evince\"," +
                    " \"evince\"" +
                    " ]," +
                    " [" +
                    " \"emacs\"," +
                    " \"emacs\"" +
                    " ]," +
                    " [" +
                    " \"rhythmbox\"," +
                    " \"rhythmbox\"" +
                    " ]," +
                    " [" +
                    " \"fuse-ntfs-3g\"," +
                    " \"fuse-ntfs-3g\"" +
                    " ]," +
                    " [" +
                    " \"ctags\"," +
                    " \"ctags\"" +
                    " ]," +
                    " [" +
                    " \"vsftpd\"," +
                    " \"vsftpd\"" +
                    " ]," +
                    " [" +
                    " \"vim\"," +
                    " \"vim\"" +
                    " ]," +
                    " [" +
                    " \"net-tools\"," +
                    " \"net-tools\"" +
                    " ]," +
                    " [" +
                    " \"redhat-lsb\"," +
                    " \"redhat-lsb\"" +
                    " ]," +
                    " [" +
                    " \"gdb\"," +
                    " \"gdb\"" +
                    " ]," +
                    " [" +
                    " \"g++\"," +
                    " \"g++\"" +
                    " ]," +
                    " [" +
                    " \"gcc\"," +
                    " \"gcc\"" +
                    " ]," +
                    " [" +
                    " \"dict\"," +
                    " \"dict\"" +
                    " ]," +
                    " [" +
                    " \"gedit\"," +
                    " \"gedit\"" +
                    " ]," +
                    " [" +
                    " \"gimp\"," +
                    " \"gimp\"" +
                    " ]," +
                    " [" +
                    " \"gnome-utils\"," +
                    " \"gnome-utils\"" +
                    " ]," +
                    " [" +
                    " \"gnome-system-monitors\"," +
                    " \"gnome-system-monitor\"" +
                    " ]]" +
                    "}";

            resq.getWriter().print(data);
    }
}

