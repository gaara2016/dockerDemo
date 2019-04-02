package zh.dockerproject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by zhanghao on 2018/9/17.
 */
@Controller
public class virtual_machineController {
    @RequestMapping(value = "virtual_machine",method = RequestMethod.GET)
    public String virtual(){
        return "virtual_machine";
    }

}
