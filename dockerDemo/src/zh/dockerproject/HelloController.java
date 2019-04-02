package zh.dockerproject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by zhanghao on 2018/9/5.
 */


@Controller
public class HelloController {
    @RequestMapping("/gaaraZH")
    public String hello(){
        return "hello";
    }
}
