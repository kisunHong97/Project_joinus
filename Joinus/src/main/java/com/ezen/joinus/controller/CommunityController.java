package com.ezen.joinus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityController {

    @GetMapping("/inquiry")
    public String community(){
        return "main/inquiry";
    }
}
