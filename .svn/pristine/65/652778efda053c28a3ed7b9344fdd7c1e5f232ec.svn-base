package com.didi.didims.controller.vmanage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/errorManage")
public class ErrorController {

    @RequestMapping(value = "/unauthorized")
    public ModelAndView unauthorized(ModelAndView view) {
        view.setViewName("errorManage.unauthorized");
        return view;
    }
}
